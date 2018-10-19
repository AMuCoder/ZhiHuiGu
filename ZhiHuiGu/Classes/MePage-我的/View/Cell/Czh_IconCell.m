//  文件名: Czh_IconCell.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：高度：100

#import "Czh_IconCell.h"

@implementation Czh_IconCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Czh_IconCell";
    // 1.缓存中取
    Czh_IconCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.创建
    if (cell == nil) {
        cell = [[Czh_IconCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.text = @"头像";
        _leftLabel.textColor = [UIColor blackColor];
        _leftLabel.font = [UIFont systemFontOfSize:14];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_leftLabel];
        
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = CZHRGBColor(244, 244, 244);
        [self.contentView addSubview:_iconView];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.leftLabel.frame = CGRectMake(15, 20, self.CZH_width/4, self.CZH_height-40);
    self.iconView.frame = CGRectMake(self.CZH_width-90, 10, 80, 80);
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
