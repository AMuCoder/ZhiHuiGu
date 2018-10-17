//
//  Czh_LoginTextField.h
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/27.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Czh_LoginTextField : UITextField

@property(nonatomic,strong) UIButton *rBtn;

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder boolLeftView:(BOOL)flag rightTitle:(NSString *)title;
- (instancetype)initWithFrame:(CGRect)frame PlaceHolder:(NSString *)placeHolder LeftViewImage:(NSString *)leftViewImageName;
@end
