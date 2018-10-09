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
#import "CZHSearchBar.h"
#import "SWQRCode.h"
#import "CZHButton.h"
#import "Czh_HeaderView.h"
#import "Czh_UIView.h"

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [self setupNavBar];
    [self headerFourViewBtnClick];
    [self setupSearchBarView];
/**
 4按钮点击回调事件
 @return #import "UIButton+CZHClickBtnBlock.h"
 */
    [self headerViewClickBtn];
}
#pragma mark - 4按钮点击回调事件
-(void)headerViewClickBtn{
    
    __weak __typeof(self)weakSelf = self;
    /**
     上下按钮
     */
    [self.navigationView.scanBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"navigationView.scanBtn--------回调成功！");
        // 需要执行的操作
        SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
        config.scannerType = SWScannerTypeBoth;
        
        SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
        qrcodeVC.codeConfig = config;
        [weakSelf.navigationController pushViewController:qrcodeVC animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    [self.scrollView.headerView.headfourView.scanBtn setClickBlock:^(UIButton *button) {
        // 需要执行的操作
        SWQRCodeConfig *config = [[SWQRCodeConfig alloc]init];
        config.scannerType = SWScannerTypeBoth;
        
        SWQRCodeViewController *qrcodeVC = [[SWQRCodeViewController alloc]init];
        qrcodeVC.codeConfig = config;
        [weakSelf.navigationController pushViewController:qrcodeVC animated:YES];
    } andEvent:UIControlEventTouchUpInside];
    
    /**
     上下按钮
     */
    [self.navigationView.paymentBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"navigationView.paymentBtn--------回调成功！");
        // 需要执行的操作
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.headerView.headfourView.paymentBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"scrollView.headerView.headfourView.paymentBtn--------回调成功！");
    } andEvent:UIControlEventTouchUpInside];
    
    /**
     上下按钮
     */
    [self.navigationView.collectBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"navigationView.collectBtn--------回调成功！");
    } andEvent:UIControlEventTouchUpInside];
    [self.scrollView.headerView.headfourView.collectBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"scrollView.headerView.headfourView.collectBtn--------回调成功！");
    } andEvent:UIControlEventTouchUpInside];
    
    /**
     上下按钮
     */
    [self.navigationView.phoneBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"navigationView.phoneBtn--------回调成功！");
    } andEvent:UIControlEventTouchUpInside];
    
    [self.scrollView.headerView.headfourView.phoneBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"scrollView.headerView.headfourView.phoneBtn--------回调成功！");
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *userName = [userDefaults objectForKey:kUserNameKey];
        NSString *passWord = [userDefaults objectForKey:kUserPwdKey];
        NSString *token = [userDefaults objectForKey:kUserPwdKey];
        CZHLog(@"---------%@---------%@",userName,passWord);
        NSDictionary *dictionary = [userDefaults dictionaryRepresentation];
        for(NSString* key in [dictionary allKeys]){
            [userDefaults removeObjectForKey:key];
            [userDefaults synchronize];
        }
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
            weakSelf.navigationItem.leftBarButtonItem = item;
            weakSelf.navigationView.hidden = contentOffsetY < 50;
            weakSelf.navigationItem.titleView = nil;
            weakSelf.title = nil;
        }else{
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
