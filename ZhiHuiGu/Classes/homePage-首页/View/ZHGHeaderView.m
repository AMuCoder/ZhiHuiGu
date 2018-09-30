//
//  ZHGHeaderView.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/26.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGHeaderView.h"
#import "HeaderFourView.h"
#import "ZHGFuncHeaderView.h"

@interface ZHGHeaderView()

@end
@implementation ZHGHeaderView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        HeaderFourView *headfourView = [[HeaderFourView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 100)];
        [self addSubview:headfourView];
        _headfourView = headfourView;
        
        
        ZHGFuncHeaderView *funcHeaderView = [[ZHGFuncHeaderView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 230, self.frame.size.width, 230)];
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
