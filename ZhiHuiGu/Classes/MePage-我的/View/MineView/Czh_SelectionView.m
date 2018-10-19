//  文件名: Czh_SelectionView.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_SelectionView.h"
#import "Czh_TypeBtn.h"

@implementation Czh_SelectionView
//男女按钮选择
-(instancetype)initWithFrame:(CGRect)frame leftlabelText:(NSString *)lefttext{
    self = [super initWithFrame:frame];//50
    if (self) {
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, self.frame.size.height)];
        
        UILabel *leftlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 82, 50)];
        leftlabel.textAlignment = NSTextAlignmentLeft;
        leftlabel.text = lefttext;
        leftlabel.font = [UIFont systemFontOfSize:15];
        [leftView addSubview:leftlabel];
        [self addSubview:leftView];
        
        self.womanBtn = [[Czh_TypeBtn alloc] initWithFrame:CGRectMake(self.CZH_width-2*self.CZH_height-10, 0, 2*self.CZH_height, self.CZH_height) leftImage:@"tabBar_friendTrends_icon"];
        
        self.manBtn = [[Czh_TypeBtn alloc] initWithFrame:CGRectMake(self.CZH_width- 4*self.CZH_height-10, 0, 2*self.CZH_height, self.CZH_height) leftImage:@"tabBar_friendTrends_icon"];
        self.manBtn.backgroundColor = CZHRGBColor(244, 244, 244);
        self.womanBtn.backgroundColor = CZHRGBColor(244, 244, 244);
        [self addSubview:self.womanBtn];
        [self addSubview:self.manBtn];
    }
    return self;
}
@end
