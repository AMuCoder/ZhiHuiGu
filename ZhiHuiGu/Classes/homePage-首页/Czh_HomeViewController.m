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
#import "Czh_collectionVC.h"
#import "Czh_TopUpVC.h"
#import "Czh_AssetChangesView.h"
#import "Czh_TransferVC.h"


@interface Czh_HomeViewController ()<UISearchBarDelegate>
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
    //[self setupSearchBarView];
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
        [weakSelf.navigationController pushViewController:[Czh_collectionVC new] animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.headerView.paymentBtn setClickBlock:^(UIButton *button) {
        [weakSelf.navigationController pushViewController:[Czh_collectionVC new] animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    
    /**
     支付
     */
    [self.navigationView.collectBtn setClickBlock:^(UIButton *button) {
        [weakSelf.navigationController pushViewController:[Czh_TopUpVC new] animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    [self.scrollView.headerView.collectBtn setClickBlock:^(UIButton *button) {
        [weakSelf.navigationController pushViewController:[Czh_TopUpVC new] animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    
    /**
     上下按钮
     */
    [self.navigationView.phoneBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"navigationView.phoneBtn--------回调成功！");
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *userName = [userDefaults objectForKey:kUserNameKey];
        NSString *passWord = [userDefaults objectForKey:kUserPwdKey];
        CZHLog(@"---------%@---------%@",userName,passWord);
        NSDictionary *dictionary = [userDefaults dictionaryRepresentation];
        for(NSString* key in [dictionary allKeys]){
            [userDefaults removeObjectForKey:key];
            [userDefaults synchronize];
        }
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.headerView.phoneBtn setClickBlock:^(UIButton *button) {
        
        [weakSelf.navigationController pushViewController:[Czh_TransferVC new] animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.assetOfChangesView.btn setClickBlock:^(UIButton *button) {
        CZHLog(@"----------------------");
    } andEvent:UIControlEventTouchUpInside];
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
