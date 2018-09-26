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
        if ([super initWithFrame:frame]) {
                UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width - 100, 30)];
                //UIColor *color =  self.navigationController.navigationBar.tintColor;
        //        [titleView setBackgroundColor:color];
                searchBar.placeholder = @"请输入流水号、商品信息或会员信息";
                searchBar.layer.cornerRadius = 15;
                searchBar.layer.masksToBounds = YES;
        //        设置背景图是为了去掉上下黑线
                searchBar.backgroundImage = [[UIImage alloc] init];
        //        searchBar.backgroundImage = [UIImage imageNamed:@"sexBankgroundImage"];
                // 设置SearchBar的主题颜色
        //        searchBar.barTintColor = [UIColor colorWithRed:111 green:212 blue:163 alpha:1];
                //设置背景色
                searchBar.backgroundColor = [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.1];
                // 修改cancel
                searchBar.showsCancelButton=NO;
                searchBar.barStyle=UIBarStyleDefault;
                searchBar.keyboardType=UIKeyboardTypeNamePhonePad;
                //searchBar.searchBarStyle = UISearchBarStyleMinimal;//没有背影，透明样式
                searchBar.delegate = self;
                // 修改cancel
                searchBar.showsSearchResultsButton = NO;
                //5. 设置搜索Icon
                [searchBar setImage:[UIImage imageNamed:@"Search_Icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
                /*这段代码有个特别的地方就是通过KVC获得到UISearchBar的私有变量**
                          
                               searchField（类型为UITextField），设置SearchBar的边框颜色和圆角实际上也就变成了设置searchField的边框颜色和圆角，你可以试试直接设置SearchBar.layer.borderColor和cornerRadius，会发现这样做是有问题的。
                          */
                //一下代码为修改placeholder字体的颜色和大小
                UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
                //2. 设置圆角和边框颜色
                if(searchField) {
                        [searchField setBackgroundColor:[UIColor clearColor]];
                    //        searchField.layer.borderColor = [UIColor colorWithRed:49/255.0f green:193/255.0f blue:123/255.0f alpha:1].CGColor;
                    //        searchField.layer.borderWidth = 1;
                    //        searchField.layer.cornerRadius = 23.0f;
                    //        searchField.layer.masksToBounds = YES;
                            // 根据@"_placeholderLabel.textColor" 找到placeholder的字体颜色
                    
                        [searchField setValue:[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
                    }
                    // 输入文本颜色
                searchField.textColor= [UIColor whiteColor];
                searchField.font= [UIFont systemFontOfSize:15];
                    // 默认文本大小
                [searchField setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
                    //只有编辑时出现出现那个叉叉
                searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
                [self addSubview:self.searchBar];
                _searchBar = searchBar;
            }
        return self;
}
@end
