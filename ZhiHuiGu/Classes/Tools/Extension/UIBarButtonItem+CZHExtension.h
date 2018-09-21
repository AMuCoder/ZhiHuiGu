//
//  UIBarButtonItem+CZHExtension.h
//  沁汉堂
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 CHANT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CZHExtension)
+(instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
