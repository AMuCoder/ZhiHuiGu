//  文件名: ZHGSMSOrPsdBtn.m
//  创建者: CYJ 时间: 2018/9/30.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：短信验证码和用户密码点击按钮

#import "ZHGSMSOrPsdBtn.h"

@implementation ZHGSMSOrPsdBtn

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
