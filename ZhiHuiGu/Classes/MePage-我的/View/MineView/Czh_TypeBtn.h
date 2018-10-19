//  文件名: Czh_TypeBtn.h
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_TypeBtn : UIButton
/**上图下文字*/
@property (nonatomic,strong) UIImageView *topImageView;
@property (nonatomic,strong) UILabel *bottomLable;
/**左图右文字*/
@property (nonatomic,strong) UIImageView *leftImageView;
@property (nonatomic,strong) UILabel *rightLable;




-(instancetype)initWithFrame:(CGRect)frame leftImage:(NSString *)image;
@end
