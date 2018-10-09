//  文件名: Czh_AccountTool.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

@interface Czh_AccountTool : NSObject
/**
 *  登录的用户名
 */
@property(nonatomic,copy)NSString *UserNick;
/**
 *  登录的密码
 */
@property(nonatomic,copy)NSString *UserPassWd;
/**
 *  登录的ID
 */
@property(nonatomic,copy)NSString *UserID;
/**
 *  登录的手机号
 */
@property(nonatomic,copy)NSString *UserTel;
/**
 *  登录的邮箱
 */
@property(nonatomic,copy)NSString *UserEmail;
/**
 *  支付密码
 */
@property(nonatomic,copy)NSString *UserPayPWd;
/**
 *  助记词
 */
@property(nonatomic,copy)NSString *UserMnemonic;
/**
 *  公钥地址
 */
@property(nonatomic,copy)NSString *UserAddress;
/**
 *  see
 */
@property(nonatomic,copy)NSString *UserSeed;

/**
 *  TOKEN
 */
@property(nonatomic,copy)NSString *UserToken;
/**
 *  创建时间
 */
@property(nonatomic,copy)NSString *UserCreated;
/**
 *  更新时间
 */
@property(nonatomic,copy)NSString *UserUpdated;
/**
 *  用户头像
 */
@property(nonatomic,copy)NSString *UserHead_img;
/**
 *  用户男女
 */
@property(nonatomic,copy)NSString *UserGender;
/**
 *  判断用户是否登录
 */
@property(nonatomic,assign,getter=isLogin)BOOL login;
/**
 *  系统时间（用于判断合约下载）
 */
@property(nonatomic,copy)NSString *systemTime;
/** 屏幕常亮状态 */
@property (nonatomic, assign,getter=isScreenBright) BOOL ScreenBright;
/** token值是否过期 */
@property (nonatomic, assign,getter=istokenOverdue) BOOL tokenOverdue;

/** token值过期是否已提示 */
@property (nonatomic, assign,getter=istokenOverdueTipOff) BOOL tokenOverdueTipOff;

/** 记住密码 */
@property (nonatomic, assign,getter=isPwdBoxChecked) BOOL PwdBoxChecked;

/**
 *  保存最新的登录用户数据到沙盒
 */
-(void)saveToSandBox;
/**
 * 应用第一次打开的时候，调用 － 用于对一些属性值做出厂设置
 */
//-(void)setInitData;

//********************************************************************

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
+ (NSString *)getUserPassWd;
/**
 *  登录的ID
 */
+ (NSString *)getUserID;
/**
 *  登录的手机号
 */
+ (NSString *)getUserTel;
/**
 *  登录的邮箱
 */
+ (NSString *)getUserEmail;
/**
 *  TOKEN
 */
+ (NSString *)getUserToken;
/**
 *  支付密码
 */
+ (NSString *)getUserPayPWd;
/**
 *  seed
 */
+ (NSString *)getUserSeed;
/**
 *  助记词
 */
+ (NSString *)getUserMnemonic;
/**
 *  公钥地址
 */
+ (NSString *)getUserAddress;
/**
 *  用户男女
 */
+ (NSString *)getUserGender;
/**
 *  用户头像
 */
+ (NSString *)getUserHead_img;
//********************************************************************
@end
