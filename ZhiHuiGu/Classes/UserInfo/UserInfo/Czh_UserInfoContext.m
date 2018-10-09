//  文件名: Czh_UserInfoContext.m
//  创建者: CYJ 时间: 2018/10/9.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：单例类(UserInfoContext)

#import "Czh_UserInfoContext.h"



@implementation Czh_UserInfoContext
@synthesize userInfo;

static Czh_UserInfoContext *sharedUserInfoContext = nil;
+ (Czh_UserInfoContext *)sharedUserInfoContext{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if(sharedUserInfoContext == nil){
            sharedUserInfoContext = [[self alloc] init];
        }
    });
    return sharedUserInfoContext;
}
+(id)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if(sharedUserInfoContext == nil){
            sharedUserInfoContext = [super allocWithZone:zone];
        }
    });
    return sharedUserInfoContext;
}
- (instancetype)init{
    self = [super init];
    if(self){
        //实例化这个Models
        sharedUserInfoContext.userInfo = [[Czh_UserInfo alloc] init];
    }
    return self;
}
- (id)copy{
    return self;
}
- (id)mutableCopy{
    return self;
}

@end
