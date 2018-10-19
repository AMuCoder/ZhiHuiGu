//
//  ZDAcountTypeBtn.h
//  ZhiDaDMOne
//
//  Created by CoderZHChun on 2017/5/2.
//  Copyright © 2017年 沁汉堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDAcountTypeBtn : UIButton
//单行文字，字体17
-(instancetype)initWithFrame:(CGRect)frame Title:(NSString *)text;
//单行，字体13，图片
-(instancetype)initWithFrame:(CGRect)frame BTNTitle:(NSString *)text;
//两行文字
-(instancetype)initWithFrame:(CGRect)frame DoubeTitle:(NSString *)text;
//上一步
-(instancetype)initWithFrame:(CGRect)frame LeftBtnTitle:(NSString *)text;
//下一步
-(instancetype)initWithFrame:(CGRect)frame RightBtnTitle:(NSString *)text;

@end
