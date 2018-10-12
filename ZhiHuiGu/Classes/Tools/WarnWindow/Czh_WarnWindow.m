//  文件名: Czh_WarnWindow.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_WarnWindow.h"

@implementation Czh_WarnWindow
+(void)HUD:(UIView *)view andWarnText:(NSString *)str andXoffset:(CGFloat )xOffset andYoffset:(CGFloat)yOffset {
    
    MBProgressHUD *HUD = HUD = [[MBProgressHUD alloc]initWithView:view];
    [view addSubview:HUD];
    HUD.detailsLabelText = str;
    HUD.mode = MBProgressHUDModeCustomView;
    //修改提示框偏移位置
    HUD.yOffset = yOffset;
    HUD.xOffset = xOffset;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1.5);
    } completionBlock:^{
        
        [HUD removeFromSuperview];
        //    HUD = Nil;
    }];
}

+(void)WarnText:(NSString *)str{
    MBProgressHUD *HUD = HUD = [[MBProgressHUD alloc]initWithView:[UIApplication sharedApplication].keyWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:HUD];
    HUD.detailsLabelText = str;
    HUD.mode = MBProgressHUDModeCustomView;
    //修改提示框偏移位置
    HUD.yOffset = Main_Screen_Width/2;
    HUD.xOffset = 0;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1.5);
    } completionBlock:^{
        
        [HUD removeFromSuperview];
        //    HUD = Nil;
    }];
}

@end
