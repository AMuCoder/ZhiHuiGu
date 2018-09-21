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

@interface ZHGHomeViewController ()

/// 背景的UIScrollView
@property (nonatomic, strong) CZHScrollView *scrollView;
/// navigation视图
@property (nonatomic, strong) CZHNavigationView *navigationView;


@end

@implementation ZHGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavBar];
}
#pragma mark 导航栏右边双按钮
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
        if (contentOffsetY > 100) {
            weakSelf.navigationView.alpha = 1;
        } else if (contentOffsetY > 50) {
            weakSelf.navigationView.alpha = 1 - (100 - contentOffsetY) / 50.f;
        }
    };
}

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
#pragma mark - Get方法
-(CZHScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[CZHScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, self.view.CZH_height)];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(CZHNavigationView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[CZHNavigationView alloc] initWithFrame:CGRectMake(0, 0, 120.f, 40.f)];
        _navigationView.hidden = YES;
    }
    
    return _navigationView;
}

@end
