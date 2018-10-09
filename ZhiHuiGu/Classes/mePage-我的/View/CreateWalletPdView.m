//  文件名: CreateWalletPdView.m
//  创建者: CYJ 时间: 2018/10/5.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import "CreateWalletPdView.h"

@implementation CreateWalletPdView

- (instancetype)initWithFrame:(CGRect)frame labelText:(NSString *)text  placeHolder:(NSString *)placeHolder
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        label.text = text;
//        label.backgroundColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:17.0f];
        [self addSubview:label];
        _label = label;
        
        
        
        Czh_CWTextField *textField = [[Czh_CWTextField alloc]init];
        textField.backgroundColor = [UIColor clearColor];
        textField.secureTextEntry = YES;
        textField.textAlignment = NSTextAlignmentLeft;
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        textField.clearButtonMode = UITextFieldViewModeAlways;
        //设置字体颜色
        textField.textColor = [UIColor blackColor];
        textField.placeholder = placeHolder;
        [self addSubview:textField];
        _textField = textField;
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    // 根据字体得到label的内容的尺寸
    CGSize size = [self.label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.label.font,NSFontAttributeName,nil]];
    // label的内容的宽度
    CGFloat labelContentWidth = size.width;
    // 如果label的内容的宽度度超过150，则label的宽度就设置为150，即label的最大宽度为150
    if (labelContentWidth >= 150.0) {
        labelContentWidth = 150.0;
    }
    self.label.frame = CGRectMake(10, 0, labelContentWidth, self.CZH_height);
    self.textField.frame = CGRectMake(CGRectGetMaxX(self.label.frame), 0, self.CZH_width - labelContentWidth - 20, self.CZH_height);
}

@end
