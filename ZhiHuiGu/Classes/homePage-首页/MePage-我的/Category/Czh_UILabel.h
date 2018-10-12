//  文件名: Czh_UILabel.h
//  创建者: CYJ 时间: 2018/10/7.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_UILabel : UILabel
- (instancetype)initWithFrame:(CGRect)frame
               labelTextColor:(UIColor *)labelTextColor
                    sizeFloat:(CGFloat)sizeFloat
                textAlignment:(NSTextAlignment)textAlignment;
@end
