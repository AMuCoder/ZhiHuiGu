//
//  ZHGButton.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/25.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGButton.h"

@interface ZHGButton()

/**图片*/
@property (nonatomic,strong) UIImageView *topImageView;
/**文字*/
@property (nonatomic,strong) UILabel *bottomLable;

@end

@implementation ZHGButton

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.topImageView = [[UIImageView alloc] init];
        self.topImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.topImageView.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.topImageView];
        
        self.bottomLable = [[UILabel alloc] init];
        self.bottomLable.textColor =[UIColor lightGrayColor];
        self.bottomLable.textAlignment = NSTextAlignmentCenter;  //文字居中
        self.bottomLable.adjustsFontSizeToFitWidth = YES;   //文字大小自适应
        self.bottomLable.backgroundColor = [UIColor greenColor];
        [self addSubview:self.bottomLable];
        
        //给按钮添加边框并设置边框的颜色
        [self.layer setBorderWidth:1];
        CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0.9,0.9,0.9,1}); //RGB and alpha
        [self.layer setBorderColor:color];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnW = self.frame.size.width;
    CGFloat btnH = self.frame.size.height;
    self.topImageView.frame = CGRectMake(0, 0, btnW, btnW);
    self.bottomLable.frame = CGRectMake(0, btnW, btnW, btnH - btnW);
    //在这里面可以设置按钮的图片和文字的尺寸
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
