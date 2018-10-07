//  文件名: Czh_SingleObject.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>
#import "Czh_SetInfoModel.h"
#import "UserInfoModel.h"
#import "User.h"

@interface Czh_SingleObject : NSObject

@property(strong,nonatomic)UserInfoModel *userInfoModel;
@property(nonatomic,strong)User *user;
@property(strong,nonatomic)Czh_SetInfoModel *setInfoModel;

@property(strong,nonatomic)NSString *loginSelectStr;//0手机登陆 1用户名登录

+(id)getInstance;
+(void)attempDealloc;
@end
