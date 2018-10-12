//  文件名: Czh_collectionVC.m
//  创建者: CYJ 时间: 2018/10/11.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_collectionVC.h"
#import "Czh_collectionView.h"

@interface Czh_collectionVC ()
@property(nonatomic,strong) Czh_collectionView *collectionView;

@end

@implementation Czh_collectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    Czh_collectionView *collectionView = [[Czh_collectionView alloc] init];
    collectionView.CZH_width = self.view.frame.size.width - 20;
    collectionView.CZH_height = 340;
    collectionView.center = self.view.center;
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
}


@end
