//
//  Czh_LoginBtn.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/27.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_LoginBtn.h"

@implementation Czh_LoginBtn

#define MAIN_COLOR CZHRGBColor(23, 49, 109)

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
    }
    return self;
}

+ (instancetype)buttonWithframe:(CGRect)frame{
    Czh_LoginBtn *btn = [[Czh_LoginBtn alloc] initWithFrame:frame];
    
    return btn;
}
@end
