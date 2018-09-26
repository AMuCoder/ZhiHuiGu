//
//  ZHGFuncHeaderView.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/26.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGFuncHeaderView.h"
#import "HomeFunctionCell.h"
#import "CategoryModel.h"

@interface ZHGFuncHeaderView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic , assign) CGFloat singleAppHeaderViewHeight;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

static NSString *cellId = @"HomeFunction";

@implementation ZHGFuncHeaderView
- (NSMutableArray *)homeFunctionArray{
    if (_homeFunctionArray == nil) {
        _homeFunctionArray = [NSMutableArray array];
        for (int i = 1; i <= 11; i++) {
            CategoryModel *model = [[CategoryModel alloc] init];
            model.title = [NSString stringWithFormat:@"支付宝%@", @(i)];
            [_homeFunctionArray addObject:model];
        }
        [self.homeFunctionArray addObject:[self.homeFunctionArray lastObject]];
    }
    return _homeFunctionArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        if (self.layout == nil) {
            self.layout=[[UICollectionViewFlowLayout alloc]init];
            //同一行相邻两个cell的最小间距
            self.layout.minimumInteritemSpacing = 0;
            //最小两行之间的间距
            self.layout.minimumLineSpacing = 0;
            self.layout.itemSize = CGSizeMake(Main_Screen_Width/5, KFAppHeight/3);
        }
        NSInteger count = self.homeFunctionArray.count;
        if (count > 8) {
            _singleAppHeaderViewHeight = KFAppHeight;
        }else if (count > 4 & count <= 8){
            _singleAppHeaderViewHeight = KFAppHeight * 2 / 3;
        }else{
            _singleAppHeaderViewHeight = KFAppHeight/3;
        }
        self.collectionView.frame = CGRectMake(0, 0, Main_Screen_Width, _singleAppHeaderViewHeight);
        if (self.collectionView == nil) {
            self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, _singleAppHeaderViewHeight) collectionViewLayout:self.layout];
            self.collectionView .delegate = self;
            self.collectionView .dataSource = self;
            self.collectionView .backgroundColor = [UIColor whiteColor];
            [self addSubview:self.collectionView];
            [self.collectionView  registerNib:[UINib nibWithNibName:@"HomeFunctionCell" bundle:nil] forCellWithReuseIdentifier:cellId];
        }
    }
    return self;
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.homeFunctionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeFunctionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    CategoryModel *model = self.homeFunctionArray[indexPath.row];
    if (indexPath.row == (self.homeFunctionArray.count-1)) {
        cell.more.text = @"更多";
        cell.more.textColor = [UIColor redColor];
    }else{
        cell.more.text = model.title;
        cell.more.textColor = [UIColor blackColor];
    }
    return cell;
    
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == (self.homeFunctionArray.count-1)) {
        if (self.moreCategory) {
            self.moreCategory();
        }
    }
}

//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

@end
