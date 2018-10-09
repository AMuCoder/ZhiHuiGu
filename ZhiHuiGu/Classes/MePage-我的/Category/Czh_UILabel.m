//  文件名: Czh_UILabel.m
//  创建者: CYJ 时间: 2018/10/7.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_UILabel.h"
#import "UILabel+Czh_UILabel.h"

@implementation Czh_UILabel


- (instancetype)initWithFrame:(CGRect)frame
               labelTextColor:(UIColor *)labelTextColor
                    sizeFloat:(CGFloat)sizeFloat
                textAlignment:(NSTextAlignment)textAlignment{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfLines = 0;
        [self setFont:[UIFont systemFontOfSize:sizeFloat]];
        self.font = [UIFont systemFontOfSize:sizeFloat];
        [self setTextColor:labelTextColor];
        self.textAlignment = textAlignment;
    }
    return self;
}

@end
