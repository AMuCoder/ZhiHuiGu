//  文件名: Czh_maleCell.h
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>
@class Czh_ZYbtn;

@protocol Czh_maleCellDelegate <NSObject>

//- (void)clickTest:(NSString *)tag;
-(void)didClickButton:(UIButton *)sender;

@end

@interface Czh_maleCell : UITableViewCell

@property(nonatomic,strong) UILabel *leftLabel;
/**女士按钮*/
@property(nonatomic ,strong) Czh_ZYbtn *womanBtn;
/**男士按钮*/
@property(nonatomic ,strong) Czh_ZYbtn *manBtn;

@property(weak, nonatomic) id<Czh_maleCellDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
