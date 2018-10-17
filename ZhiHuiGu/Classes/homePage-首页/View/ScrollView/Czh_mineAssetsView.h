//  文件名: Czh_mineAssetsView.h
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>
@class mineAssetsTableView,AssetChangesView;
@interface Czh_mineAssetsView : UIView
@property(nonatomic,strong) UILabel *mineAssetsLabel;
@property(nonatomic,strong) UIButton *moreBtn;
@property(nonatomic,strong) mineAssetsTableView *mineTableView;
@property(nonatomic,strong) AssetChangesView *assetchangesView;
@property(nonatomic,strong) NSArray *imagesArr;

@end
