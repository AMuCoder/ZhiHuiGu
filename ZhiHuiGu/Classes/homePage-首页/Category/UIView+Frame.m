//
//  UIView+Frame.m
//  CZHTestAli
//
//  Created by 阿木 on 2018/8/14.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - CZH_height
-(void)setCZH_height:(CGFloat)CZH_height {
    CGRect frame = self.frame;
    frame.size.height = CZH_height;
    self.frame = frame;
}

-(CGFloat)CZH_height {
    return self.frame.size.height;
}

#pragma mark - CZH_width
-(void)setCZH_width:(CGFloat)CZH_width {
    CGRect frame = self.frame;
    frame.size.width = CZH_width;
    self.frame = frame;
}

-(CGFloat)CZH_width {
    return  self.frame.size.width;
}

#pragma mark - CZH_x
-(void)setCZH_x:(CGFloat)CZH_x {
    CGRect frame = self.frame;
    frame.origin.x = CZH_x;
    self.frame = frame;
}

-(CGFloat)CZH_x {
    return self.frame.origin.x;
}

#pragma mark - CZH_y
-(void)setCZH_y:(CGFloat)CZH_y {
    CGRect frame = self.frame;
    frame.origin.y = CZH_y;
    self.frame = frame;
}

-(CGFloat)CZH_y {
    return self.frame.origin.y;
}

@end
