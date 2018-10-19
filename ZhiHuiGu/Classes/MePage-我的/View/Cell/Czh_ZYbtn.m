//  文件名: Czh_ZYbtn.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_ZYbtn.h"

@implementation Czh_ZYbtn

/*************--左图右文字 --*************/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self) {
        self.leftImageView = [[UIImageView alloc] init];
        self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.leftImageView.backgroundColor = [UIColor redColor];
        [self addSubview:self.leftImageView];
        
        self.rightLable = [[UILabel alloc] init];
        self.rightLable.textColor =[UIColor lightGrayColor];
        self.rightLable.textAlignment = NSTextAlignmentRight;
        self.rightLable.adjustsFontSizeToFitWidth = YES;   //文字大小自适应
        [self addSubview:self.rightLable];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    //50
    self.leftImageView.frame = CGRectMake(0, 10, 30, 30);
    self.rightLable.frame = CGRectMake(40, 0, 40, 50);
}


@end
