//  文件名: Czh_SingleObject.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>
@class UserInfoModel,User;

@interface Czh_SingleObject : NSObject

@property(strong,nonatomic)UserInfoModel *userInfoModel;
@property(nonatomic,strong) User *user;

+(id)getInstance;
+(void)attempDealloc;
@end
