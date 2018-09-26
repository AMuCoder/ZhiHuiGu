//
//  CZHButton.m
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "CZHButton.h"
#import "UIView+Frame.h"

@implementation CZHButton

-(instancetype)initWithFrame:(CGRect)frame type:(CZHButtonType)type {
    if (self = [super initWithFrame:frame]) {

        /**
         偏移值

         @param 上/右/下/左
         */
        self.imageEdgeInsets = UIEdgeInsetsMake(10, 31, 45, 31);
        self.titleEdgeInsets = UIEdgeInsetsMake(55, -100, 0, 0);
        switch (type) {
            case CZHButtonTypeScan: {
                [self setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
                [self setTitle:@"扫一扫" forState:UIControlStateNormal];
                break;
            }
            case CZHButtonTypePay: {
                [self setImage:[UIImage imageNamed:@"payment"] forState:UIControlStateNormal];
                [self setTitle:@"付钱" forState:UIControlStateNormal];
                break;
            }
            case CZHButtonTypeCollect: {
                [self setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
                [self setTitle:@"收钱" forState:UIControlStateNormal];
                break;
            }
            case CZHButtonTypePhone: {
                [self setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
                [self setTitle:@"手机" forState:UIControlStateNormal];
                break;
            }
            default:
                break;
        }
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.CZH_height = 20;
    }
    
    return self;
}

@end
