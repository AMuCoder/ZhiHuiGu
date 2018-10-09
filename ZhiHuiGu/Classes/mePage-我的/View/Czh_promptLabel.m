//
//  Czh_promptLabel.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/29.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_promptLabel.h"

@implementation Czh_promptLabel

- (instancetype)initWithFrame:(CGRect)frame labelText:(NSString *)labeltext
{
    self = [super initWithFrame:frame];
    if (self) {
        self.text = labeltext;//默认为空
        self.font = [UIFont systemFontOfSize:15.0f];//默认使用系统的17
        self.textColor = [UIColor orangeColor];//默认使用文本黑色
//        self.shadowColor = [UIColor lightGrayColor];//默认没有阴影
//        self.shadowOffset = CGSizeMake(1,0);//默认是一个向上的阴影(0,-1)
        self.textAlignment = NSTextAlignmentCenter;//默认是左对齐
        self.lineBreakMode = NSLineBreakByTruncatingTail;//段落样式，默认是最后截断尾巴，用...代替
    }
    return self;
}

@end
