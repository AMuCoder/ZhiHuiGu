//  文件名: User.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, copy) NSString *userID;    //用户ID
@property (nonatomic, copy) NSString *user_name; //姓名
@property (nonatomic, copy) NSString *password;   //密码
@property (nonatomic, copy) NSString *level; //水平
@property (nonatomic, copy) NSString *true_name;     //真实姓名
@property (nonatomic, copy) NSString *sex; //性别
@property (nonatomic, copy) NSString *birthday; //生日
@property (nonatomic, copy) NSString *tel; //电话
@property (nonatomic, copy) NSString *address; //地址
@property (nonatomic, copy) NSString *bumen; //部门
@property (nonatomic, copy) NSString *score; //积分
@property (nonatomic, copy) NSString *update_time; //更新时间
@property (nonatomic, copy) NSString *state; //状态
@property (nonatomic, copy) NSString *number;  //编号 eg :SCB-00001
@property (nonatomic, copy) NSString *addtime;  //添加时间
@property (nonatomic, copy) NSString *bumen_name; //部门名称

//用户模型单例
+ (instancetype)sharedInstance;

//存储用户信息
+ (BOOL)synchronize;

//是否登录
+ (BOOL)isLogIn;

//退出App
+ (BOOL)logout;

@end
