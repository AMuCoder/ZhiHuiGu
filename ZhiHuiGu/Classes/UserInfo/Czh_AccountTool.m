//  文件名: Czh_AccountTool.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_AccountTool.h"

@implementation Czh_AccountTool
// 存储账号信息
+ (void)saveAccount:(NSArray *)account{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //保存数据 用户信息；用户名；用户密码
    [userDefaults setObject:account  forKey:kUserAccountKey];
    //用户名
    [userDefaults setObject:[account objectAtIndex:0]  forKey:kUserNameKey];
    //密码
    [userDefaults setObject:[account objectAtIndex:1]  forKey:kUserPwdKey];
    //用户ID
    [userDefaults setObject:[account objectAtIndex:2]  forKey:kUserIDKey];
    //注册时间
    [userDefaults setObject:[account objectAtIndex:3]  forKey:kUserCreatedKey];
    //更新时间
    [userDefaults setObject:[account objectAtIndex:4]  forKey:kUserUpdatedKey];
    //手机号码
    [userDefaults setObject:[account objectAtIndex:5]  forKey:kUserTelKey];
    //头像Image
    [userDefaults setObject:[account objectAtIndex:6]  forKey:kUserHeadImgKey];
    //邮箱
    [userDefaults setObject:[account objectAtIndex:7]  forKey:kUserEmailKey];
    //男生女生
    [userDefaults setObject:[account objectAtIndex:8]  forKey:kUserGenderKey];
    //支付密码
    [userDefaults setObject:[account objectAtIndex:9]  forKey:kUserPayPwdKey];
    [userDefaults synchronize];
}
// 获取账号信息
+ (NSArray *)getAccount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:kUserAccountKey];
    return array;
}
// 获取用户名（手机）
+ (NSString *)getUserName{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:kUserNameKey];
    return userName;
}
// 获取密码
+ (NSString *)getPassword{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [userDefaults objectForKey:kUserPwdKey];
    return passWord;
}


@end



// 存储token
/*
 +(void)saveToken:(GCToken *)token{
 NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
 NSData *tokenData = [NSKeyedArchiver archivedDataWithRootObject:token];
 [userDefaults setObject:tokenData forKey:TOKEN_KEY];
 [userDefaults synchronize];
 }*/

// 读取token
/*
 +(GCToken *)getToken{
 NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
 NSData *tokenData = [userDefaults objectForKey:TOKEN_KEY];
 GCToken *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
 [userDefaults synchronize];
 return token;
 }
 
 // 清空token
 +(void)cleanToken{
 NSUserDefaults *UserLoginState = [NSUserDefaults standardUserDefaults];
 [UserLoginState removeObjectForKey:TOKEN_KEY];
 [UserLoginState synchronize];
 }
 
 // 跟新token
 +(GCToken *)refreshToken{
 return nil;
 }
 */
