//  文件名: UILabel+Czh_UILabel.h
//  创建者: CYJ 时间: 2018/10/7.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface UILabel (Czh_UILabel)

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel*)label WithSpace:(float)space;

/**
  *  改变字间距
  */
+ (void)changeWordSpaceForLabel:(UILabel*)label WithSpace:(float)space;

/**
  *  改变行间距和字间距
  */
+ (void)changeSpaceForLabel:(UILabel*)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
