//
//  Czh_HeaderView.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/26.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_HeaderView.h"
#import "HeaderFourView.h"
#import "Czh_FuncHeaderView.h"

@interface Czh_HeaderView()

@end
@implementation Czh_HeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        HeaderFourView *headfourView = [[HeaderFourView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 100)];
        [self addSubview:headfourView];
        _headfourView = headfourView;
        
        
        Czh_FuncHeaderView *funcHeaderView = [[Czh_FuncHeaderView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 230, self.frame.size.width, 230)];
        funcHeaderView.backgroundColor = [UIColor greenColor];
        [self addSubview:funcHeaderView];
        _funcHeaderView = funcHeaderView;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
}


@end
