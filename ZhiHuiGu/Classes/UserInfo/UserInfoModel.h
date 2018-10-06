//  文件名: UserInfoModel.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：返回date数据存储

#import <Foundation/Foundation.h>

@class User;

@interface UserInfoModel : NSObject <NSCoding>
/**用户Id*/
@property(nonatomic,copy)NSString *Id;
/**注册时间？*/
@property(nonatomic,copy)NSString *Created;
/**最后登录时间？*/
@property(nonatomic,copy)NSString *Updated;
/**用户名*/
@property(nonatomic,copy)NSString *Nick;
/**手机号码*/
@property(nonatomic,copy)NSString *Tel;
/**登录密码*/
@property(nonatomic,copy)NSString *Pwd;
/**头像*/
@property(nonatomic,copy)NSString *HeadImg;


//@property(nonatomic,copy)NSString *code;
//@property(nonatomic,copy)NSString *message;
/**邮箱*/
//@property(nonatomic,copy)NSString *Email;
/**性别*/
//@property(nonatomic,copy)NSString *Gender;
/**支付密码*/
//@property(nonatomic,copy)NSString *Paypwd;

@end
