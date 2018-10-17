//  文件名: assetChangesView.m
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "AssetChangesView.h"

@implementation AssetChangesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
#pragma mark -- one
        _oneLabelTop = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.CZH_width/3, 20)];
        _oneLabelTop.text = @"BTC/WEC";
        _oneLabelTop.textColor = [UIColor blackColor];
        _oneLabelTop.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_oneLabelTop];
        
        _oneLabelMid = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.CZH_width/3, 20)];
        _oneLabelMid.text = @"100.00";
        _oneLabelMid.textColor = [UIColor greenColor];
        _oneLabelMid.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_oneLabelMid];
        
        _oneLabelBottom = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, self.CZH_width/3, 20)];
        _oneLabelBottom.text = @"+1%";
        _oneLabelBottom.textColor = [UIColor greenColor];
        _oneLabelBottom.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_oneLabelBottom];
#pragma mark -- two
        _twoLabelTop = [[UILabel alloc] initWithFrame:CGRectMake(self.CZH_width/3, 0, self.CZH_width/3, 20)];
        _twoLabelTop.text = @"MOB/WEC";
        _twoLabelTop.textColor = [UIColor blackColor];
        _twoLabelTop.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_twoLabelTop];
        _twoLabelMid = [[UILabel alloc] initWithFrame:CGRectMake(self.CZH_width/3, 30, self.CZH_width/3, 20)];
        _twoLabelMid.text = @"100.00";
        _twoLabelMid.textColor = [UIColor greenColor];
        _twoLabelMid.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_twoLabelMid];
        _twoLabelBottom = [[UILabel alloc] initWithFrame:CGRectMake(self.CZH_width/3, 60, self.CZH_width/3, 20)];
        _twoLabelBottom.text = @"-1%";
        _twoLabelBottom.textColor = [UIColor redColor];
        _twoLabelBottom.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_twoLabelBottom];
#pragma mark -- three
        _threeLabelTop = [[UILabel alloc] initWithFrame:CGRectMake(2*self.CZH_width/3, 0, self.CZH_width/3, 20)];
        _threeLabelTop.text = @"ETH/WEC";
        _threeLabelTop.textColor = [UIColor blackColor];
        _threeLabelTop.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_threeLabelTop];
        
        _threeLabelMid = [[UILabel alloc] initWithFrame:CGRectMake(2*self.CZH_width/3, 30, self.CZH_width/3, 20)];
        _threeLabelMid.text = @"100.00";
        _threeLabelMid.textColor = [UIColor greenColor];
        _threeLabelMid.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_threeLabelMid];
        _threeLabelBottom = [[UILabel alloc] initWithFrame:CGRectMake(2*self.CZH_width/3, 60, self.CZH_width/3, 20)];
        _threeLabelBottom.text = @"+1%";
        _threeLabelBottom.textColor = [UIColor greenColor];
        _threeLabelBottom.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_threeLabelBottom];
    }
    return self;
}
//更新数据
- (void)setViewWithOneLabelTopText:(NSString *)oneLabeltopText OneLabelMidText:(NSString *)oneLabelMidText OneLabelBottomText:(NSString *)oneLabelBottomText
                   TwoLabelTopText:(NSString *)twoLabelTopText TwoLabelMidText:(NSString *)twoLabelMidText TwoLabelBottomText:(NSString *)twoLabelBottomText
                 ThreeLabelTopText:(NSString *)threeLabelTopText ThreeLabelMidText:(NSString *)threeLabelMidText ThreeLabelBottomText:(NSString *)threeLabelBottomText
{
    self.oneLabelTop.text = oneLabeltopText;
    self.oneLabelMid.text = oneLabelMidText;
    self.oneLabelBottom.text = oneLabelBottomText;
    
    self.twoLabelTop.text = twoLabelTopText;
    self.twoLabelMid.text = twoLabelMidText;
    self.twoLabelBottom.text = twoLabelBottomText;
    
    self.threeLabelTop.text = threeLabelTopText;
    self.threeLabelMid.text = threeLabelMidText;
    self.threeLabelBottom.text = threeLabelBottomText;
}
@end
