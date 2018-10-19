//
//  ZDAcountTypeBtn.m
//  ZhiDaDMOne
//
//  Created by CoderZHChun on 2017/5/2.
//  Copyright © 2017年 沁汉堂. All rights reserved.
//

#import "ZDAcountTypeBtn.h"
#import "UIButton+Layout.h"

@implementation ZDAcountTypeBtn
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self setImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] forState:UIControlStateSelected];
        [self setTitle:text forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        self.titleLabel.numberOfLines = 0;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.imageRect = CGRectMake(10, 0.5*(self.frame.size.height - 16), 16, 16);
        self.titleRect = CGRectMake(35, 0.5*(self.frame.size.height - 20)+1, self.frame.size.width-40, 20);
        self.imageView.contentMode = UIViewContentModeScaleAspectFit; 
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame BTNTitle:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self setImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] forState:UIControlStateSelected];
        [self setTitle:text forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.numberOfLines = 0;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.imageRect = CGRectMake(10, 0.5*(self.frame.size.height - 16), 16, 16);
        self.titleRect = CGRectMake(30, 0.5*(self.frame.size.height - 20)+1, self.frame.size.width-30, 20);
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame DoubeTitle:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self setImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] forState:UIControlStateSelected];
        [self setTitle:text forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.numberOfLines = 0;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.imageRect = CGRectMake(10, 5, 16, 16);
        self.titleRect = CGRectMake(30, 0, self.frame.size.width-30, self.frame.size.height);
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame LeftBtnTitle:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self setImage:[UIImage imageNamed:@"上一步"] forState:UIControlStateNormal];
        [self setTitle:text forState:UIControlStateNormal];
        self.backgroundColor = MAIN_COLOR;
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageRect = CGRectMake(10, 10, 20, 20);
        self.titleRect = CGRectMake(35, 12, self.frame.size.width-40, 20);
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame RightBtnTitle:(NSString *)text{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self setImage:[UIImage imageNamed:@"下一步"] forState:UIControlStateNormal];
        [self setTitle:text forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        self.backgroundColor = MAIN_COLOR;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleRect = CGRectMake(10, 10, self.frame.size.width-40, 20);
        self.imageRect = CGRectMake(self.frame.size.width-35, 10, 25, 20);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

@end
