//
//  UIButton+CZHClickBtnBlock.h
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/28.
//  Copyright © 2018年 阿木. All rights reserved.
/*
 *
 以给定的键设置关联对象的值objc_setAssociatedObject(id object, void *key, id value, objc_AssociationPolicy policy)
 根据键获取值objc_getAssociatedObject(id object, void *key)
 移除全部关联对象`objc_removeAssociatedObject(id object)
*
*/

#import <UIKit/UIKit.h>
//没有返回值，有参数，参数为传入一个按钮，CZHClickActionBlock是一个block变量，可以存储一段代码（参数为传入一个按钮）
/*
 block和typedef结合使用
 利用typedef给block起别名，和指向函数的指针相同，block变量名就是别名
 typedef void(^CZHClickActionBlock)(UIButton *button);
 */
typedef void(^CZHClickActionBlock)(UIButton *button);

@interface UIButton (CZHClickBtnBlock)

- (void)setClickBlock:(CZHClickActionBlock)block andEvent:(UIControlEvents)event;

@end
