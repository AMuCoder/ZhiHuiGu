//  文件名: Czh_RechargeField.m
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：更改登录密码等fIELD,高度：40

#import "Czh_RechargeField.h"

@implementation Czh_RechargeField

- (instancetype)initWithFrame:(CGRect)frame LeftLabel:(NSString *)leftLabel Placeholder:(NSString *)placetext
{
    self = [super initWithFrame:frame];
    if (self) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.text = leftLabel;
        _leftLabel.font = [UIFont systemFontOfSize:15.0f];
        
        self.placeholder = placetext;
        self.backgroundColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentLeft;
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        self.clearButtonMode = UITextFieldViewModeAlways;
        //设置字体颜色
        self.textColor = [UIColor blackColor];
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:15];
        
        self.leftView = _leftLabel;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder boolRView:(BOOL)flag  LeftViewTitle:(NSString *)leftViewtitle rightTitle:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        self.placeholder = placeHolder;
        self.borderStyle = UITextBorderStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentLeft;
        //键盘外观
        self.keyboardAppearance=UIKeyboardAppearanceDark;
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        self.clearButtonMode = UITextFieldViewModeAlways;
        //设置字体颜色
        self.textColor = [UIColor blackColor];
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:15];
        //CGRectMake(0, 0,15, 0)离上下左右的距离
        
        _label = [[UILabel alloc] init];
        _label.contentMode = UIViewContentModeCenter;
        _label.text = leftViewtitle;
        _label.font = [UIFont systemFontOfSize:15];
        // 根据字体得到label的内容的尺寸
        CGSize labelsize = [_label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:_label.font,NSFontAttributeName,nil]];
        // label的内容的宽度
        CGFloat label_ContentWidth = labelsize.width;
        _sizeLenght = labelsize.width + 10 ;
        _label.frame = CGRectMake(0, 0, label_ContentWidth, self.CZH_height);
        
        self.leftView = _label;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        if (flag) {
            _rtBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/2-self.frame.size.width/5, self.frame.size.height)];
            [_rtBtn setTitle:title forState:UIControlStateNormal];
            [_rtBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            _rtBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0f];
            _rtBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
            self.rightView = _rtBtn;
            self.rightViewMode = UITextFieldViewModeAlways;
        }
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    // 根据字体得到label的内容的尺寸
    CGSize size = [self.leftLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.leftLabel.font,NSFontAttributeName,nil]];
    // label的内容的宽度
    CGFloat labelContentWidth = size.width;
    // 如果label的内容的宽度度超过150，则label的宽度就设置为150，即label的最大宽度为150
    if (labelContentWidth >= 150.0) {
        labelContentWidth = 150.0;
    }
    self.leftLabel.frame = CGRectMake(0, 0, labelContentWidth, self.CZH_height);
}
@end
