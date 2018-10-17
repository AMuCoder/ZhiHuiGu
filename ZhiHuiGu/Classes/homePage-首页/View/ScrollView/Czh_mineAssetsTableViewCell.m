//  文件名: Czh_mineAssetsTableViewCell.m
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：高度：55

#import "Czh_mineAssetsTableViewCell.h"

@implementation Czh_mineAssetsTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"assetsCell";
    Czh_mineAssetsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[Czh_mineAssetsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
//cell自定义用的是-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:_iconImageView];
        
        _currencyLabel = [[UILabel alloc] init];
        _currencyLabel.text = @"WEC";
        _currencyLabel.textColor = [UIColor blackColor];
        _currencyLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_currencyLabel];
        
        _hiddenTopLabel = [[UILabel alloc] init];
        _hiddenTopLabel.text = @"* * * *";
        _hiddenTopLabel.textAlignment = NSTextAlignmentRight;
        _hiddenTopLabel.textColor = [UIColor blackColor];
        [self addSubview:_hiddenTopLabel];
        
        _hiddenDownLabel = [[UILabel alloc] init];
        _hiddenDownLabel.text = @"* * * *";
        _hiddenDownLabel.textAlignment = NSTextAlignmentRight;
        _hiddenDownLabel.textColor = [UIColor brownColor];
        [self addSubview:_hiddenDownLabel];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    _iconImageView.frame = CGRectMake(10, 10, 35, 35);
    _currencyLabel.frame = CGRectMake(55, 10, 100, 35);
    _hiddenTopLabel.frame = CGRectMake(self.frame.size.width/2, 5, self.frame.size.width/2-10, 20);
    _hiddenDownLabel.frame = CGRectMake(self.frame.size.width/2, 30, self.frame.size.width/2-10, 20);
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
