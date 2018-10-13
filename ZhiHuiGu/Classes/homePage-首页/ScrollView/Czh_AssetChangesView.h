//  文件名: Czh_AssetChangesView.h
//  创建者: CYJ 时间: 2018/10/13.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>
#import "AssetChangesView.h"

@interface Czh_AssetChangesView : UIView<CAAnimationDelegate>
@property (strong, nonatomic) AssetChangesView *assetChangesView;
@property (strong, nonatomic) NSArray *updownDataArray;
@property (nonatomic,strong) UIButton *btn;
- (void)setViewWithUpDownArray:(NSArray *)upDownArray;
@end
