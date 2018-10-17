//  文件名: Czh_mineAssetsTableViewCell.h
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_mineAssetsTableViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView *iconImageView;
@property(nonatomic,strong) UILabel *currencyLabel;
@property(nonatomic,strong) UILabel *hiddenTopLabel;
@property(nonatomic,strong) UILabel *hiddenDownLabel;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
