//
//  CZHScrollView.h
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingScrollView.h"
@class HeaderFourView,CZHTableView,Czh_mineAssetsView,CCCycleScrollView,Czh_AssetChangesView;

typedef void(^CZHScrollViewContentOffsetAction)(CGFloat contentOffsetY);

@interface CZHScrollView : TPKeyboardAvoidingScrollView
/// 列表
@property (nonatomic, strong) CZHTableView *tableView;

@property (nonatomic, strong) HeaderFourView *headerView;
/// 偏移事件
@property (nonatomic, copy)   CZHScrollViewContentOffsetAction contentOffsetAction;
//资产
@property (nonatomic, strong) Czh_mineAssetsView *mineAssetsView;
@property (nonatomic, strong) CCCycleScrollView *cyclePlayView;
@property (nonatomic, strong) Czh_AssetChangesView *assetOfChangesView;
@end
