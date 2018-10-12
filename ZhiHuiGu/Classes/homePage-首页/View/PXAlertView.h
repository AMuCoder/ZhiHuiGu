//  文件名: PXAlertView.m
//  创建者: CYJ 时间: 2018/10/11.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

@import UIKit;

@interface PXAlertView : UIView

@property (nonatomic, getter = isVisible) BOOL visible;

#pragma mark - 收款码弹出
+ (PXAlertView *)showAlertWithWalletNameTitle:(NSString *)nameTitle
                           WalletAddressTitle:(NSString *)addressTitle
                          WalletCurrencyTitle:(NSString *)currencyTitle
                                    HeadImage:(NSString *)qrcodeImage
                                  QrcodeImage:(NSString *)headImage
                                  cancelTitle:(NSString *)cancelTitle
                                   otherTitle:(NSString *)otherTitle
                                   completion:(void(^) (BOOL cancelled))completion;
#pragma mark - 设置金额
+ (PXAlertView *)showAlertWithTitle:(NSString *)title
         EnterAmountTextFieldText:(NSString *)fieldText
         EnterAmountTextFieldHolder:(NSString *)placeHolder
                        cancelTitle:(NSString *)cancelTitle
                         otherTitle:(NSString *)otherTitle
                         completion:(void(^) (BOOL cancelled))completion;

@end
