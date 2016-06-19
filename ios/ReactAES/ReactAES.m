//
//  ReactAES.m
//  ReactAES
//
//  Created by Yungui Dai on 16/6/19.
//  Copyright © 2016年 fanday. All rights reserved.
//

#import "ReactAES.h"
#import "CryptLib.h"
#import "NSData+Base64.h"
#import "RCTLog.h"

@implementation ReactAES

RCT_EXPORT_MODULE(ReactAES);

RCT_EXPORT_METHOD(encrypt:(NSString *)plainText key:(NSString *)key iv:(NSString *)iv resolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject) {
    StringEncryption *cryptLib = [[StringEncryption alloc]init];
    NSData *encryptData = [cryptLib encrypt:[plainText dataUsingEncoding:NSUTF8StringEncoding] key:key iv:iv];
    NSString *encryptStr =  [encryptData base64EncodingWithLineLength:0];
    if(encrypt){
        resolve(encryptStr);
    }else{
        reject(@"-1", @"encrypt failed", nil);
    }
    
}

RCT_EXPORT_METHOD(decrypt:(NSString *)encryptedText key:(NSString *)key iv:(NSString *)iv resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    StringEncryption *cryptLib = [[StringEncryption alloc]init];
    NSData * decryptData = [cryptLib decrypt:[encryptedText dataUsingEncoding:NSUTF8StringEncoding] key:key iv:iv];
    NSString *decryptText = [decryptData base64EncodedStringWithSeparateLines:0];
    if(decryptText){
        resolve(decryptText);
    }else{
        reject(@"-1", @"decrypt failed", nil);
    }
    
}

RCT_EXPORT_METHOD(generateRandomIV:(NSInteger)length resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    StringEncryption *cryptLib = [[StringEncryption alloc]init];
    NSData *ivData = [cryptLib generateRandomIV:length];
    NSString *ivText = [ivData base64EncodedStringWithSeparateLines:0];
    if(ivText){
        resolve(ivText);
    }else{
        reject(@"-1", @"get iv failed", nil);
    }
}

RCT_EXPORT_METHOD(md5:(NSString *)input resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    RCTLogInfo(@"input: %@", input);
    StringEncryption *cryptLib = [[StringEncryption alloc]init];
    NSString *md5= [cryptLib md5:input];
    if(md5){
        resolve(md5);
    }else{
        reject(@"-1", @"md5 failed", nil);
    }
 
}

RCT_EXPORT_METHOD(sha256:(NSString *)key length:(NSInteger) length resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    StringEncryption *cryptLib = [[StringEncryption alloc]init];
    NSString *sha256 = [cryptLib sha256:key length:length];
    if(sha256){
        resolve(sha256);
    }else{
        reject(@"-1", @"sha256 failed", nil);
    }
}

@end
