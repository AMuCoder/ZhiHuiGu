//  文件名: Czh_AssetChangesView.m
//  创建者: CYJ 时间: 2018/10/13.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_AssetChangesView.h"
#import "Czh_HomeViewController.h"

@implementation Czh_AssetChangesView
static int countInt=0;
static NSString *notice_index;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}
- (void)p_setupViews
{
    self.backgroundColor = [UIColor whiteColor];
    self.assetChangesView = [[AssetChangesView alloc] initWithFrame:CGRectMake(0, 0, self.CZH_width, 90)];
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.CZH_width, 90)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(topNewsInfoClicked:)];
    _assetChangesView.userInteractionEnabled = YES;
    [_assetChangesView addGestureRecognizer:tap];
    [self addSubview:self.assetChangesView];
    [self addSubview:self.btn];
}
//点击上下滚动视图
-(void)topNewsInfoClicked:(id)sender{
    NSLog(@"点击上下滚动视图%d", countInt);
}
- (void)setViewWithUpDownArray:(NSArray *)upDownArray
{
    self.updownDataArray = upDownArray;
    [self setUpdownViewData];
}

#pragma mark ==== 上下滚动视图

- (void)setUpdownViewData
{
    notice_index=[self.updownDataArray objectAtIndex:0];
    [self.assetChangesView setViewWithOneLabelTopText:@"7月" OneLabelMidText:@"7月0" OneLabelBottomText:@"7月0" TwoLabelTopText:@"8月" TwoLabelMidText:@"8月0" TwoLabelBottomText:@"8月0" ThreeLabelTopText:@"9月" ThreeLabelMidText:@"9月" ThreeLabelBottomText:@"9月"];
    [UIView animateWithDuration:0.7 delay:0 options:0 animations:^(){
        self.assetChangesView.alpha = 0.2;
        [self.assetChangesView exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
        self.assetChangesView.alpha = 1;
    } completion:^(BOOL finished){
        //设置定时器
        [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
    }];
}
-(void)displayNews{
    countInt++;
    //    long num = [rssArray count] >= 3 ? 3:[rssArray count];
    if (countInt >= [self.updownDataArray count])
        countInt=0;
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
    
    notice_index=[self.updownDataArray objectAtIndex:countInt];
    [self.assetChangesView.layer addAnimation:animation forKey:@"animationID"];
    [self.assetChangesView setViewWithOneLabelTopText:@"7-月" OneLabelMidText:@"7-月0" OneLabelBottomText:@"7-月0" TwoLabelTopText:@"8-月" TwoLabelMidText:@"8-月0" TwoLabelBottomText:@"8-月0" ThreeLabelTopText:@"9-月" ThreeLabelMidText:@"9-月" ThreeLabelBottomText:@"9-月"];
}
@end
