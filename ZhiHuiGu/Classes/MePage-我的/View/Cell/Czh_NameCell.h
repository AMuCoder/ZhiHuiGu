//  文件名: Czh_NameCell.h
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@protocol Czh_NameCellDelegate <NSObject>

-(void)inputTextClic:(NSString *)text;

@end

@interface Czh_NameCell : UITableViewCell<UITextFieldDelegate>

@property(nonatomic,strong) UITextField *textField;
@property(nonatomic,strong) UILabel *leftLabel;
@property(nonatomic,copy) NSString *inputStr;

@property(nonatomic,weak) id<Czh_NameCellDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
