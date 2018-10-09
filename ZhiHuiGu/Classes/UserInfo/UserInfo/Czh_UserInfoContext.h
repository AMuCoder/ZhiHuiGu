//  文件名: Czh_UserInfoContext.h
//  创建者: CYJ 时间: 2018/10/9.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>
#import "Czh_UserInfo.h"

@interface Czh_UserInfoContext : NSObject

@property(nonatomic,strong) Czh_UserInfo *userInfo;

/**
 类方法
 @return Czh_UserInfoContext 调用
 */
+ (Czh_UserInfoContext *)sharedUserInfoContext;

@end
