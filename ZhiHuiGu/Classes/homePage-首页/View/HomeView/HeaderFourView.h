//
//  HeaderFourView.h
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZHButton;
@interface HeaderFourView : UIView

/// 偏移量
@property (nonatomic, assign) CGFloat contentOffsetY;

@property(nonatomic,strong) CZHButton *scanBtn;
@property(nonatomic,strong) CZHButton *paymentBtn;
@property(nonatomic,strong) CZHButton *collectBtn;
@property(nonatomic,strong) CZHButton *phoneBtn;

@end
