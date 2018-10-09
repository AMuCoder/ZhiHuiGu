//  文件名: Czh_Utilities.h
//  创建者: CYJ 时间: 2018/10/9.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：为了更好的简便的使用这个这个单例和NSUserDefaults的读取和存储

#import <Foundation/Foundation.h>
#import "Czh_UserInfo.h"
#import "Czh_UserInfoContext.h"

@interface Czh_Utilities : NSObject

//单例-> NSUserDefaults
+ (void)SetNSUserDefaults:(Czh_UserInfo *)userInfo;
//NSUserDefaults-> 单例
+ (Czh_UserInfo *)GetNSUserDefaults;

@end
