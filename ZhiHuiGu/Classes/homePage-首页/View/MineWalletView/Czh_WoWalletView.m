//  文件名: Czh_WoWalletView.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_WoWalletView.h"

@implementation Czh_WoWalletView

- (instancetype)initWithFrame:(CGRect)frame WalletAddressText:(NSString *)walletAddresstext QrcodeImage:(NSString *)qrcodeViewImage WalletMoney:(NSString *)MoneyNumber KYCBtnImage:(NSString *)image KYCBtnHightImage:(NSString *)hrightimage
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:52.0 / 255.0 green:104.0 / 255.0 blue:206.0 / 255.0 alpha:1];
        
        UILabel *walletAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, self.CZH_width - 80, 20)];
        walletAddressLabel.text = walletAddresstext;
        walletAddressLabel.textColor = [UIColor whiteColor];
        walletAddressLabel.font = [UIFont systemFontOfSize:14];
        walletAddressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:walletAddressLabel];
        _walletAddressLabel = walletAddressLabel;
        
        UIButton *qrcodeViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.CZH_width/2-15, CGRectGetMaxY(_walletAddressLabel.frame)+10, 30, 30)];
        qrcodeViewBtn.backgroundColor = [UIColor lightGrayColor];
        [qrcodeViewBtn setImage:[UIImage imageNamed:qrcodeViewImage] forState:UIControlStateNormal];
        [self addSubview:qrcodeViewBtn];
        _qrcodeViewBtn = qrcodeViewBtn;
        
        UILabel *walletMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_qrcodeViewBtn.frame) + 10, self.CZH_width - 80, 20)];
        walletMoneyLabel.text = MoneyNumber;
        walletMoneyLabel.textColor = [UIColor whiteColor];
        walletMoneyLabel.font = [UIFont systemFontOfSize:14];
        walletMoneyLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:walletMoneyLabel];
        _walletMoneyLabel = walletMoneyLabel;
        
        UIButton *KYCBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        KYCBtn.frame = CGRectMake(10, CGRectGetMaxY(_walletMoneyLabel.frame) + 10, 100, 30);
        KYCBtn.backgroundColor = [UIColor clearColor];
        //设置button正常状态下的图片
        [KYCBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        //设置button高亮状态下的图片
        [KYCBtn setImage:[UIImage imageNamed:hrightimage] forState:UIControlStateHighlighted];
        //设置button正常状态下的背景图
        //[KYCBtn setBackgroundImage:[UIImage imageNamed:@"_normal.png"] forState:UIControlStateNormal];
        //设置button高亮状态下的背景图
        //[KYCBtn setBackgroundImage:[UIImage imageNamed:@"_highlighted.png"] forState:UIControlStateHighlighted];
        //button图片的偏移量，距上左下右分别(10, 10, 10, 60)像素点
        KYCBtn.imageEdgeInsets = UIEdgeInsetsMake(2.5, 2.5, 2.5, 72.5);
        [KYCBtn setTitle:@"KYC认证" forState:UIControlStateNormal];
        //button标题的偏移量，这个偏移量是相对于图片的
        KYCBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        //设置button正常状态下的标题颜色
        [KYCBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //设置button高亮状态下的标题颜色
        [KYCBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        KYCBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:KYCBtn];
        _KYCBtn = KYCBtn;
        
        UIButton *txBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.CZH_width-60, CGRectGetMaxY(_walletMoneyLabel.frame) + 10, 50, 30)];
        [txBtn setTitle:@"提现" forState:UIControlStateNormal];
        txBtn.backgroundColor = [UIColor greenColor];
        txBtn.layer.cornerRadius = 5;
        txBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [txBtn setImage:[UIImage imageNamed:qrcodeViewImage] forState:UIControlStateNormal];
        [self addSubview:txBtn];
        _txBtn = txBtn;
        
        UIButton *czBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMinX(_txBtn.frame)- 60, CGRectGetMaxY(_walletMoneyLabel.frame) + 10, 50, 30)];
        [czBtn setTitle:@"充值" forState:UIControlStateNormal];
        czBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        czBtn.layer.cornerRadius = 5;
        czBtn.backgroundColor = [UIColor redColor];
        [czBtn setImage:[UIImage imageNamed:qrcodeViewImage] forState:UIControlStateNormal];
        [self addSubview:czBtn];
        _czBtn = czBtn;

    }
    return self;
}

@end
