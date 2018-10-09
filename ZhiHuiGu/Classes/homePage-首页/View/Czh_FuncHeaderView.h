//
//  Czh_FuncHeaderView.h
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/26.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CategoryModel;

@interface Czh_FuncHeaderView : UIView

/**block*/
@property (nonatomic, strong) void (^moreCategory)(void);
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *homeFunctionArray;
/// 偏移量
@property (nonatomic, assign) CGFloat contentOffsetY;
@end
