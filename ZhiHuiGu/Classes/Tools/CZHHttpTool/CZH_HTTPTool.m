//  文件名: CZH_HTTPTool.m
//  创建者: CYJ 时间: 2018/9/30.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import "CZH_HTTPTool.h"
#import "AFNetworking.h"

@implementation CZH_HTTPTool
+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(CZHRequestSuccess)success failure:(CZHRequestFailure)failure
{
    [[AFHTTPSessionManager manager] GET:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        !success ? : success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        !failure ? : failure(error);
    }];
}

+ (void)POST:(NSString *)url params:(NSDictionary *)params success:(CZHRequestSuccess)success failure:(CZHRequestFailure)failure
{
    [[AFHTTPSessionManager manager] POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        !success ? : success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        !failure ? : failure(error);
    }];
}
@end
