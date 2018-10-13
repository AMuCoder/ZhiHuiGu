//
//  Czh_HomeViewController.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/20.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_HomeViewController.h"
#import "CZHScrollView.h"
#import "UIView+Frame.h"
#import "CZHNavigationView.h"
#import "SWQRCode.h"
#import "CZHButton.h"
#import "Czh_HeaderView.h"
#import "Czh_UIView.h"
#import "NSArray+Czh_JSON.h"
#import "NSData+AES128.h"
#import "PXAlertView.h"
#import "YXCustomAlertView.h"
#import "AssetsTypeAlter.h"

@interface Czh_HomeViewController ()<UISearchBarDelegate,YXCustomAlertViewDelegate>
/// 背景的UIScrollView
@property (nonatomic, strong) CZHScrollView *scrollView;
/// navigation视图
@property (nonatomic, strong) CZHNavigationView *navigationView;
/// 搜索框
@property(nonatomic,strong) UISearchBar *searchBar;
@property(nonatomic,strong) UIView *titleView;

@end

@implementation Czh_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]}];//设置title颜色
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupNavBar];
    [self headerFourViewBtnClick];
//    [self setupSearchBarView];
    [self headerViewClick];
}
- (void)viewWillAppear:(BOOL)animated{//去除导航栏下方的横线
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if (iOS10) {
            //iOS10,改变了导航栏的私有接口为_UIBarBackground
            if ([view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                [view.subviews firstObject].hidden = YES;
            }
        }else{
            //iOS10之前使用的是_UINavigationBarBackground
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
                [view.subviews firstObject].hidden = YES;
            }
        }
    }];
}
#pragma mark - 4按钮点击回调事件
-(void)headerViewClick{
    __weak __typeof(self)weakSelf = self;
    /**扫一扫*/
    [self.navigationView.scanBtn setClickBlock:^(UIButton *button) {
        SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
        config.scannerType = SWScannerTypeBoth;
        SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
        qrcodeVC.codeConfig = config;
        [weakSelf.navigationController pushViewController:qrcodeVC animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.headerView.scanBtn setClickBlock:^(UIButton *button) {
        SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
        config.scannerType = SWScannerTypeBoth;
        SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
        qrcodeVC.codeConfig = config;
        [weakSelf.navigationController pushViewController:qrcodeVC animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    
    /**收款*/
    [self.navigationView.paymentBtn setClickBlock:^(UIButton *button) {
        [PXAlertView showAlertWithWalletNameTitle:@"WEC" WalletAddressTitle:@"qwerqwer....qwerqwer" WalletCurrencyTitle:@"请转入 XXX WEC" HeadImage:@"QWE" QrcodeImage:@"QWE" cancelTitle:@"更换资产" otherTitle:@"设置金额" completion:^(BOOL cancelled) {
            //
            if (cancelled) {
                [weakSelf AssetsAlter];
            } else {//设置金额
                [weakSelf EnterAmountNumClick];
            }
        }];
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.headerView.paymentBtn setClickBlock:^(UIButton *button) {
        [PXAlertView showAlertWithWalletNameTitle:@"WEC" WalletAddressTitle:@"qwerqwer....qwerqwer" WalletCurrencyTitle:@"请转入 XXX WEC" HeadImage:@"QWE" QrcodeImage:@"QWE" cancelTitle:@"更换资产" otherTitle:@"设置金额" completion:^(BOOL cancelled) {
            //
            if (cancelled) {
                [weakSelf AssetsAlter];
            } else {
                [weakSelf EnterAmountNumClick];
            }
        }];
    } andEvent:UIControlEventTouchUpInside];
    
    /**
     上下按钮
     */
    [self.navigationView.collectBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"navigationView.collectBtn--------回调成功！");
    } andEvent:UIControlEventTouchUpInside];
    [self.scrollView.headerView.collectBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"scrollView.headerView.headfourView.collectBtn--------回调成功！");
    } andEvent:UIControlEventTouchUpInside];
    
    /**
     上下按钮
     */
    [self.navigationView.phoneBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"navigationView.phoneBtn--------回调成功！");
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.headerView.phoneBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"scrollView.headerView.headfourView.phoneBtn--------回调成功！");
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *userName = [userDefaults objectForKey:kUserNameKey];
        NSString *passWord = [userDefaults objectForKey:kUserPwdKey];
//        NSString *token = [userDefaults objectForKey:kUserPwdKey];
        CZHLog(@"---------%@---------%@",userName,passWord);
        NSDictionary *dictionary = [userDefaults dictionaryRepresentation];
        for(NSString* key in [dictionary allKeys]){
            [userDefaults removeObjectForKey:key];
            [userDefaults synchronize];
        }
    } andEvent:UIControlEventTouchUpInside];
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
#pragma mark - YXCustomAlertViewDelegate
- (void) customAlertView:(YXCustomAlertView *) customAlertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        [customAlertView dissMiss];
        customAlertView = nil;
