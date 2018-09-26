//
//  CZHScrollView.m
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "CZHScrollView.h"
#import "CZHHeaderView.h"
#import "CZHTableView.h"
#import "MJRefresh.h"
#import "UIView+Frame.h"
#import "ZHGFuncHeaderView.h"
#import "ZHGHeaderView.h"

#define kHeaderHeight 100.f
#define headerViewH kHeaderHeight+KFAppHeight

@interface CZHScrollView() <UIScrollViewDelegate>

/// 列表
@property (nonatomic, strong) CZHTableView *tableView;
// 列表头部(4)
//@property (nonatomic, strong) CZHHeaderView *headerView;
//// 列表头部(12)
//@property (nonatomic, strong) ZHGFuncHeaderView *funcHeaderView;

@property (nonatomic, strong) ZHGHeaderView *headerView;
@end

@implementation CZHScrollView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        [self headerView];
        
        // 设定tableView的行数
        self.tableView.rowNumber = 20;
        // 设定自身的偏移量，tableViewCell的高度是50
        self.contentSize = CGSizeMake(0, headerViewH + self.tableView.rowNumber * 50.f + 64.f);
        
        __weak __typeof(self)weakSelf = self;
        // 下拉刷新
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf loadMoreData];
        }];
    }
    
    return self;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    if (contentOffsetY < -kHeaderHeight / 2) {
        // 当结束滑动的偏移量小于-50，就开始刷新tableView
        [self.tableView.mj_header beginRefreshing];
    } else if (contentOffsetY > 0 && contentOffsetY < headerViewH / 3) {
        // 当偏移量大于0并且小于50，就把偏移量设置在CGPointMake(0, 0)
        [self setContentOffset:CGPointMake(0, headerViewH/3) animated:YES];
    } else if (contentOffsetY > headerViewH / 2 && contentOffsetY < headerViewH) {
        // 当偏移量大于50并且小于kHeaderHeight，就把偏移量设置在CGPointMake(0, kHeaderHeight)
        [self setContentOffset:CGPointMake(0, headerViewH) animated:YES];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 偏移量
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    NSLog(@"contentOffsetY----0:%f",contentOffsetY);
    // 将偏移量放入block
    if (self.contentOffsetAction) {
        self.contentOffsetAction(contentOffsetY);
    }

    if (contentOffsetY <= 0) {
        // 当偏移量小于0时，头部视图的Y值跟随偏移量上移
        self.headerView.CZH_y = contentOffsetY;
        // tableView的Y值也是保持不变
        self.tableView.CZH_y = contentOffsetY + kHeaderHeight + KFAppHeight;
        NSLog(@"contentOffsetY***<=0***:%f",contentOffsetY);
        // 当tableView没有刷新时，tableView的contentOffset发生改变
        if (![self.tableView.mj_header isRefreshing]) {
            self.tableView.contentOffset = CGPointMake(0, contentOffsetY);
        }
    } else {
        // 头部视图滚动差的效果
        self.headerView.CZH_y = contentOffsetY/2;
        NSLog(@"contentOffsetY---->0:%f,%f",contentOffsetY,self.headerView.CZH_y);
    }
    self.headerView.czhheaderView.contentOffsetY = contentOffsetY;
    NSLog(@"contentOffsetY-:%f",contentOffsetY);
}

#pragma mark - 网络请求
- (void)loadMoreData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - Get方法
-(CZHTableView *)tableView {
    if (!_tableView) {
        _tableView = [[CZHTableView alloc] initWithFrame:CGRectMake(0, kHeaderHeight + KFAppHeight, self.CZH_width, self.CZH_height) style:UITableViewStylePlain];
        // 禁止tableView滑动
        _tableView.scrollEnabled = YES;
        
        [self addSubview:_tableView];
    }
    
    return _tableView;
}
-(ZHGHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[ZHGHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, headerViewH)];
        [self addSubview:_headerView];
    }
    NSLog(@"%----------------------%f",_headerView.frame.size.height);
    return _headerView;
    
}



@end
//-(CZHHeaderView *)headerView {
//    if (!_headerView) {
//        _headerView = [[CZHHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.CZH_width, kHeaderHeight)];
//        [self addSubview:_headerView];
//    }
//
//    return _headerView;
//}
//-(ZHGFuncHeaderView *)funcHeaderView {
//    if (!_funcHeaderView) {
//        self.funcHeaderView = [[ZHGFuncHeaderView alloc] initWithFrame:CGRectMake(0, kHeaderHeight, self.CZH_width, KFAppHeight)];
//        self.funcHeaderView.backgroundColor = [UIColor grayColor];
//        [self addSubview:_funcHeaderView];
//    }
//    return _funcHeaderView;
//}
