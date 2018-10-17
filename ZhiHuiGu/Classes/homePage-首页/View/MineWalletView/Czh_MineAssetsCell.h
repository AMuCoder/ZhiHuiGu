//  文件名: Czh_MineAssetsCell.h
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_MineAssetsCell : UITableViewCell
@property(nonatomic,strong) UIImageView *iconImageViewM;//币种头像
@property(nonatomic,strong) UILabel *currencyLabelM;//币种简称
@property(nonatomic,strong) UILabel *currencyM;//币种全程
@property(nonatomic,strong) UILabel *addressM;//币种地址
@property(nonatomic,strong) UISwitch* switchBtn;//开关按钮
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
