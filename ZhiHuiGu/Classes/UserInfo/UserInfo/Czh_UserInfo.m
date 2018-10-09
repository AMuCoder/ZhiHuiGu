//  文件名: Czh_UserInfo.m
//  创建者: CYJ 时间: 2018/10/9.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：单例Models(UserInfo)存放属性

#import "Czh_UserInfo.h"

@implementation Czh_UserInfo

@synthesize isLogin;
@synthesize id;
@synthesize tel;
@synthesize nick;
@synthesize gender;
@synthesize created;
@synthesize token;
@synthesize email;
@synthesize mnemonic;//助记词
@synthesize address;//公钥地址
@synthesize seed;
@synthesize head_img;

@synthesize cookie;
@synthesize tabBarSelected;
@synthesize deviceid;

- (void)encodeWithCoder:(NSCoder *)aCoder{
#pragma mark ------------------------------------------
    [aCoder encodeBool:self.isLogin     forKey:@"isLogin"];
    [aCoder encodeObject:self.id          forKey:kUserIDKey];
    [aCoder encodeObject:self.tel       forKey:kUserTelKey];
    [aCoder encodeObject:self.nick        forKey:kUserNameKey];
    [aCoder encodeObject:self.gender    forKey:kUserGenderKey];
    [aCoder encodeObject:self.created     forKey:kUserCreatedKey];
    [aCoder encodeObject:self.updated     forKey:kUserUpdatedKey];
    [aCoder encodeObject:self.token     forKey:kUserTokenKey];
    [aCoder encodeObject:self.email       forKey:kUserEmailKey];
    
    [aCoder encodeObject:self.mnemonic     forKey:kUserMnemonicKey];
    [aCoder encodeObject:self.address     forKey:kUserAddressKey];
    [aCoder encodeObject:self.seed       forKey:kUserSeedKey];
    
    [aCoder encodeObject:self.head_img  forKey:kUserHeadImgKey];
#pragma mark ------------------------------------------
    [aCoder encodeObject:self.cookie forKey:@"cookie"];
    [aCoder encodeInteger:self.tabBarSelected forKey:@"tabBarSelected"];
    [aCoder encodeObject:self.deviceid forKey:@"deviceid"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self =[super init]) {
#pragma mark ------------------------------------------
        self.isLogin =              [aDecoder decodeBoolForKey:@"isLogin"];
        self.id =                   [aDecoder decodeObjectForKey:kUserIDKey];
        self.tel =                  [aDecoder decodeObjectForKey:kUserTelKey];
        self.nick =                 [aDecoder decodeObjectForKey:kUserNameKey];
        self.gender =               [aDecoder decodeObjectForKey:kUserGenderKey];
        self.created =              [aDecoder decodeObjectForKey:kUserCreatedKey];
        self.updated =              [aDecoder decodeObjectForKey:kUserUpdatedKey];
        self.token =                [aDecoder decodeObjectForKey:kUserTokenKey];
        self.email =                [aDecoder decodeObjectForKey:kUserEmailKey];
        
        self.mnemonic =             [aDecoder decodeObjectForKey:kUserMnemonicKey];
        self.address =              [aDecoder decodeObjectForKey:kUserAddressKey];
        self.seed =                 [aDecoder decodeObjectForKey:kUserSeedKey];
        
        self.head_img =             [aDecoder decodeObjectForKey:kUserHeadImgKey];
#pragma mark ------------------------------------------
        
        
        self.cookie =           [aDecoder decodeObjectForKey:@"cookie"];
        self.tabBarSelected =   [aDecoder decodeIntegerForKey:@"tabBarSelected"];
        self.deviceid =         [aDecoder decodeObjectForKey:@"deviceid"];
    }
    return self;
}

@end
