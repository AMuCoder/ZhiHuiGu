//  文件名: Czh_RegularVerification.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

@interface Czh_RegularVerification : NSObject
/**
 *  获得手机号码所属营业商
 *
 *  @param mobileNum 查询的手机号码
 *
 *  @return 返回一个字符串
 */
+(NSString *)getMoblieNumType:(NSString *)mobileNum;
/**
 *  验证是不是(移动)手机号码
 *
 *  @param mobileNum 验证的手机号码字符串
 *
 *  @return 返回一个BOOL类型的值
 */
+ (BOOL)isChinaMobileNumber:(NSString *)mobileNum;
/**
 *  验证是不是(电信)手机号码
 *
 *  @param mobileNum 验证的手机号码字符串
 *
 *  @return 返回一个BOOL类型的值
 */
+(BOOL)isChinaTelecomNumber:(NSString *)mobileNum;
/**
 *  验证是不是(联通)手机号码
 *
 *  @param mobileNum 验证的手机号码字符串
 *
 *  @return 返回一个BOOL类型的值
 */
+(BOOL)isChinaUnicomNumber:(NSString *)mobileNum;
/**
 *  验证是不是合法的(邮箱)
 *
 *  @param email 邮箱
 *
 *  @return 返回一个BOOL类型的值
 */
+(BOOL)isEmail:(NSString *)email;
/**
 *  验证是不是合法的(身份证号码)
 *
 *  @param IdCardNumber 验证的身份证号字符串
 *
 *  @return 返回一个BOOL类型的值
 */
+(BOOL)isIdCardNum:(NSString *)IdCardNumber;
/**
 *  验证是不是手机号码（包含移动、联通、电信）
 *
 *  @param mobileNum 验证的手机号码字符串
 *
 *  @return 返回一个BOOL类型的值
 */
+(BOOL)isMobileNumber:(NSString *)mobileNum;

//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber;

//字符串中获取数字
+(NSString *)getNumberForString:(NSString *)str;

@end
