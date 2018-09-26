//
//  ZHGSearchBar.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/26.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGSearchBar.h"
@interface ZHGSearchBar()
//搜索框
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITextField *searchField;
@end

@implementation ZHGSearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame])
    {
    }
    return self;
}
@end
