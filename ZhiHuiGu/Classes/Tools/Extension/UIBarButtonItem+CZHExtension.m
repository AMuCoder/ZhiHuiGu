//
//  UIBarButtonItem+CZHExtension.m
//  沁汉堂
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 CHANT. All rights reserved.
//

#import "UIBarButtonItem+CZHExtension.h"

@implementation UIBarButtonItem (CZHExtension)

+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    // 设置导航栏左边的按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //默认图片大小
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
