//  文件名: Czh_NameCell.h
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>


@interface Czh_NameCell : UITableViewCell

@property(nonatomic,strong) UITextField *textField;
@property(nonatomic,strong) UILabel *leftLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
