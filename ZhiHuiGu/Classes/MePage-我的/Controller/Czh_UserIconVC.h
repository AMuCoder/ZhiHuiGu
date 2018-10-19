//  文件名: Czh_UserIconVC.h
//  创建者: CYJ 时间: 2018/10/19.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "BBGestureBaseController.h"
@class Czh_UserIconVC;
@protocol Czh_UserIconDelegate <NSObject>
@end

@interface Czh_UserIconVC : BBGestureBaseController

@property(nonatomic,weak) id<Czh_UserIconDelegate> iconDelegate;

@end