#pragma mark -- 设置金额弹窗的取消按键
        [PXAlertView showAlertWithWalletNameTitle:@"WEC" WalletAddressTitle:@"qwerqwer....qwerqwer" WalletCurrencyTitle:@"请转入 XXX WEC" HeadImage:@"QWE" QrcodeImage:@"QWE" cancelTitle:@"更换资产" otherTitle:@"设置金额" completion:^(BOOL cancelled) {
            if (cancelled) {
                NSLog(@"Cancel (Blue) button pressed");
            } else {
                [self EnterAmountNumClick];
            }
        }];
    }else{
        NSLog(@"确认");
    }
}
- (void)EnterAmountClick{
    [PXAlertView showAlertWithTitle:@"请输入金额" EnterAmountTextFieldText:@"23444" EnterAmountTextFieldHolder:@"请输入收款金额" cancelTitle:@"取消" otherTitle:@"确定" completion:^(BOOL cancelled) {
        if (cancelled) {
            [self AssetsAlter];
        } else {
            [self EnterAmountNumClick];
        }
    }];
}
#pragma mark - 导航栏右边双按钮
- (void)setupNavBar
{
    //右边导航栏两个按钮
    self.navigationItem.rightBarButtonItems = @[
                                                [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(setting)],
                                                [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moon)]
                                                ];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:52.0 / 255.0 green:104.0 / 255.0 blue:206.0 / 255.0 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.navigationView];
//    self.navigationItem.leftBarButtonItem = item;
    
    __weak __typeof(self)weakSelf = self;
    self.scrollView.contentOffsetAction = ^(CGFloat contentOffsetY) {
        [weakSelf.view endEditing:YES];
        if (contentOffsetY > 50) {
            //显示左边leftBarButtonItem
            weakSelf.navigationItem.leftBarButtonItem = item;
            [weakSelf.navigationItem.titleView removeFromSuperview];
            weakSelf.navigationView.hidden = contentOffsetY < 50;
            weakSelf.navigationItem.titleView = nil;
            //weakSelf.title = nil;
            
        }else{
            //移除左边leftBarButtonItem
            weakSelf.navigationItem.leftBarButtonItem = nil;
            weakSelf.navigationItem.titleView = weakSelf.titleView;
            weakSelf.title = @"首页";
        }
        if (contentOffsetY > 100) {
            weakSelf.navigationView.alpha = 1;
        } else if (contentOffsetY > 50) {
            weakSelf.navigationView.alpha = 1 - (100 - contentOffsetY) / 50.f;
        }
    };
    
}
#pragma mark - 右边导航栏按钮点击事件
/**
 右边导航栏按钮点击事件
 */
- (void)setting
{
    CZHLog(@"第一个");
}

- (void)moon
{
    CZHLog(@"第二个");
}
#pragma mark - 导航栏搜索框
-(void)setupSearchBarView{
    /**
     iOS11之后导航栏搜索框进行重新设置，否则搜索框上移动
     */
    UIView *titleView = [[Czh_UIView alloc] init];
    titleView.CZH_x = 7;
    titleView.CZH_y = 7;
    titleView.CZH_width = self.view.CZH_width - 90;
    titleView.CZH_height = 30;
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];
    searchBar.placeholder = @"点击搜索";
    searchBar.delegate = self;
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.tintColor = [UIColor whiteColor];
    [titleView addSubview:searchBar];
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.navigationItem.titleView = titleView;
    _searchBar = searchBar;
    _titleView = titleView;
}

#pragma mark - Get方法scrollView/navigationView
-(CZHScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[CZHScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, self.view.CZH_height)];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
//点击上下滚动视图
-(void)topNewsInfoClicked:(id)sender{
    NSLog(@"点击上下滚动视图");
}
-(CZHNavigationView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[CZHNavigationView alloc] initWithFrame:CGRectMake(0, 0, 160.f, 40.f)];
        _navigationView.hidden = YES;
    }
    return _navigationView;
}

-(void)headerFourViewBtnClick{
}


@end
