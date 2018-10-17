//  文件名: Czh_collectionView.h
//  创建者: CYJ 时间: 2018/10/11.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_collectionView : UIView
@property(nonatomic,strong) UIView *nameWalletView;//1
@property(nonatomic,strong) UIView *QrcodeView;//2


@property(nonatomic,strong) UIImageView *headImage;//头像
@property(nonatomic,strong) UILabel *nameWalletLabel;//钱包名称
@property(nonatomic,strong) UILabel *adressWalletLabel;//钱包地址
@property(nonatomic,strong) UILabel *currencyLabel;//币种
@property(nonatomic,strong) UIImageView *QrcodeImageView;//二维码
@property(nonatomic,strong) UIButton *replacementBtn;
@property(nonatomic,strong) UIButton *setCountBtn;
@property(nonatomic,strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame
              WalletNameTitle:(NSString *)nameTitle
           WalletAddressTitle:(NSString *)addressTitle
          WalletCurrencyTitle:(NSString *)currencyTitle
                    HeadImage:(NSString *)qrcodeImage
                  QrcodeImage:(NSString *)headImage;
@end
