//  文件名: Czh_UnderlineTextField.m
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：右边有转化率（暂时没添加）

#import "Czh_UnderlineTextField.h"

@implementation Czh_UnderlineTextField

- (instancetype)initWithFrame:(CGRect)frame PlaceHolder:(NSString *)placeHolder boolLeftView:(BOOL)flag1 LeftViewImage:(NSString *)leftViewImageName  boolRightView:(BOOL)flag2 RightViewImage:(NSString *)rightViewImageName{
    if (self = [super initWithFrame:frame]) {
        self.placeholder = placeHolder;
        self.backgroundColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentLeft;
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        self.clearButtonMode = UITextFieldViewModeAlways;
        //设置字体颜色
        self.textColor = [UIColor blackColor];
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.font = [UIFont systemFontOfSize:16];
        
        if (flag1) {
            UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            leftView.backgroundColor = [UIColor lightGrayColor];
            leftView.contentMode = UIViewContentModeCenter;
            leftView.image = [UIImage imageNamed:leftViewImageName];
            self.leftView = leftView;
            self.leftViewMode = UITextFieldViewModeAlways;
        }else if(flag2){
            UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
            rightView.backgroundColor = [UIColor lightGrayColor];
            rightView.contentMode = UIViewContentModeCenter;
            rightView.image = [UIImage imageNamed:rightViewImageName];
            self.rightView = rightView;
            self.rightViewMode = UITextFieldViewModeAlways;
        }
    }
    return self;
}

@end
