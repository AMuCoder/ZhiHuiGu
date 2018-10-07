//  文件名: Czh_AccountTool.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

//账号信息（数组）
#define kUserAccountKey @"Account"
//用户名
#define kUserNameKey @"Nick"
//密码
#define kUserPwdKey @"Pwd"
//用户ID
#define kUserIDKey @"Id"
//注册时间
#define kUserCreatedKey @"CreatedTime"
//更新时间
#define kUserUpdatedKey @"UpdatedTime"
//手机号码
#define kUserTelKey @"Tel"
//头像Image
#define kUserHeadImgKey @"HeadImg"
//邮箱
#define kUserEmailKey @"Email"
//男生女生
#define kUserGenderKey @"Gender"
//支付密码
#define kUserPayPwdKey @"PayPwd"

@interface Czh_AccountTool : NSObject

/**
 *  存储账号信息
 * @param account 需要存储的账号信息：第一个值为用户名；第二个值为密码
 */
+ (void)saveAccount:(NSArray *)account;

/**
 *  返回存储的账号信息
 * @return NSArray */
+ (NSArray *)getAccount;

/**
 *  返回存储的登陆用户名 *
 @return NSString */
+ (NSString *)getUserName;

/**
 *  返回存储的登陆用户密码
 *  @return NSString */
+ (NSString *)getPassword;


@end
