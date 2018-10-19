//  文件名: Czh_BSViewController.h
//  创建者: CYJ 时间: 2018/10/8.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：iOS UIViewController基类的实现

#import <UIKit/UIKit.h>
@class RTNavigationBar;
#import "BBGestureBaseController.h"
@interface Czh_BSViewController : BBGestureBaseController

//返回按钮
@property(nonatomic,strong) UIButton * backButton;
//导航栏标题
@property(nonatomic,strong) UILabel * navigationTitleLabel;
//导航栏右按钮（图片）
@property(nonatomic,strong) UIButton * rightButton;
//导航栏右按钮（文字）
@property(nonatomic,strong) UIButton * rightTextButton;

//为了灵活的满足不同的ViewController，将set方法放到.h文件，供子类调用
-(void)setupNavigationItem;
-(void)setBackButton;
-(void)setRightButton;
-(void)setNavigationTitleLabel;
-(void)setRightTextButton;

//返回按钮和右按钮点击方法，如果需要实现不同的方法，子类可以重新该方法
-(void)navBackClick;
-(void)navRightClick;
-(void)navRightTextClick;

@end
