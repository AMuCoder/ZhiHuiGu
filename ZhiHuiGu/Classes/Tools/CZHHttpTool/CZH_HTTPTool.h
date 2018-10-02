//  文件名: CZH_HTTPTool.h
//  创建者: 阿木 时间: 2018/9/30.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

typedef void (^CZHRequestSuccess)(id json);
typedef void (^CZHRequestFailure)(NSError *error);

@interface CZH_HTTPTool : NSObject

+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(CZHRequestSuccess)success failure:(CZHRequestFailure)failure;

+ (void)POST:(NSString *)url params:(NSDictionary *)params success:(CZHRequestSuccess)success failure:(CZHRequestFailure)failure;

@end
