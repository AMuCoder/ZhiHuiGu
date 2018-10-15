//
//  AppDelegate.h
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/19.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end

