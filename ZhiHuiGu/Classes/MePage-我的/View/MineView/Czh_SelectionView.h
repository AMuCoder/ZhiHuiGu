//  文件名: Czh_SelectionView.h
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>
@class Czh_TypeBtn;
@interface Czh_SelectionView : UIView

/**女士按钮*/
@property(nonatomic ,strong) Czh_TypeBtn *womanBtn;
/**男士按钮*/
@property(nonatomic ,strong) Czh_TypeBtn *manBtn;


-(instancetype)initWithFrame:(CGRect)frame leftlabelText:(NSString *)lefttext;
@end
