//  文件名: Czh_mineAssetsTableViewCell.m
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：高度：55

#import "Czh_mineAssetsTableViewCell.h"

@implementation Czh_mineAssetsTableViewCell
//cell自定义用的是-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor lightGrayColor];
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 35, 35)];
        _iconImageView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_iconImageView];
        
        _currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, 100, 35)];
        _currencyLabel.text = @"WEC";
        _currencyLabel.textColor = [UIColor blackColor];
        _currencyLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_currencyLabel];
        
        _hiddenTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 5, self.frame.size.width -165, 20)];
        _hiddenTopLabel.text = @"* * * *";
        _hiddenTopLabel.textAlignment = NSTextAlignmentRight;
        _hiddenTopLabel.textColor = [UIColor blackColor];
        [self addSubview:_hiddenTopLabel];
        
        _hiddenDownLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 30, self.frame.size.width -165, 20)];
        _hiddenDownLabel.text = @"* * * *";
        _hiddenDownLabel.textAlignment = NSTextAlignmentRight;
        _hiddenDownLabel.textColor = [UIColor brownColor];
        [self addSubview:_hiddenDownLabel];
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
