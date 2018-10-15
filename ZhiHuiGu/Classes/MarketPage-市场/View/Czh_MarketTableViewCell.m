//  文件名: Czh_MarketTableViewCell.m
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：height:40

#import "Czh_MarketTableViewCell.h"

@implementation Czh_MarketTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Czh_MarketTableViewCell";
    // 1.缓存中取
    Czh_MarketTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.创建
    if (cell == nil) {
        cell = [[Czh_MarketTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


//cell自定义用的是-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _currencyLabel = [[UILabel alloc] init];
        _currencyLabel.text = @"BTC";
        _currencyLabel.font = [UIFont systemFontOfSize:13];
        _currencyLabel.textColor = [UIColor blackColor];
        _currencyLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_currencyLabel];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.text = @"0.5544";
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.textColor = [UIColor lightGrayColor];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_priceLabel];
        
        _totalAmountLabel = [[UILabel alloc] init];
        _totalAmountLabel.text = @"￥89321";
        _totalAmountLabel.font = [UIFont systemFontOfSize:13];
        _totalAmountLabel.textColor = [UIColor lightGrayColor];
        _totalAmountLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_totalAmountLabel];
        
        _riseFallLabel = [[UILabel alloc] init];
        _riseFallLabel.text = @"-0.00%";
        _riseFallLabel.font = [UIFont systemFontOfSize:13];
        _riseFallLabel.textColor = [UIColor greenColor];
        _riseFallLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_riseFallLabel];
        
        _tradingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tradingBtn setTitle:@"交易" forState:UIControlStateNormal];
        [_tradingBtn setBackgroundColor:[UIColor redColor]];
        [self.contentView addSubview:_tradingBtn];
    }
    return self;
}

//- (void)setShowModel:(MessageModel *)showModel{
//    _showModel = showModel;
//    //赋值
//    [_headImageView sd_setImageWithURL:[NSURL URLWithString:showModel.headImage]];
//    _nameLabel.text = showModel.name;
//}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.currencyLabel.frame = CGRectMake(0, 10, self.frame.size.width/5, 20);
    self.priceLabel.frame = CGRectMake(self.frame.size.width/5, 10, self.frame.size.width/5, 20);
    self.totalAmountLabel.frame = CGRectMake(2*self.frame.size.width/5, 10, self.frame.size.width/5, 20);
    self.riseFallLabel.frame = CGRectMake(3*self.frame.size.width/5, 10, self.frame.size.width/5, 20);
    self.tradingBtn.frame = CGRectMake(4*self.frame.size.width/5, 10, self.frame.size.width/5, 20);
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
