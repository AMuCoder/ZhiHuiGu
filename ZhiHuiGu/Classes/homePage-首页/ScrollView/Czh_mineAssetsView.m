//  文件名: Czh_mineAssetsView.m
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_mineAssetsView.h"
#import "mineAssetsTableView.h"
#import "AssetChangesView.h"
@interface Czh_mineAssetsView()

@end
@implementation Czh_mineAssetsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //我的资产
        _mineAssetsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.CZH_width/2 - 20, 40)];
        _mineAssetsLabel.text = @"我的资产";
        _mineAssetsLabel.textAlignment = NSTextAlignmentLeft;
        _mineAssetsLabel.textColor = [UIColor blackColor];
        _mineAssetsLabel.font = [UIFont boldSystemFontOfSize:15];
        [self addSubview:_mineAssetsLabel];
        //更多按钮
        //设置button的类型是UIButtonTypeRoundedRect
        _moreBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _moreBtn.frame = CGRectMake(self.CZH_width - 70, 0, 50, 40);
        _moreBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
//        [moreBtn setTitle:@"No" forState:UIControlStateSelected];
        //设置button响应点击事件的方法是buttonPressed：
//        [moreBtn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_moreBtn];
        
        _mineTableView = [[mineAssetsTableView alloc] initWithFrame:CGRectMake(10, 40, self.CZH_width-20, 220)];
        _mineTableView.layer.cornerRadius = 5;
        [self addSubview:_mineTableView];
        
//        _assetchangesView = [[AssetChangesView alloc] initWithFrame:CGRectMake(0, 270, self.CZH_width, 80)];
//        [self addSubview:_assetchangesView];
        
    }
    return self;
}
-(mineAssetsTableView *)mineTableView{
    if (!_mineTableView) {
        _mineTableView = [[mineAssetsTableView alloc] initWithFrame:CGRectMake(10, 40, self.CZH_width-20, 220)];
        [self addSubview:_mineTableView];
    }
    return _mineTableView;
}
@end
