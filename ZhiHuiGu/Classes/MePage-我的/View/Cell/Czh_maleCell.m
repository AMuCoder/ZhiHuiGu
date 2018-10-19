//  文件名: Czh_maleCell.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_maleCell.h"
#import "Czh_ZYbtn.h"


@implementation Czh_maleCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Czh_maleCell";
    // 1.缓存中取
    Czh_maleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.创建
    if (cell == nil) {
        cell = [[Czh_maleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.font = [UIFont systemFontOfSize:14];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_leftLabel];
        
        _womanBtn = [[Czh_ZYbtn alloc] init];
        _womanBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_womanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_womanBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [_womanBtn setTitle:@"女" forState:UIControlStateNormal];
        [_womanBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_womanBtn];
        
        _manBtn = [[Czh_ZYbtn alloc] init];
        [_manBtn setTitle:@"男" forState:UIControlStateNormal];
        [_manBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_manBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [_manBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _manBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_manBtn];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = [self.leftLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.leftLabel.font,NSFontAttributeName,nil]];
    // label的内容的宽度
    CGFloat labelContentWidth = size.width;
    self.leftLabel.frame = CGRectMake(15, 20, labelContentWidth, self.CZH_height-40);
    self.manBtn.frame = CGRectMake(self.CZH_width-160, 0, 80, 50);
    self.womanBtn.frame = CGRectMake(self.CZH_width-80, 0, 80, 50);
}
-(void)BtnClick:(UIButton*)sender{
    [self.delegate didClickButton:sender];
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
