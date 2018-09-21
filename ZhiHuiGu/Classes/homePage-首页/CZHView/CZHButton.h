//
//  CZHButton.h
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 创建枚举：扫一扫、付钱、收钱、手机
 */
typedef NS_ENUM(NSInteger, CZHButtonType) {
    /// 扫一扫
    CZHButtonTypeScan = 0,
    /// 付钱
    CZHButtonTypePay,
    /// 收钱
    CZHButtonTypeCollect,
    /// 手机
    CZHButtonTypePhone
};

@interface CZHButton : UIButton

/// 初始化构造方法
-(instancetype)initWithFrame:(CGRect)frame type:(CZHButtonType)type;

@end
