/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
import ReactAES from 'react-native-aes-encryption';

function test() {
    const key="hell@123456";

    //128bit
    ReactAES.generateRandomIV(16).then(
        result=>{
            console.log("random iv result is: ", result);
        }
    ).catch(
        error => {
            console.log(error);
        }
    );

    ReactAES.md5("hello")
        .then(result => {
            console.log("md5 result is: ", result);
        })
        .catch(error => {
            console.log(error);
        });

    //32 bit length--"d13feb0b7ed7395ccb96e3b603d24705"
    ReactAES.sha256(key, 32).then(
        result => {
            console.log("sha256 is: ", result);
        }
    ).catch(
        error=>{
            console.log(error);
        }
    );

    const password = "abcd";

    ReactAES.encrypt(password,"d13feb0b7ed7395ccb96e3b603d24705","RHmr7oOkWR+Zhqg=").then(
        result=>{
            console.log("encrypt str is:"+result);
            ReactAES.decrypt(result,"d13feb0b7ed7395ccb96e3b603d24705","RHmr7oOkWR+Zhqg=").then(
                result=>{
                    console.log("plain str is:"+result);
                }
            ).catch(
                error => {
                    console.log(error);
                }
            );
        }
    ).catch(
        error => {
            console.log(error);
        }
    );
}

class example extends Component {
  render() {

      test();
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.android.js
        </Text>
        <Text style={styles.instructions}>
          Shake or press menu button for dev menu
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('example', () => example);
