//  文件名: UserInfoTool.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：处理账号相关的所有操作:存储账号、取出账号、验证账号

#import "UserInfoTool.h"

// 账号的存储路径
#define HWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userInfo.archive"]

#define JYCGroupPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"groupInfo.archive"]

@implementation UserInfoTool

/**
 *  存储账号信息
 *
 *  @param info 账号模型
 */
+ (void)saveInfo:(UserInfo *)info
{
    // 自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:info toFile:HWAccountPath];
}


/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (UserInfo *)info
{
    // 加载模型
    UserInfo *user = [NSKeyedUnarchiver unarchiveObjectWithFile:HWAccountPath];
    
    return user;
}
@end
