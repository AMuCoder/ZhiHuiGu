//  文件名: Czh_TypeBtn.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_TypeBtn.h"

@implementation Czh_TypeBtn
/*************--上图下文字自定义按钮 --*************/
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.topImageView = [[UIImageView alloc] init];
        self.topImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.topImageView];
        
        self.bottomLable = [[UILabel alloc] init];
        self.bottomLable.textColor =[UIColor lightGrayColor];
        self.bottomLable.textAlignment = NSTextAlignmentCenter;  //文字居中
        self.bottomLable.adjustsFontSizeToFitWidth = YES;   //文字大小自适应
        [self addSubview:self.bottomLable];
        
        //给按钮添加边框并设置边框的颜色
        [self.layer setBorderWidth:1];
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0.9,0.9,0.9,1}); //RGB and alpha
        [self.layer setBorderColor:color];
    }
    return self;
}
+(UILabel *)createLabelTextColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.adjustsFontSizeToFitWidth = YES;
    return label;
}
/*************--左图右文字 --*************/
-(instancetype)initWithFrame:(CGRect)frame leftImage:(NSString *)image{
    self = [super initWithFrame:frame];
    if(self) {
        self.leftImageView = [[UIImageView alloc] init];
        self.leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.leftImageView.backgroundColor = [UIColor redColor];
        self.leftImageView.image = [UIImage imageNamed:image];
        [self addSubview:self.leftImageView];
        
        self.rightLable = [[UILabel alloc] init];
        self.rightLable.textColor =[UIColor lightGrayColor];
        self.rightLable.textAlignment = NSTextAlignmentLeft;
        self.rightLable.adjustsFontSizeToFitWidth = YES;   //文字大小自适应
        [self addSubview:self.rightLable];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.topImageView.frame = CGRectMake(0, 0, self.CZH_width, self.CZH_width);
    self.bottomLable.frame = CGRectMake(0, self.CZH_width + 10, self.CZH_width, 20);
    //在这里面可以设置按钮的图片和文字的尺寸
    //50
    self.leftImageView.frame = CGRectMake(0, 10, 30, 30);
    self.rightLable.frame = CGRectMake(40, 0, 40, 50);
}

@end
