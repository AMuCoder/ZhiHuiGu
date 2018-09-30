//
//  ZHGMeUserView.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/27.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGMeUserView.h"

@implementation ZHGMeUserView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

// 添加子控件
- (void)setupView {
    UIImageView *pictureView = [[UIImageView alloc] init];
    [self addSubview:pictureView];
    _pictureView.backgroundColor = [UIColor grayColor];
    _pictureView = pictureView;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    [self addSubview:nameLabel];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel = nameLabel;
    
    UILabel *countLabel = [[UILabel alloc] init];
    [self addSubview:countLabel];
    _countLabel.backgroundColor = [UIColor blackColor];
    countLabel.numberOfLines = 0;
    countLabel.font = [UIFont systemFontOfSize:15];
    _countLabel = countLabel;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat pictureViewX = 5;
    CGFloat pictureViewY = 5;
    CGFloat pictureViewW = self.frame.size.height - 10;
    CGFloat pictureViewH = self.frame.size.height - 10;
    self.pictureView.frame = CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
    
    CGFloat nameLabelX = self.frame.size.height;
    CGFloat nameLabelY = 5;
    CGFloat nameLabelW = self.frame.size.width - CGRectGetMaxX(self.pictureView.frame) - 20;
    CGFloat nameLabelH = (self.frame.size.height - 15)/2;
    self.nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    
    CGFloat countLabelX = nameLabelX;
    CGFloat countLabelY = CGRectGetMaxY(self.nameLabel.frame) + 5;
    CGFloat countLabelW = nameLabelW;
    CGFloat countLabelH = nameLabelH;
    self.countLabel.frame = CGRectMake(countLabelX, countLabelY, countLabelW, countLabelH);
}

/*
 - (void)setShop:(XMGShop *)shop
 {
    _shop = shop;
 
    self.nameLabel.text = shop.name;
    self.iconView.image = [UIImage imageNamed:shop.icon];
 }
 */
@end
