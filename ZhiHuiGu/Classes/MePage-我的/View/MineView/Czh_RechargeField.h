//  文件名: Czh_RechargeField.h
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_RechargeField : UITextField
/**倒计时按钮*/
@property(nonatomic,strong) UIButton *rtBtn;
/**左边文字*/
@property(nonatomic,strong) UILabel *label;
/**左边文字*/
@property(nonatomic,strong) UILabel *leftLabel;

@property(nonatomic,assign) CGFloat sizeLenght;

- (instancetype)initWithFrame:(CGRect)frame LeftLabel:(NSString *)leftLabel Placeholder:(NSString *)placetext;

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder boolRView:(BOOL)flag  LeftViewTitle:(NSString *)leftViewtitle rightTitle:(NSString *)title;
@end
