//
//  Czh_ClickBtnView.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/28.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_ClickBtnView.h"
//#import "UIButton+CZHClickBtnBlock.h"

@implementation Czh_ClickBtnView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /** close button */
        // 不需要写任何button点击相关方法, 直接添加视图上即可
        UIButton *closeArrow = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeArrow setImage:[UIImage imageNamed:@"user_close"] forState:UIControlStateNormal];
        closeArrow.contentMode = UIViewContentModeScaleAspectFit;
        [closeArrow setTitle:@"点击测试" forState:UIControlStateNormal];
        closeArrow.backgroundColor = [UIColor orangeColor];
        [self addSubview:closeArrow];
        _closeArrow = closeArrow;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor grayColor];
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.closeArrow.frame = CGRectMake(20, 10, self.frame.size.width-40, 44);
    self.imageView.frame = CGRectMake(20, 64, self.frame.size.width-40, 44);
}

@end
