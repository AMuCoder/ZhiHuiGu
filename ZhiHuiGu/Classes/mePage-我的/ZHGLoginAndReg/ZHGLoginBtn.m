//
//  ZHGLoginBtn.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/27.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGLoginBtn.h"

@implementation ZHGLoginBtn

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
    ZHGLoginBtn *btn = [[ZHGLoginBtn alloc] initWithFrame:frame];
    
    return btn;
}
@end
