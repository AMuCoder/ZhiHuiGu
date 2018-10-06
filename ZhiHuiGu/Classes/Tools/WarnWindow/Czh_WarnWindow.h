//  文件名: Czh_WarnWindow.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

@interface Czh_WarnWindow : NSObject

+(void)HUD:(UIView *)view andWarnText:(NSString *)str andXoffset:(CGFloat )xOffset andYoffset:(CGFloat)yOffset;
+(void)WarnText:(NSString *)str;

@end
