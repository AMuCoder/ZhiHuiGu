//
//  Czh_TabBarController.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/20.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_TabBarController.h"
#import "CZHNavigationController.h"
#import "Czh_HomeViewController.h"
#import "Czh_MarketViewController.h"
#import "Czh_ShoppingMallViewController.h"
#import "Czh_FriendsViewController.h"
#import "Czh_MeViewController.h"
#import "CZHTabBar.h"
#import "RTDeviceHardware.h"

@interface Czh_TabBarController ()

@end

@implementation Czh_TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setupChildVc:[[Czh_HomeViewController alloc]init] title:@"首页" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVc:[[Czh_MarketViewController alloc]init] title:@"市场" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[Czh_ShoppingMallViewController alloc]init] title:@"商城" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[Czh_FriendsViewController alloc]init] title:@"朋友" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildVc:[[Czh_MeViewController alloc]init] title:@"我的" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    //更换自己定义的tabbar
    /*
     *KVC语法：CZHTabBar对象赋值给TabBarController的属性tabBar
     */
//    [self setValue:[[CZHTabBar alloc] init] forKeyPath:@"tabBar"];
    
    //添加中间按钮}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
}

/*
 *初始化子控制器
 */
-(void)setupChildVc:(UIViewController* )vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    //vc.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1.0];
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    CZHNavigationController *nav = [[CZHNavigationController alloc] initWithRootViewController:vc];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //TODO: modify tabbar's y value.
    if ([RTDeviceHardware iPhoneXDevice]) {
        CGFloat deltaTabBarY = Main_Screen_Height - CGRectGetHeight(self.tabBar.frame);
        self.tabBar.frame = (CGRect){0, deltaTabBarY, self.tabBar.bounds.size};
    }
}
@end
