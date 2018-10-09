//  文件名: Czh_UserInfo.h
//  创建者: CYJ 时间: 2018/10/9.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：单例Models(UserInfo)存放属性

#import <Foundation/Foundation.h>

@interface Czh_UserInfo : NSObject
{
    BOOL isLogin;//判断是否登录
    NSString *id;//ID
    NSString *tel;//TEL
    NSString *nick;//nick
    NSString *gender;//gender
    NSString *created;//created
    NSString *updated;//updated
    NSString *token;//token
    NSString *email;//email
    NSString *mnemonic;//助记词
    NSString *address;//公钥地址
    NSString *seed;
    NSArray *head_img;//head_img
    
    NSString *cookie;//cookie
    NSInteger tabBarSelected;//tabbar
    NSString *deviceid;//设备号
}
//是否登录
@property (nonatomic,assign) BOOL isLogin;
//用户id
@property (nonatomic, copy) NSString *id;
//tel：电话号码
@property (nonatomic, copy) NSString *tel;
//nick：用户名
@property (nonatomic, copy) NSString *nick;
//gender：男女
@property (nonatomic, copy) NSString *gender;
//created：创建时间
@property (nonatomic, copy) NSString *created;
//created：更新时间
@property (nonatomic, copy) NSString *updated;
//token：token值
@property (nonatomic, copy) NSString *token;
//邮箱
@property (nonatomic, copy) NSString *email;
@property(nonatomic,copy) NSString *mnemonic;//助记词
@property(nonatomic,copy) NSString *address;//公钥地址
@property(nonatomic,copy) NSString *seed;

//head_img：头部图片信息
@property (nonatomic, strong) NSArray *head_img;



#pragma mark
@property (nonatomic,copy) NSString *cookie;
@property (nonatomic,assign) NSInteger tabBarSelected;
@property (nonatomic,copy) NSString *deviceid;


@end
