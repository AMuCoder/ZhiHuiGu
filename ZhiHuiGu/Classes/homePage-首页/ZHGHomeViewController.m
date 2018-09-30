//
//  ZHGHomeViewController.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/20.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGHomeViewController.h"
#import "CZHScrollView.h"
#import "UIView+Frame.h"
#import "CZHNavigationView.h"
#import "CZHSearchBar.h"
#import "SWQRCode.h"
#import "CZHButton.h"
#import "ZHGHeaderView.h"

@interface ZHGHomeViewController ()<UISearchBarDelegate>

/// 背景的UIScrollView
@property (nonatomic, strong) CZHScrollView *scrollView;
/// navigation视图
@property (nonatomic, strong) CZHNavigationView *navigationView;
/// 搜索框
@property (nonatomic, strong) UISearchBar *searchBarView;
@end

@implementation ZHGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavBar];
    [self headerFourViewBtnClick];
    
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
    } andEvent:UIControlEventTouchUpInside];
}
#pragma mark - 导航栏右边双按钮
- (void)setupNavBar
{
    self.navigationItem.rightBarButtonItems = @[
                                                [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(setting)],
                                                [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moon)]
                                                ];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:52.0 / 255.0 green:104.0 / 255.0 blue:206.0 / 255.0 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.navigationView];
    self.navigationItem.leftBarButtonItem = item;
    
    __weak __typeof(self)weakSelf = self;
    self.scrollView.contentOffsetAction = ^(CGFloat contentOffsetY) {
        weakSelf.navigationView.hidden = contentOffsetY < 50;
        weakSelf.searchBarView.hidden = contentOffsetY > 50;
        if (contentOffsetY > 100) {
            weakSelf.navigationView.alpha = 1;
        } else if (contentOffsetY > 50) {
            weakSelf.navigationView.alpha = 1 - (100 - contentOffsetY) / 50.f;
            weakSelf.searchBarView.hidden = NO;
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
    CGRect mainViewBounds = self.navigationController.view.bounds;
    _searchBarView = [[UISearchBar alloc] initWithFrame:CGRectMake(40, 20, CGRectGetWidth(mainViewBounds)-120, 40)];
    _searchBarView.placeholder = @"点击搜索";
    _searchBarView.delegate = self;
    _searchBarView.showsCancelButton = NO;
    _searchBarView.searchBarStyle = UISearchBarStyleMinimal;
    _searchBarView.tintColor = [UIColor whiteColor];
    _searchBarView.barStyle = UIBarStyleBlack;
    
    UITextField *textfield = [_searchBarView valueForKey:@"_searchField"];
    [textfield setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textfield setValue:[UIFont boldSystemFontOfSize:15]forKeyPath:@"_placeholderLabel.font"];
    [self.navigationController.view addSubview: _searchBarView];
    
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
