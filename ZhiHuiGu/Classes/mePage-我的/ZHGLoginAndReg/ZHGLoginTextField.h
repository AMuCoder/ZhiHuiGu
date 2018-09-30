//
//  ZHGLoginTextField.h
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/27.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHGLoginTextField : UITextField
@property(nonatomic,strong) UIButton *rBtn;

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder boolLeftView:(BOOL)flag rightTitle:(NSString *)title;
@end
