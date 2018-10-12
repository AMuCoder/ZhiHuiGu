//  文件名: Czh_CWTextField.m
//  创建者: CYJ 时间: 2018/10/5.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：textfield设置为只有下划线

#import "Czh_CWTextField.h"

@implementation Czh_CWTextField

- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor blackColor];
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}

@end
