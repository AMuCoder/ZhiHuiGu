//
//  CZHNavigationView.m
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "CZHNavigationView.h"

@implementation CZHNavigationView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat x = 0;
        CGFloat width = 40.f;
        
        UIButton *scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        scanBtn.frame = CGRectMake(x, 0, width, width);
        scanBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [scanBtn setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
        [self addSubview:scanBtn];
        _scanBtn = scanBtn;
        
        UIButton *paymentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        paymentBtn.frame = CGRectMake(CGRectGetMaxX(_scanBtn.frame), 0, width, width);
        paymentBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [paymentBtn setImage:[UIImage imageNamed:@"payment"] forState:UIControlStateNormal];
        [self addSubview:paymentBtn];
        _paymentBtn = paymentBtn;
        
        UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        collectBtn.frame = CGRectMake(CGRectGetMaxX(_paymentBtn.frame), 0, width, width);
        collectBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [collectBtn setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
        [self addSubview:collectBtn];
        _collectBtn = collectBtn;
        
        UIButton *phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        phoneBtn.frame = CGRectMake(CGRectGetMaxX(_collectBtn.frame), 0, width, width);
        phoneBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [phoneBtn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [self addSubview:phoneBtn];
        _phoneBtn = phoneBtn;
        
        
        
        
//        for (NSInteger index = 0; index < 4; index ++) {
//            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//
//            if (index == 0) {
//                [button setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
//            } else if (index == 1) {
//                [button setImage:[UIImage imageNamed:@"payment"] forState:UIControlStateNormal];
//            } else if (index == 2) {
//                [button setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
//            }  else if (index == 3) {
//                [button setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
//            }
//            button.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
//            button.frame = CGRectMake(x, 0, width, width);
//            [self addSubview:button];
//            _button = button;
//            x = x + width;
//        }
    }
    return self;
}

@end
