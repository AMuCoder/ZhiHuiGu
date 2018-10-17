//  文件名: Czh_collectionView.m
//  创建者: CYJ 时间: 2018/10/11.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_collectionView.h"

@implementation Czh_collectionView

- (instancetype)initWithFrame:(CGRect)frame
              WalletNameTitle:(NSString *)nameTitle
           WalletAddressTitle:(NSString *)addressTitle
          WalletCurrencyTitle:(NSString *)currencyTitle
                    HeadImage:(NSString *)qrcodeImage
                  QrcodeImage:(NSString *)headImage
{
    self = [super initWithFrame:frame];
    if (self) {
        
#pragma mark --
        _nameWalletView = [[UIView alloc] initWithFrame:CGRectMake(0, 25, self.CZH_width, 83)];
        _nameWalletView.backgroundColor = [UIColor lightGrayColor];
        _nameWalletView.layer.cornerRadius = 5;
        [self addSubview:_nameWalletView];
        
        _nameWalletLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.CZH_width, 20)];
        _nameWalletLabel.text = nameTitle;
        _nameWalletLabel.numberOfLines = 0;
        _nameWalletLabel.textColor = [UIColor blackColor];
        _nameWalletLabel.font = [UIFont boldSystemFontOfSize:15];
        _nameWalletLabel.textAlignment = NSTextAlignmentCenter;
        [_nameWalletView addSubview:_nameWalletLabel];
        
        _adressWalletLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, self.CZH_width, 20)];
        _adressWalletLabel.text = addressTitle;
        _adressWalletLabel.numberOfLines = 0;
        _adressWalletLabel.font = [UIFont boldSystemFontOfSize:15];
        _adressWalletLabel.textColor = [UIColor blackColor];
        _adressWalletLabel.textAlignment = NSTextAlignmentCenter;
        //_adressWalletLabel.backgroundColor = [UIColor blueColor];
        [_nameWalletView addSubview:_adressWalletLabel];
#pragma mark --
        _QrcodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 105, self.CZH_width, 220)];
        _QrcodeView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_QrcodeView];
        
        _currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, self.CZH_width, 20)];
        _currencyLabel.text = currencyTitle;
        _currencyLabel.numberOfLines = 0;
        _currencyLabel.textAlignment = NSTextAlignmentCenter;
        _currencyLabel.font = [UIFont boldSystemFontOfSize:15];
        _currencyLabel.textColor = [UIColor blackColor];
        [_QrcodeView addSubview:_currencyLabel];
        
        _QrcodeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.CZH_width/2 - 80, 30, 160, 160)];
        _QrcodeImageView.image = [UIImage imageNamed:qrcodeImage];
        _QrcodeImageView.backgroundColor = [UIColor grayColor];
        [_QrcodeView addSubview:_QrcodeImageView];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.CZH_width, 20)];
        _label.text = @"无需添加好友，扫二维码向我付款";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont boldSystemFontOfSize:14];
        _label.textColor = [UIColor blackColor];
        [_QrcodeView addSubview:_label];
        
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.CZH_width/2 - 25, 0, 50, 50)];
        _headImage.image = [UIImage imageNamed:headImage];
        _headImage.backgroundColor = [UIColor orangeColor];
        _headImage.layer.masksToBounds = YES;
        _headImage.layer.cornerRadius = 25;
        [self addSubview:_headImage];
        
        _replacementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _replacementBtn.frame = CGRectMake(0, 330, self.CZH_width/2, 40);
        [_replacementBtn setTitle:@"更换资产" forState:UIControlStateNormal];
        [_replacementBtn setBackgroundColor:[UIColor blueColor]];
        [self addSubview:_replacementBtn];
        
        _setCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _setCountBtn.frame = CGRectMake(self.CZH_width/2, 330, self.CZH_width/2, 40);
        [_setCountBtn setTitle:@"设置金额" forState:UIControlStateNormal];
        [_setCountBtn setBackgroundColor:[UIColor redColor]];
        [self addSubview:_setCountBtn];
    }
    return self;
}


@end
