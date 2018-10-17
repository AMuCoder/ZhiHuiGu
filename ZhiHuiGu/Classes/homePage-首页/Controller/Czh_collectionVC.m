//  文件名: Czh_collectionVC.m
//  创建者: CYJ 时间: 2018/10/11.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_collectionVC.h"
#import "Czh_collectionView.h"
#import "AssetsTypeAlter.h"


#import "YXCustomAlertView.h"
#import "PXAlertView.h"

@interface Czh_collectionVC ()<YXCustomAlertViewDelegate>
@property(nonatomic,strong) UILabel *nameWalletLabel;//钱包名称
@property(nonatomic,strong) UIImageView *QrcodeImageView;//二维码
@property(nonatomic,strong) UIButton *replacementBtn;
@property(nonatomic,strong) UIButton *setCountBtn;
@property(nonatomic,strong) UILabel *label;

@end

@implementation Czh_collectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收款";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setSubViewWithNumberStr:@"3000" CurrencyStr:@"WEC" QrcodeImage:@"XXX"];
}
-(void)setSubViewWithNumberStr:(NSString *)numberStrtext
                   CurrencyStr:(NSString *)currencyStrtext
                   QrcodeImage:(NSString *)qrcodeImage
{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, self.view.CZH_width-20, 20)];
    _label.text = @"请扫一扫，向我付款";
    _label.textColor = [UIColor blackColor];
    _label.font = [UIFont boldSystemFontOfSize:18];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
    _nameWalletLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_label.frame) + 20, self.view.CZH_width-20, 20)];
    NSString *bearerStr = @"请转入： ";
    NSString *numberStr = numberStrtext;
    NSString *nillStr = @" ";
    NSString *currencyStr = currencyStrtext;
    NSString *pinjieStr0 = [bearerStr stringByAppendingString: numberStr];
    NSString *pinjieStr1 = [pinjieStr0 stringByAppendingString: nillStr];
    NSString *pinjieStr2 = [pinjieStr1 stringByAppendingString: currencyStr];
    _nameWalletLabel.text = pinjieStr2;
    _nameWalletLabel.textColor = [UIColor blackColor];
    _nameWalletLabel.font = [UIFont boldSystemFontOfSize:15];
    _nameWalletLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_nameWalletLabel];
    
    _QrcodeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.CZH_width/4, CGRectGetMaxY(_nameWalletLabel.frame) + 20, self.view.CZH_width/2, self.view.CZH_width/2)];
    _QrcodeImageView.image = [UIImage imageNamed:qrcodeImage];
    _QrcodeImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_QrcodeImageView];
    
    _replacementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _replacementBtn.frame = CGRectMake(0, CGRectGetMaxY(_QrcodeImageView.frame) + 30, self.view.CZH_width/2-20, 44);
    [_replacementBtn setTitle:@"更换资产" forState:UIControlStateNormal];
    [_replacementBtn setBackgroundColor:[UIColor whiteColor]];
    [_replacementBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _replacementBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_replacementBtn addTarget:self action:@selector(replacementBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_replacementBtn];
    
    _setCountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _setCountBtn.frame = CGRectMake(self.view.CZH_width/2+20, CGRectGetMaxY(_QrcodeImageView.frame) + 30, self.view.CZH_width/2-20, 44);
    [_setCountBtn setTitle:@"设置金额" forState:UIControlStateNormal];
    [_setCountBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_setCountBtn setBackgroundColor:[UIColor whiteColor]];
    _setCountBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_setCountBtn addTarget:self action:@selector(setCountBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_setCountBtn];
}
-(void)replacementBtnClick{
    CZHLog(@"%s",__func__);
    [self AssetsAlter];
}
-(void)setCountBtnClick{
    CZHLog(@"%s",__func__);
    [self EnterAmountNumClick];
}
#pragma mark -- 选择资产类型弹窗
- (void)AssetsAlter{
    AssetsTypeAlter *_alert = [[AssetsTypeAlter alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) andHeight:kSize (380)];
    _alert.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:_alert];
    [_alert showView];
}
#pragma mark -- 设置金额弹窗
- (void)EnterAmountNumClick{
    CGFloat dilX = 25;
    CGFloat dilH = 150;
    YXCustomAlertView *alertV = [[YXCustomAlertView alloc] initAlertViewWithFrame:CGRectMake(dilX, 0, 280, dilH) andSuperView:self.navigationController.view];
    alertV.center = CGPointMake(Main_Screen_Width/2, Main_Screen_Height/2-30);
    alertV.delegate = self;
    alertV.titleStr = @"收款金额";
    CGFloat loginX = 20;
    UITextField *loginPwdField = [[UITextField alloc] initWithFrame:CGRectMake(loginX, 55, alertV.frame.size.width - 2 * loginX, 32)];
    loginPwdField.layer.borderColor = [[UIColor colorWithWhite:0.9 alpha:1] CGColor];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 32)];
    loginPwdField.leftViewMode = UITextFieldViewModeAlways;
    loginPwdField.leftView = leftView;
    loginPwdField.placeholder = @"请输入收款金额";
    loginPwdField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    loginPwdField.layer.borderWidth = 1;
    loginPwdField.layer.cornerRadius = 4;
    [alertV addSubview:loginPwdField];
}
/*
[weakSelf AssetsAlter];
[weakSelf EnterAmountNumClick];
 */
#pragma mark - YXCustomAlertViewDelegate
- (void) customAlertView:(YXCustomAlertView *) customAlertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        [customAlertView dissMiss];
        customAlertView = nil;
#pragma mark -- 设置金额弹窗的取消按键
    }else{
#pragma mark -- 设置金额弹窗的按键
        NSLog(@"确认");
    }
}
@end
