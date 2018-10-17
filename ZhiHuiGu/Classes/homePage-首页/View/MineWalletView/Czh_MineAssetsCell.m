//  文件名: Czh_MineAssetsCell.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：高度：65

#import "Czh_MineAssetsCell.h"

@implementation Czh_MineAssetsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Cell_MinaAsset";
    Czh_MineAssetsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[Czh_MineAssetsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        _iconImageViewM = [[UIImageView alloc] init];
        _iconImageViewM.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:_iconImageViewM];
        
        _currencyLabelM = [[UILabel alloc] init];
        _currencyLabelM.text = @"WEC";
        _currencyLabelM.textColor = [UIColor blackColor];
        _currencyLabelM.font = [UIFont systemFontOfSize:14];
        _currencyLabelM.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_currencyLabelM];
        
        _currencyM = [[UILabel alloc] init];
        _currencyM.text = @"(币种全程)";
        _currencyM.font = [UIFont systemFontOfSize:14];
        _currencyM.textAlignment = NSTextAlignmentLeft;
        _currencyM.textColor = [UIColor blackColor];
        [self addSubview:_currencyM];
        
        _switchBtn = [[UISwitch alloc] init];
        _switchBtn.backgroundColor = [UIColor lightTextColor];
        [_switchBtn setOn:YES animated:YES];
        //cell.accessoryView= switchBtn;
        // 开关开启时的颜色（默认绿色）
        _switchBtn.onTintColor= [UIColor greenColor];
        // 开关圆圈的颜色（默认白色）
        _switchBtn.thumbTintColor= CZHRGBColor(244, 244, 244);
        // 开关关闭时的边框颜色（默认白色）
        _switchBtn.tintColor= [UIColor blackColor];
        [self addSubview:_switchBtn];
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    // 根据字体得到label的内容的尺寸
    CGSize size = [self.currencyLabelM.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.currencyLabelM.font,NSFontAttributeName,nil]];
    // label的内容的宽度
    CGFloat labelContentWidth = size.width;
    // 如果label的内容的宽度度超过150，则label的宽度就设置为150，即label的最大宽度为150
    if (labelContentWidth >= 150.0) {
        labelContentWidth = 150.0;
    }
    _iconImageViewM.frame = CGRectMake(10, 10, 35, 35);
    _currencyLabelM.frame = CGRectMake(55, 10, labelContentWidth, 20);
    _currencyM.frame = CGRectMake(labelContentWidth + 55, 10, self.CZH_width-labelContentWidth-55, 20);
    _switchBtn.frame = CGRectMake(self.CZH_width-60, 15, 100, 30);
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
