//  文件名: Czh_WoWalletView.h
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_WoWalletView : UIView
@property(nonatomic,strong) UILabel *walletAddressLabel;
@property(nonatomic,strong) UIButton *qrcodeViewBtn;
@property(nonatomic,strong) UILabel *walletMoneyLabel;
@property(nonatomic,strong) UIButton *KYCBtn;
@property(nonatomic,strong) UIButton *czBtn;
@property(nonatomic,strong) UIButton *txBtn;

- (instancetype)initWithFrame:(CGRect)frame WalletAddressText:(NSString *)walletAddresstext QrcodeImage:(NSString *)qrcodeViewImage WalletMoney:(NSString *)MoneyNumber KYCBtnImage:(NSString *)image KYCBtnHightImage:(NSString *)hrightimage;
@end
