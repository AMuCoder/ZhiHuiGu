//  文件名: Czh_SMSOrPsdBtn.m
//  创建者: 阿木 时间: 2018/9/30.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：短信验证码和用户密码点击按钮

#import "Czh_SMSOrPsdBtn.h"

@implementation Czh_SMSOrPsdBtn

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        self.backgroundColor = [UIColor clearColor];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16.0f];
//        [self addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
