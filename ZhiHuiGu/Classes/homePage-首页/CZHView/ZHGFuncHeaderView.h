//
//  ZHGFuncHeaderView.h
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/26.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CategoryModel;

@interface ZHGFuncHeaderView : UIView

/**block*/
@property (nonatomic, strong) void (^moreCategory)(void);
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *homeFunctionArray;
/// 偏移量
@property (nonatomic, assign) CGFloat contentOffsetY;
@end
