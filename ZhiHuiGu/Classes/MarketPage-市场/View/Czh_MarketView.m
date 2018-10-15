//  文件名: Czh_MarketView.m
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_MarketView.h"

@implementation Czh_MarketView

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        _currenLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.CZH_width/5, 20)];
        _currenLabel.text = @"币种";
        _currenLabel.font = [UIFont systemFontOfSize:13];
        _currenLabel.textAlignment = NSTextAlignmentCenter;
        _currenLabel.textColor = [UIColor blackColor];
        [self addSubview:_currenLabel];
        
        _priLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.CZH_width/5, 10, self.CZH_width/5, 20)];
        _priLabel.text = @"价格";
        _priLabel.textColor = [UIColor lightGrayColor];
        _priLabel.font = [UIFont systemFontOfSize:13];
        _priLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_priLabel];
        
        _totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(2*self.CZH_width/5, 10, self.CZH_width/5, 20)];
        _totalLabel.text = @"总额(24h)";
        _totalLabel.font = [UIFont systemFontOfSize:13];
        _totalLabel.textAlignment = NSTextAlignmentCenter;
        _totalLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_totalLabel];
        
        _rFLabel = [[UILabel alloc] initWithFrame:CGRectMake(3*self.CZH_width/5, 10, self.CZH_width/5, 20)];
        _rFLabel.text = @"涨跌幅(24h)";
        _rFLabel.font = [UIFont systemFontOfSize:13];
        _rFLabel.textAlignment = NSTextAlignmentCenter;
        _rFLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_rFLabel];
    }
    return self;
}
@end
