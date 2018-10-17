//  文件名: assetChangesView.h
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface AssetChangesView : UIView
@property(nonatomic,strong) UILabel *oneLabelTop;
@property(nonatomic,strong) UILabel *oneLabelMid;
@property(nonatomic,strong) UILabel *oneLabelBottom;
//
@property(nonatomic,strong) UILabel *twoLabelTop;
@property(nonatomic,strong) UILabel *twoLabelMid;
@property(nonatomic,strong) UILabel *twoLabelBottom;
//
@property(nonatomic,strong) UILabel *threeLabelTop;
@property(nonatomic,strong) UILabel *threeLabelMid;
@property(nonatomic,strong) UILabel *threeLabelBottom;


- (void)setViewWithOneLabelTopText:(NSString *)oneLabeltopText OneLabelMidText:(NSString *)oneLabelMidText OneLabelBottomText:(NSString *)oneLabelBottomText
                   TwoLabelTopText:(NSString *)twoLabelTopText TwoLabelMidText:(NSString *)twoLabelMidText TwoLabelBottomText:(NSString *)twoLabelBottomText
                 ThreeLabelTopText:(NSString *)threeLabelTopText ThreeLabelMidText:(NSString *)threeLabelMidText ThreeLabelBottomText:(NSString *)threeLabelBottomText;

@end
