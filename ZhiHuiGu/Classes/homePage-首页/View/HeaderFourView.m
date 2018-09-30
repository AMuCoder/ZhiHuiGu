//
//  CZHHeaderView.m
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "HeaderFourView.h"
#import "CZHButton.h"
#import "UIButton+CZHClickBtnBlock.h"

@implementation HeaderFourView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:52.0 / 255.0 green:104.0 / 255.0 blue:206.0 / 255.0 alpha:1];
        CGFloat x = 0;
        CGFloat screenWidth = Main_Screen_Width;
        CGFloat width = self.frame.size.width / 4;
        
        CZHButton *scanBtn = [[CZHButton alloc] initWithFrame:CGRectMake(x, 10, width, width) type:0];
//        scanBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [scanBtn setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
        [self addSubview:scanBtn];
        _scanBtn = scanBtn;
        
        CZHButton *paymentBtn = [[CZHButton alloc] initWithFrame:CGRectMake(screenWidth/4, 10, width, width) type:1];
//        paymentBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [paymentBtn setImage:[UIImage imageNamed:@"payment"] forState:UIControlStateNormal];
        [self addSubview:paymentBtn];
        _paymentBtn = paymentBtn;
        
        CZHButton *collectBtn = [[CZHButton alloc] initWithFrame:CGRectMake(screenWidth/2, 10, width, width) type:2];
//        collectBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [collectBtn setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
        [self addSubview:collectBtn];
        _collectBtn = collectBtn;
        
        CZHButton *phoneBtn = [[CZHButton alloc] initWithFrame:CGRectMake(3*screenWidth/4, 10, width, width) type:3];
//        phoneBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 7, 7, 7);
        [phoneBtn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [self addSubview:phoneBtn];
        _phoneBtn = phoneBtn;
        
        
        
        
        
        
        
        
        
        
        
        
        
//        CGFloat x = 0;
//        CGFloat screenWidth = Main_Screen_Width;
//        for (int index = 0; index < 4; index++) {
//            CZHButton *button = [[CZHButton alloc] initWithFrame:CGRectMake(x, 10, self.frame.size.width / 4, self.frame.size.width / 4) type:index];
//
//            [self addSubview:button];
//
//            x = x + screenWidth / 4;
//        }
    }
    
    return self;
}

#pragma mark - Set方法
-(void)setContentOffsetY:(CGFloat)contentOffsetY {
    _contentOffsetY = contentOffsetY;
    
    CGFloat alpha = 0;
    if (contentOffsetY > 70) {
        alpha = 0;
    } else if (contentOffsetY > 20) {
        alpha = (70 - contentOffsetY) / 50;
    } else {
        alpha = 1;
    }
    
    for (UIView *subview in self.subviews) {
        subview.alpha = alpha;
    }
}

@end
