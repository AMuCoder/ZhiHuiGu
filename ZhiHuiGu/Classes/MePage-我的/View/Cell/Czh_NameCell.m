//  文件名: Czh_NameCell.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：50

#import "Czh_NameCell.h"

@implementation Czh_NameCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Czh_NameCell";
    // 1.缓存中取
    Czh_NameCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 2.创建
    if (cell == nil) {
        cell = [[Czh_NameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
        
        _textField = [[UITextField alloc] init];
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_textField];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = [self.leftLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.leftLabel.font,NSFontAttributeName,nil]];
    // label的内容的宽度
    CGFloat labelContentWidth = size.width;
    self.leftLabel.frame = CGRectMake(15, 20, labelContentWidth, self.CZH_height-40);
    self.textField.frame = CGRectMake(labelContentWidth+15, 10, self.CZH_width-labelContentWidth-30, 30);
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
