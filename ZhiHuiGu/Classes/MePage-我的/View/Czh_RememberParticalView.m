//  文件名: Czh_RememberParticalView.m
//  创建者: CYJ 时间: 2018/10/9.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_RememberParticalView.h"

@implementation Czh_RememberParticalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        UILabel *label = [[UILabel alloc] init];
        label.center  =  self.center;
        label.numberOfLines = 0;
        [label sizeToFit];
        [label setLineBreakMode:NSLineBreakByWordWrapping];
        label.font = [UIFont systemFontOfSize:22.f];
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
        self.label = label;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.label.frame = CGRectMake(10, 10, self.CZH_width-20, self.CZH_height-20);
    
}

@end
