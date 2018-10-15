//
//  CZHScrollView.m
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "CZHScrollView.h"
#import "HeaderFourView.h"
#import "CZHTableView.h"
#import "MJRefresh.h"
#import "UIView+Frame.h"
#import "Czh_FuncHeaderView.h"
#import "Czh_HeaderView.h"
#import "CZHButton.h"
#import "Czh_mineAssetsView.h"
#import "CCCycleScrollView.h"
#import "Czh_AssetChangesView.h"

#define kHeaderHeight 100.f
#define letHeadViewY self.frame.size.width/4 + 10
#define headerViewH kHeaderHeight+KFAppHeight

@interface CZHScrollView() <UIScrollViewDelegate,CCCycleScrollViewClickActionDeleage,CAAnimationDelegate>

@end

@implementation CZHScrollView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        [self headerView];
        //设定tableView的行数
        self.tableView.rowNumber = 20;
        //我的资产
        [self mineAssetsView];
        //数据上下滚动图
        [self assetOfChangesView];
        
        //轮播图--广告
        [self cyclePlayView];
        [self addSubview:_cyclePlayView];
        // 设定自身的偏移量
        self.contentSize = CGSizeMake(0, CGRectGetMaxY(_cyclePlayView.frame) + self.CZH_width/4 + 64.f);
        
//        __weak __typeof(self)weakSelf = self;
        // 下拉刷新
//        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            [weakSelf loadMoreData];
//        }];
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
        self.tableView.CZH_y = contentOffsetY + kHeaderHeight;
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
    self.headerView.contentOffsetY = contentOffsetY;
    NSLog(@"contentOffsetY-:%f",contentOffsetY);
}

#pragma mark - 网络请求
- (void)loadMoreData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

#pragma mark - Get方法
//-(CZHTableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[CZHTableView alloc] initWithFrame:CGRectMake(0, kHeaderHeight, self.CZH_width, self.CZH_height) style:UITableViewStylePlain];
//        // 禁止tableView滑动
//        _tableView.scrollEnabled = YES;
//        [self addSubview:_tableView];
//    }
//
//    return _tableView;
//}

-(Czh_AssetChangesView *)assetOfChangesView{
    if (!_assetOfChangesView) {
        _assetOfChangesView = [[Czh_AssetChangesView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_mineAssetsView.frame), self.CZH_width, 90)];
        [self addSubview:_assetOfChangesView];
        [_assetOfChangesView setViewWithUpDownArray:@[@1, @2, @3, @4]];
    }
    return _assetOfChangesView;
}
-(HeaderFourView *)headerView{
    if (!_headerView) {
        _headerView = [[HeaderFourView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width/4 + 10)];
        [self addSubview:_headerView];
    }
    return _headerView;
}
-(Czh_mineAssetsView *)mineAssetsView{
    if (!_mineAssetsView) {
        _mineAssetsView = [[Czh_mineAssetsView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), self.CZH_width, 270)];
        [self addSubview:_mineAssetsView];
    }
    return _mineAssetsView;
}
-(CCCycleScrollView *)cyclePlayView{
    NSMutableArray *imagesArr = [NSMutableArray array];
    for (NSInteger i = 1; i <= 6; ++i) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cycle_image%ld",(long)i]];
        [imagesArr addObject:image];
    }
    if (!_cyclePlayView) {
        _cyclePlayView = [[CCCycleScrollView alloc]initWithImages:imagesArr withFrame:CGRectMake(0, CGRectGetMaxY(_assetOfChangesView.frame), self.CZH_width, self.frame.size.height/4)];
        _cyclePlayView.pageControl.hidden = YES;
    }
    return _cyclePlayView;
}

@end
