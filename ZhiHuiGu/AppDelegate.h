//
//  AppDelegate.h
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/19.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import "BBGestureBaseController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) BBGestureBaseView *gestureBaseView;
@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate* )shareAppDelegate;
@end

