package fnd.reactaes.reactaes;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import java.lang.String;

/**
 * Created by daiyungui on 16/6/19.
 */
public class ReactAES  extends ReactContextBaseJavaModule{
    public ReactAES(ReactApplicationContext reactContext){
        super(reactContext);
    }

    @Override
    public String getName(){
        return "ReactAES";
    }

    @ReactMethod
    public void md5(final String inputString,Promise promise) {
        try {
            String md5Text = CryptLib.md5(inputString);
            promise.resolve(md5Text);
        } catch (Exception e) {
            promise.reject("-1","md5 failed");
        }
    }

    @ReactMethod
    public void encrypt(final String plainText, final String key,final String iv, Promise promise){
        try {
            CryptLib _crypt = new CryptLib();
            String encrytedText = _crypt.encrypt(plainText, key, iv); //encrypt
            promise.resolve(encrytedText);
        } catch (Exception e) {
            promise.reject("-1","encrypt failed");
        }
    }

    @ReactMethod
    public void decrypt(final String encryptedText, final String key, final String iv, Promise promise){
        try {
            CryptLib _crypt = new CryptLib();
            String plainText = _crypt.decrypt(encryptedText, key,iv); //decrypt
            promise.resolve(plainText);
        } catch (Exception e) {
            promise.reject("-1","decrypt failed");
        }

    }

    @ReactMethod
    public void generateRandomIV(Integer length, Promise promise){
        try {
            String iv = CryptLib.generateRandomIV(length);
            promise.resolve(iv);
        } catch (Exception e) {
            promise.reject("-1","gen iv failed");
        }

    }

    @ReactMethod
    public void sha256(final String key,Integer length,Promise promise ){
        try {
            String returnKey = CryptLib.SHA256(key, length);
            promise.resolve(returnKey);

        } catch (Exception e) {
            promise.reject("-1","sha256 failed");
        }
    }
}
