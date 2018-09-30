//  文件名: CZHAFNetWorKingAssistant.h
//  创建者: CYJ 时间: 2018/9/30.
//  Copyright © 2018年 CYJ. All rights reserved.
//  AFNetworking单例封装
/*
 NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
 parameters[@"loginName"] = _name.text;
 parameters[@"loginPwd"]  = _pwd.text;
 parameters[@"equipmentInfo"] = identifierforvendor;
 parameters[@"iostoken"] = tokenValue;
 */
#import <Foundation/Foundation.h>

#define ShareDefaultNetAssistant [CZHAFNetWorKingAssistant shareAssistant]

@interface CZHAFNetWorKingAssistant : NSObject

+(CZHAFNetWorKingAssistant *)shareAssistant;
//常用网络请求方法
-(void)POSTWithCompleteURL:(NSString *)URLString
                parameters:(id)parameters
                  progress:(void(^)(id progress))progress
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure
                  useHTTPS:(BOOL)use;
//常用网络请求方法
-(void)POSTWithCompleteURL:(NSString *)URLString
                parameters:(id)parameters
                  progress:(void(^)(id progress))progress
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure;

-(void)GETWithCompleteURL:(NSString *)URLString
               parameters:(id)parameters
                 progress:(void(^)(id progress))progress
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure;

/**
 *  图片上传
 *
 *  @param imgArr 图片数组
 *  @param block  返回图片地址数组
 */
- (void)uploadImagesWihtImgArr:(NSArray *)imgArr
                           url:(NSString *)url
                    parameters:(id)parameters
                         block:(void (^)(id objc,BOOL success))block;

/**
 文件下载
 
 @param urlString 请求地址
 @param block 状态通知
 */
- (void)downFileWithUrl:(NSString *)urlString
                  block:(void (^)(id objc,BOOL success))block;


@end
