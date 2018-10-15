//  文件名: Czh_MarketView.h
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_MarketView : UIView
/**币种*/
@property(nonatomic,strong) UILabel *currenLabel;
/**价格*/
@property(nonatomic,strong) UILabel *priLabel;
/**总额*/
@property(nonatomic,strong) UILabel *totalLabel;
/**涨跌幅*/
@property(nonatomic,strong) UILabel *rFLabel;
@end
