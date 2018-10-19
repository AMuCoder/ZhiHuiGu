//  文件名: Czh_RememberParticalVC.m
//  创建者: CYJ 时间: 2018/10/7.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：记住助记词

#import "Czh_RememberParticalVC.h"
#import "RTNavigationBar.h"
#import "Czh_LoginBtn.h"
#import "UILabel+Czh_UILabel.h"
#import "Czh_UILabel.h"
#import "Czh_BackupMnemonicVC.h"
#import "Czh_RememberParticalView.h"
#import "Czh_ImportWalletVC.h"

@interface Czh_RememberParticalVC ()
@property(nonatomic,strong) Czh_LoginBtn *ZJCNextBtn;
@property(nonatomic,strong) Czh_RememberParticalView *particalView;
@property(nonatomic,strong) NSString *particalStr;

@end

@implementation Czh_RememberParticalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self showAlterView];
    [self setupView];
}

#pragma mark -- 添加导航栏
-(void)setNav{
    
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    UINavigationBar *nav = [RTNavigationBar defaultBar];
    nav.barTintColor = [UIColor whiteColor];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"抄写助记词"];
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"navigationButtonReturn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [left setImageEdgeInsets:UIEdgeInsetsMake(0, /*0*/-23, 0, 0)];
    [left addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:left];
    [navigationItem setLeftBarButtonItem:leftBtn animated:NO];
    [nav pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:nav];
}
-(void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)showAlterView{
    [CZHAlertView showAlertWithTitle:@"请勿截图"
                            message:@"如果有人获取你的助记词将直接获取你的资产！请抄写助记词并存放在安全的地方。"
                        cancelTitle:@"知道了"
                         completion:^(BOOL cancelled) {
                             if (cancelled) {
                                 NSLog(@"Simple Alert View cancelled");
                             } else {
                                 NSLog(@"Simple Alert View dismissed, but not cancelled");
                             }
                         }];
}

-(void)setupView{
    /**ios 11判断*/
    CGFloat kheight;
    if (@available(iOS 11.0, *)) {
        kheight = 120.f;
    }else{
        kheight = 84;
    }

#pragma mark
    UILabel *label = [[Czh_UILabel alloc] initWithFrame:CGRectMake(10, kheight, Main_Screen_Width - 20, 44) labelTextColor:[UIColor blackColor] sizeFloat:20.f textAlignment:NSTextAlignmentCenter];
    label.text = @"抄写下您的钱包助记词";
    [self.view addSubview:label];
    
    UILabel *tishiLabel = [[Czh_UILabel alloc] init];
    tishiLabel.numberOfLines = 0;
    [tishiLabel setFont:[UIFont systemFontOfSize:15.f]];
    tishiLabel.text = @"助记词用于创建或恢复钱包密码，将它准确的抄写到纸上，并存放于只有您知道的地方。切记千万不要保存到网络上。";
    CGRect frameNew = [tishiLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:tishiLabel.font} context:nil];  // 指定为width，通常都是控件的width都是固定调整height
    tishiLabel.frame = CGRectMake(25, CGRectGetMaxY(label.frame) + 20, self.view.CZH_width - 50, frameNew.size.height);
    [self.view addSubview:tishiLabel];
    [tishiLabel setTextColor:[UIColor grayColor]];
    [UILabel changeLineSpaceForLabel:tishiLabel WithSpace:5];
    
    Czh_RememberParticalView *particalView = [[Czh_RememberParticalView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tishiLabel.frame) + 20, self.view.CZH_width, 120)];
    [self.view addSubview:particalView];
    _particalView = particalView;
    
    self.particalStr = [[NSUserDefaults standardUserDefaults] objectForKey:kUserMnemonicKey];
    self.particalView.label.text = [self.particalStr stringByReplacingOccurrencesOfString:@" "withString:@"    "];
    CZHLog(@"self.particalView.label.text:%@\nparticalStr:%@",self.particalView.label.text,self.particalStr);
    
    Czh_LoginBtn *ZJCNextBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(particalView.frame) + 30, Main_Screen_Width - 40, 44)];
    [ZJCNextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    ZJCNextBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:ZJCNextBtn];
    _ZJCNextBtn = ZJCNextBtn;
    [self.ZJCNextBtn addTarget:self action:@selector(ZJCNextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *footerLabel = [[UILabel alloc] init];
    footerLabel.numberOfLines = 0;
    [footerLabel setFont:[UIFont systemFontOfSize:14.f]];
    footerLabel.text = @"助记词用于创建或恢复钱包密码，将它准确的抄写到纸上，并存放于只有您知道的地方。切记千万不要保存到网络上。";
    [UILabel changeLineSpaceForLabel:footerLabel WithSpace:5];
    CGRect footerLabelFrame = [footerLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:footerLabel.font} context:nil];
    footerLabel.frame = CGRectMake(25, CGRectGetMaxY(self.ZJCNextBtn.frame) + 15, self.view.CZH_width - 50, footerLabelFrame.size.height);
    [self.view addSubview:footerLabel];
    [footerLabel setTextColor:[UIColor redColor]];
    
}

- (void)ZJCNextBtnClick {
    CZHLog(@"%s",__func__);
    [self presentViewController:[Czh_BackupMnemonicVC new] animated:NO completion:nil];
}
@end
