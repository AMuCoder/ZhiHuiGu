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
        for (NSInteger index = 0; index < 4; index ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            if (index == 0) {
                [button setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
            } else if (index == 1) {
                [button setImage:[UIImage imageNamed:@"payment"] forState:UIControlStateNormal];
            } else if (index == 2) {
                [button setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
            }  else if (index == 3) {
                [button setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
            }
            button.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
            button.frame = CGRectMake(x, 0, width, width);
            [self addSubview:button];
            
            x = x + width;
        }
    }
    
    return self;
}

@end
