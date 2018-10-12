//
//  AppDelegate.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/19.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "AppDelegate.h"
#import "Czh_TabBarController.h"
#import "Czh_AccountTool.h"
#import "Czh_LoginAndRegisterVC.h"
#import "NSArray+Czh_JSON.h"
#import "Czh_CreateWalletVC.h"
#import "Czh_ImportWalletVC.h"
#import "Czh_RememberParticalVC.h"

@interface AppDelegate ()
@property (nonatomic, strong) Czh_TabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    BOOL isLogin = [[NSUserDefaults standardUserDefaults] boolForKey:kUserisLogin];
    NSString *mnemonicStr = [[NSUserDefaults standardUserDefaults] objectForKey:kUserMnemonicKey];
    NSString *payPdStr = [[NSUserDefaults standardUserDefaults] objectForKey:kUserPayPwdKey];
    NSString *IDStr = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIDKey];
    CZHLog(@"助记词--------:%@\n支付密码--------:%@------:%@",mnemonicStr,payPdStr,IDStr);
    // 先判断有无存储账号信息
    if (!isLogin) {
        // 之前没有登录成功
        self.window.rootViewController = [[Czh_LoginAndRegisterVC alloc] init];
    } else {// 登录成功,但是换了设备
        // 没有支付密码，进去支付密码设置
        if (!(payPdStr && mnemonicStr)) {
            self.window.rootViewController = [[Czh_ImportWalletVC alloc] init];
        // 有支付密码，没有助记词
        }else{
            self.window.rootViewController = [[Czh_TabBarController alloc] init];
        }
    }
    //显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
