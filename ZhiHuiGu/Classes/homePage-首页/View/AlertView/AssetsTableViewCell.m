//  文件名: AssetsTableViewCell.m
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "AssetsTableViewCell.h"

@implementation AssetsTableViewCell


//cell自定义用的是-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _iconImageView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_iconImageView];
        
        _currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, self.CZH_width - 70, 20)];
        _currencyLabel.text = @"WEC";
        _currencyLabel.textColor = [UIColor blackColor];
        _currencyLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_currencyLabel];
        
        _balancesLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 40, self.CZH_width - 70, 20)];
        _balancesLabel.text = @"余额：0   BAT";
        _balancesLabel.textAlignment = NSTextAlignmentLeft;
        _balancesLabel.textColor = [UIColor blackColor];
        [self addSubview:_balancesLabel];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
