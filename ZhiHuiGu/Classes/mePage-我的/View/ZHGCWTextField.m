//  文件名: ZHGCWTextField.m
//  创建者: CYJ 时间: 2018/10/5.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import "ZHGCWTextField.h"

@implementation ZHGCWTextField

- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor blueColor];
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}

@end
