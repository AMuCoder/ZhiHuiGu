//  文件名: CreateWalletPdView.h
//  创建者: CYJ 时间: 2018/10/5.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface CreateWalletPdView : UIView
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) ZHGCWTextField *textField;
- (instancetype)initWithFrame:(CGRect)frame labelText:(NSString *)text  placeHolder:(NSString *)placeHolder;
@end
