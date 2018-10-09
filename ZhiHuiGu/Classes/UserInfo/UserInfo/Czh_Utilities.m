//  文件名: Czh_Utilities.m
//  创建者: CYJ 时间: 2018/10/9.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：为了更好的简便的使用这个这个单例和NSUserDefaults的读取和存储

#import "Czh_Utilities.h"
#import "Czh_UserInfo.h"

@implementation Czh_Utilities

//存储单例Models(UserInfo)到NSUserDefaults
+ (void)SetNSUserDefaults:(Czh_UserInfo *)userInfo{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userInfo];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:@"Czh_User"];
    [defaults synchronize];
}
//读取NSUserDefaults存储内容return到单例Modesl(UserInfo)中
+ (Czh_UserInfo *)GetNSUserDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"Czh_User"];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end

/*
//在请求数据成功时
//存储在单例中
Czh_UserInfo *userinfo = [Czh_UserInfoContext sharedUserInfoContext].userInfo;
userinfo.isLogin = YES;
userinfo.phoneNumber = @"13552539636"
userinfo.cookie = @"QQ396368888";
//启动app默认选中TabBar
userinfo.tabBarSelected = 0;
//在把单例存储到NSUserDefaults(调用工具类方法)
[Czh_Utilities SetNSUserDefaults:userinfo];

在AppDelegate类中得didFinishLaunchingWithOptions方法中直接读取NSUserDefaults内容到单例使用
 
 //读取用户状态和配置信息到单例中
 [Czh_UserInfoContext sharedUserInfoContext].userInfo= [Czh_Utilities GetNSUserDefaults];
*/




//            Czh_UserInfo *userinfo = [Czh_UserInfoContext sharedUserInfoContext].userInfo;
//            userinfo.isLogin = YES;
//            userinfo.id = data[@"data"][@"user"][@"id"];/
//            userinfo.tel = data[@"data"][@"user"][@"tel"];/
//            userinfo.nick = data[@"data"][@"user"][@"nick"];/
//            userinfo.updated = data[@"data"][@"user"][@"updated"];/
//            userinfo.created = data[@"data"][@"user"][@"created"];/
//            userinfo.email = data[@"data"][@"user"][@"email"];/
//            userinfo.gender = data[@"data"][@"user"][@"gender"];/
//            userinfo.mnemonic = data[@"data"][@"mnemonic"];
//            userinfo.token = data[@"data"][@"token"];
//
//            NSArray *keypairsArr = [NSArray array];
//            keypairsArr = data[@"data"][@"keypairs"];
//            NSDictionary *keypairsDict = [NSDictionary dictionary];
//            keypairsDict = keypairsArr.firstObject;
//
//            userinfo.address = keypairsDict[@"address"];
//            userinfo.seed = keypairsDict[@"Seed"];
//            //在把单例存储到NSUserDefaults(调用工具类方法)
//            [Czh_Utilities SetNSUserDefaults:userinfo];
