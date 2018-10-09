//  文件名: Czh_AccountTool.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_AccountTool.h"

@implementation Czh_AccountTool
#pragma mark 类方法，快速获得单例对象
+(instancetype)shareAccount{
    return [[self alloc] init];
}
#pragma mark 分配内存创建对象
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static Czh_AccountTool *acount;
    
    // 为了线程安全
    static dispatch_once_t onceToken;
    
    // 下面的代码在程序运行过程中，只会执行一次
    dispatch_once(&onceToken, ^{
        acount = [super allocWithZone:zone];
        
        //从沙盒获取上次的用户登录信息
        NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
        acount.UserNick =           [defaults objectForKey:kUserNameKey];
        acount.UserPassWd =         [defaults objectForKey:kUserPwdKey];
        acount.UserID =             [defaults objectForKey:kUserIDKey];
        acount.UserCreated =        [defaults objectForKey:kUserCreatedKey];
        acount.UserUpdated =        [defaults objectForKey:kUserUpdatedKey];
        acount.UserTel =            [defaults objectForKey:kUserTelKey];
        acount.UserEmail =          [defaults objectForKey:kUserEmailKey];
        acount.UserGender =         [defaults objectForKey:kUserGenderKey];
        acount.UserPayPWd =         [defaults objectForKey:kUserPayPwdKey];
        acount.UserToken =          [defaults objectForKey:kUserTokenKey];
        acount.UserMnemonic =       [defaults objectForKey:kUserMnemonicKey];
        acount.UserAddress =        [defaults objectForKey:kUserAddressKey];
        acount.UserSeed =           [defaults objectForKey:kUserSeedKey];
        acount.login = NO;//设置为未登陆状态
        
        //acount.login = [defaults boolForKey:kLoginKey];
        /** 记录密码是否过期 */
        acount.tokenOverdue = NO;
        
        /** 记录密码过期是否已提示 */
        acount.tokenOverdueTipOff = NO;
    });
    return acount;
}
-(void)saveToSandBox{
    
    // 保存user pwd login
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.UserNick forKey:kUserNameKey];
    [defaults setObject:self.UserPassWd forKey:kUserPwdKey];
    [defaults setObject:self.UserID forKey:kUserIDKey];
    [defaults setObject:self.UserCreated forKey:kUserCreatedKey];
    [defaults setObject:self.UserUpdated forKey:kUserUpdatedKey];
    [defaults setObject:self.UserTel forKey:kUserTelKey];
    [defaults setObject:self.UserEmail forKey:kUserEmailKey];
    [defaults setObject:self.UserGender forKey:kUserGenderKey];
    [defaults setObject:self.UserPayPWd forKey:kUserPayPwdKey];
    [defaults setObject:self.UserToken forKey:kUserTokenKey];
    [defaults setObject:self.UserMnemonic forKey:kUserMnemonicKey];
    [defaults setObject:self.UserAddress forKey:kUserAddressKey];
    //[defaults setBool:self.isLogin forKey:kLoginKey];//登陆状态不能保存到沙盒，否则会有问题，进入app后，可能就处于登录状态了
    [defaults synchronize];
    
}

// 存储账号信息
+ (void)saveAccount:(NSArray *)accountArray{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //保存数据 用户信息；用户名；用户密码
    [userDefaults setObject:accountArray  forKey:kUserAccountKey];
    [userDefaults setObject:[accountArray objectAtIndex:0]  forKey:kUserNameKey];//用户名
    [userDefaults setObject:[accountArray objectAtIndex:1]  forKey:kUserPwdKey];//密码
    [userDefaults setObject:[accountArray objectAtIndex:2]  forKey:kUserIDKey];//用户ID
    [userDefaults setObject:[accountArray objectAtIndex:3]  forKey:kUserCreatedKey];//注册时间
    [userDefaults setObject:[accountArray objectAtIndex:4]  forKey:kUserUpdatedKey];//更新时间
    [userDefaults setObject:[accountArray objectAtIndex:5]  forKey:kUserTelKey];//手机号码
    [userDefaults setObject:[accountArray objectAtIndex:6]  forKey:kUserHeadImgKey];//头像Image
    [userDefaults setObject:[accountArray objectAtIndex:7]  forKey:kUserEmailKey];//邮箱
    [userDefaults setObject:[accountArray objectAtIndex:8]  forKey:kUserGenderKey];//男生女生
    [userDefaults setObject:[accountArray objectAtIndex:9]  forKey:kUserPayPwdKey];//支付密码
    [userDefaults synchronize];
}
// 获取账号信息
+ (NSArray *)getAccount{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *array = [userDefaults objectForKey:kUserAccountKey];
    return array;
}
// 获取用户名
+ (NSString *)getUserName{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:kUserNameKey];
    return userName;
}
// 获取密码
+ (NSString *)getUserPassWd{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [userDefaults objectForKey:kUserPwdKey];
    return passWord;
}
/**
 *  登录的ID
 */
+ (NSString *)getUserID{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userID = [userDefaults objectForKey:kUserIDKey];
    return userID;
}
/**
 *  登录的手机号
 */
+ (NSString *)getUserTel{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userTel = [userDefaults objectForKey:kUserTelKey];
    return userTel;
}
/**
 *  登录的邮箱
 */
+ (NSString *)getUserEmail{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userEmail = [userDefaults objectForKey:kUserEmailKey];
    return userEmail;
}
/**
 *  TOKEN
 */
+ (NSString *)getUserToken{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userToken = [userDefaults objectForKey:kUserTokenKey];
    return userToken;
}
/**
 *  支付密码
 */
+ (NSString *)getUserPayPWd{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userPayPWd = [userDefaults objectForKey:kUserPayPwdKey];
    return userPayPWd;
}
/**
 *  seed
 */
+ (NSString *)getUserSeed{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userSeed = [userDefaults objectForKey:kUserSeedKey];
    return userSeed;
}
/**
 *  助记词
 */
+ (NSString *)getUserMnemonic{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userMnemonic = [userDefaults objectForKey:kUserMnemonicKey];
    return userMnemonic;
}
/**
 *  公钥地址
 */
+ (NSString *)getUserAddress{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userAddress = [userDefaults objectForKey:kUserAddressKey];
    return userAddress;
}

/**
 *  用户男女
 */
+ (NSString *)getUserGender{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userGender = [userDefaults objectForKey:kUserGenderKey];
    return userGender;
}
/**
 *  用户头像
 */
+ (NSString *)getUserHead_img{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userHead_img = [userDefaults objectForKey:kUserHeadImgKey];
    return userHead_img;
}
//+ (BOOL *)getUserisLogin{
//    BOOL defaults = [[NSUserDefaults standardUserDefaults] boolForKey:kUserisLogin];
//    return &defaults;
//    //[defaults setBool: 布尔值 forKey:@"kUserisLogin"];
//}
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
