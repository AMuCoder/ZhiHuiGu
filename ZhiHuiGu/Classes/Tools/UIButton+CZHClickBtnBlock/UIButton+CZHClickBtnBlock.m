//
//  UIButton+CZHClickBtnBlock.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/28.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "UIButton+CZHClickBtnBlock.h"
//别忘记引用
#import <objc/runtime.h>

static void *buttonClickKey = "buttonClickKey";

@implementation UIButton (CZHClickBtnBlock)

- (void)setClickBlock:(CZHClickActionBlock)block andEvent:(UIControlEvents)event {
    
    // 设置关联对象
    objc_setAssociatedObject(self, buttonClickKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(buttonClick:) forControlEvents:event];
}

- (void)buttonClick:(UIButton *)button {
    
    // 获取关联对象
    CZHClickActionBlock block = objc_getAssociatedObject(self, buttonClickKey);
    
    if (block) {
        block(button);
    }
}

@end
