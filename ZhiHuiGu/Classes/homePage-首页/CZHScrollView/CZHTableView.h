//
//  CZHTableView.h
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 偏移量block

 @param contentOffsetY 形参：无返回值
 */
typedef void(^CZHTableViewAction)(CGFloat contentOffsetY);

@interface CZHTableView : UITableView

/// tableView的偏移量
@property (nonatomic, copy) CZHTableViewAction contentOffsetAction;
/// 总行数(可以视为数据源)
@property (nonatomic, assign) NSInteger rowNumber;

@end
