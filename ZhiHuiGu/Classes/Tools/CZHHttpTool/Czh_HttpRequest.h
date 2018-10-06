//  文件名: Czh_HttpRequest.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

//请求成功代码块
typedef void(^SuccessBlock)(id obj);
//请求失败代码块
typedef void(^FailBlock)(NSError *error);

typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD,
} HTTPMethod;

@interface Czh_HttpRequest : NSObject

+ (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
                WithToken:(NSString *)token
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(void (^)(id data))success
          WithFailurBlock:(void (^)(NSString *error))failure
        WithShowHudToView:(UIView *)view;

//同步
+(NSData *)imagesSynRequest:(NSString *)urlStr;

//post同步
+(void)postSynRequest:(NSString *)urlStr
   andtimeoutInterval:(NSTimeInterval)times
            andParams:(NSDictionary *)paramDict
          andSucBlock:(SuccessBlock)sucBlock
         andFailBlock:(FailBlock)failBlock;


@end
