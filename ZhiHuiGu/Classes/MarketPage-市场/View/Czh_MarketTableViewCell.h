//  文件名: Czh_MarketTableViewCell.h
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>
@class Czh_MarketModel;

@interface Czh_MarketTableViewCell : UITableViewCell
/**币种*/
@property(nonatomic,strong) UILabel *currencyLabel;
/**价格*/
@property(nonatomic,strong) UILabel *priceLabel;
/**总额*/
@property(nonatomic,strong) UILabel *totalAmountLabel;
/**涨跌幅*/
@property(nonatomic,strong) UILabel *riseFallLabel;
/**交易按钮*/
@property(nonatomic,strong) UIButton *tradingBtn;

/**数据模型*/
@property(nonatomic,strong) Czh_MarketModel *showModel;
 + (instancetype)cellWithTableView:(UITableView *)tableView;
@end
