//  文件名: Czh_collectionView.m
//  创建者: CYJ 时间: 2018/10/11.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_collectionView.h"

@implementation Czh_collectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
#pragma mark --
        UIView *nameWalletView = [[UIView alloc] init];
        nameWalletView.backgroundColor = [UIColor lightGrayColor];
        nameWalletView.layer.cornerRadius = 5;
        
        UILabel *nameWalletLabel = [[UILabel alloc] init];
        nameWalletLabel.text = @"WEC";
        nameWalletLabel.textAlignment = NSTextAlignmentCenter;
        [nameWalletView addSubview:nameWalletLabel];
        nameWalletView.backgroundColor = [UIColor blueColor];
        _nameWalletLabel = nameWalletLabel;
        
        UILabel *adressWalletLabel = [[UILabel alloc] init];
        adressWalletLabel.text = @"qqqqqqqqq......qqqqqqqqqq";
        adressWalletLabel.textAlignment = NSTextAlignmentCenter;
        adressWalletLabel.backgroundColor = [UIColor blueColor];
        [nameWalletView addSubview:adressWalletLabel];
        _adressWalletLabel = adressWalletLabel;
        
        [self addSubview:nameWalletView];
        _nameWalletView = nameWalletView;
#pragma mark --
        UIView *QrcodeView = [[UIView alloc] init];
        QrcodeView.backgroundColor = [UIColor whiteColor];
        
        UILabel *currencyLabel = [[UILabel alloc] init];
        currencyLabel.text = @"请转入 XXX WEC";
        currencyLabel.textAlignment = NSTextAlignmentCenter;
        
        currencyLabel.backgroundColor = [UIColor blueColor];
        [QrcodeView addSubview:currencyLabel];
        _currencyLabel = currencyLabel;
        
        UIImageView *QrcodeImageView = [[UIImageView alloc] init];
        QrcodeImageView.backgroundColor = [UIColor orangeColor];
        [QrcodeView addSubview:QrcodeImageView];
        _QrcodeImageView = QrcodeImageView;
        
        UILabel *label = [[UILabel alloc] init];
        label.text = @"无需添加好友，扫二维码向我付款";
        label.textAlignment = NSTextAlignmentCenter;
        
        label.backgroundColor = [UIColor blueColor];
        [QrcodeView addSubview:label];
        _label = label;
        
        UIButton *replacementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [replacementBtn setTitle:@"更换资产" forState:UIControlStateNormal];
        [replacementBtn setBackgroundColor:[UIColor blueColor]];
//        [replacementBtn setBackgroundImage:[UIColor blueColor] forState:UIControlStateNormal];
        [QrcodeView addSubview:replacementBtn];
        
        UIButton *setCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [setCountBtn setTitle:@"设置金额" forState:UIControlStateNormal];
//        [setCountBtn setBackgroundImage:[UIColor redColor] forState:UIControlStateNormal];
        [setCountBtn setBackgroundColor:[UIColor redColor]];
        [QrcodeView addSubview:setCountBtn];
        
        [self addSubview:QrcodeView];
        _QrcodeView = QrcodeView;
        
        UIImageView *headImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"placeholder.png"]];
        headImage.backgroundColor = [UIColor orangeColor];
        headImage.layer.masksToBounds = YES;
        headImage.layer.cornerRadius = 25;
        [self addSubview:headImage];
        _headImage = headImage;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.headImage.frame = CGRectMake(self.CZH_width/2 - 25, 0, 50, 50);
    //0
    self.nameWalletView.frame = CGRectMake(0, 25, self.CZH_width, 80);
    self.nameWalletLabel.frame = CGRectMake(10, 30, self.CZH_width-20, 20);
    self.adressWalletLabel.frame = CGRectMake(10, CGRectGetMaxY(self.nameWalletLabel.frame)+5, self.CZH_width-20, 20);
    //1
    self.QrcodeView.frame = CGRectMake(0, CGRectGetMaxY(self.nameWalletView.frame), self.CZH_width, self.CZH_height - 105);
    self.currencyLabel.frame = CGRectMake(10, 5, self.CZH_width-20, 20);
    self.QrcodeImageView.frame = CGRectMake(self.CZH_width/2 - 80, CGRectGetMaxY(self.currencyLabel.frame)+ 5, 160, 160);
    self.label.frame = CGRectMake(10, CGRectGetMaxY(self.QrcodeImageView.frame)+ 5, self.CZH_width-20, 20);
    self.replacementBtn.frame = CGRectMake(0, CGRectGetMaxY(self.label.frame)+ 5, self.CZH_width/2, 40);
    self.setCountBtn.frame = CGRectMake(self.CZH_width/2, CGRectGetMaxY(self.label.frame)+ 5, self.CZH_width/2, 40);
}


@end
