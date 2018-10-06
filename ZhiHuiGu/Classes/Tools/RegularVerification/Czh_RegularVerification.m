//  文件名: Czh_RegularVerification.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_RegularVerification.h"

@implementation Czh_RegularVerification

/**获取手机号码所属营业商*/
+(NSString *)getMoblieNumType:(NSString *)mobileNum
{
    return [self isChinaMobileNumber:mobileNum]?@"中国移动":([self isChinaTelecomNumber:mobileNum]?@"中国电信":([self isChinaUnicomNumber:mobileNum]?@"中国联通":@"未知"));
}
/**验证是不是移动手机号码*/
+ (BOOL)isChinaMobileNumber:(NSString *)mobileNum
{
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    if (mobileNum.length != 11)
    {
        return NO;
    }
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    if ([regextestcm evaluateWithObject:mobileNum] == YES) {
        
        return YES;
    }else
    {
        return NO;
    }
}
/**验证是不是电信手机号码*/
+(BOOL)isChinaTelecomNumber:(NSString *)mobileNum
{
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    if (mobileNum.length != 11)
    {
        return NO;
    }
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if ([regextestct evaluateWithObject:mobileNum] == YES) {
        return YES;
    }
    else
    {
        return NO;
    }
    
}
/**验证是不是联通号码*/
+(BOOL)isChinaUnicomNumber:(NSString *)mobileNum
{
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    if (mobileNum.length != 11)
    {
        return NO;
    }
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    if ([regextestct evaluateWithObject:mobileNum] == YES) {
        
        return YES;
    }
    else
    {
        return NO;
    }
}
/**验证是不是邮箱*/
+(BOOL)isEmail:(NSString *)email
{
    /**
     *  前半部分（由字母、数字和（.)、_ 、%、+、- 等符号组成）中间部分（由数字、字母组成和(.)、-等符号组成）最后部分(由 . 和数字组成，最少2个字符，最多四个字符)
     */
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if ([emailTest evaluateWithObject:email]) {
        return YES;
    }
    else
    {
        return NO;
    }
}
/**验证是不是身份证号码*/
+(BOOL)isIdCardNum:(NSString *)IdCardNumber
{
    if (IdCardNumber.length != 18) {
        return NO;
    }
    //15位身份证为第一代身份证，在2013年就停止使用
    //身份证格式 18位数字组成 或者17位数字+xX
    NSString *idCardRegex = @"\\d{18}$|(\\d{17}[xX])$";
    NSPredicate *idCardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idCardRegex];
    if ([idCardTest evaluateWithObject:IdCardNumber]) {
        return YES;
    }
    else
    {
        return NO;
    }
}
/**验证是不是为手机号码*/
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber
{
    BOOL flag;
    if (bankCardNumber.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{15,30})";
    NSPredicate *bankCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [bankCardPredicate evaluateWithObject:bankCardNumber];
}

//从字符串中获取数字
+(NSString *)getNumberForString:(NSString *)str{
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z.-./.(.)]" options:0 error:NULL];
    NSString *string = str;
    NSString *result = [regular stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
    return result;
    
}


@end
