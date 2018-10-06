//  文件名: UserInfoTool.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：处理账号相关的所有操作:存储账号、取出账号、验证账号

#import <Foundation/Foundation.h>
@class UserInfo;
@interface UserInfoTool : NSObject

/**
 *  存储账号信息
 *
 *  @param info 账号模型
 */
+ (void)saveInfo:(UserInfo *)info;
/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (UserInfo *)info;

@end
