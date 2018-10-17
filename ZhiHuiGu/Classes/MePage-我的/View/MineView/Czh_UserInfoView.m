//  文件名: Czh_UserInfoView.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：高度：90

#import "Czh_UserInfoView.h"
@interface Czh_UserInfoView()


@end

@implementation Czh_UserInfoView

- (instancetype)initWithFrame:(CGRect)frame IconImage:(NSString *)iconImage userName:(NSString *)userNameStr Zongzichan:(NSString *)assetNumber ZichanStyle:(NSString *)currencyStyle WECNum:(NSString *)wecNumber MessageBtnImage:(NSString *)image MessageBtnHightImage:(NSString *)imageH  NextBtnImage:(NSString *)nextimage NextBtnHightImage:(NSString *)nextimageH
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:52.0 / 255.0 green:104.0 / 255.0 blue:206.0 / 255.0 alpha:1];
        
        _iconImage = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconImage.layer.cornerRadius = 20;
        _iconImage.backgroundColor = [UIColor orangeColor];
        [_iconImage setImage:[UIImage imageNamed:iconImage] forState:UIControlStateNormal];
        [_iconImage setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_iconImage setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [self addSubview:_iconImage];
        //_userName
        _userName = [[UILabel alloc] init];
        _userName.font = [UIFont systemFontOfSize:18];
        _userName.text = userNameStr;
        _userName.textColor = [UIColor whiteColor];
        _userName.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_userName];
        //总资产
        NSString *bearerStr = @"总资产: ";
        NSString *numberStr = assetNumber;
        NSString *nillStr = @" ";
        NSString *currencyStr = currencyStyle;
        NSString *pinjieStr2 = [bearerStr stringByAppendingString: numberStr];
        NSString *pinjieStr3 = [pinjieStr2 stringByAppendingString: nillStr];
        NSString *pinjieStr4 = [pinjieStr3 stringByAppendingString: currencyStr];
        NSString *btnTitleText = pinjieStr4;
        _AssetsCount = [[UILabel alloc] init];
        _AssetsCount.font = [UIFont systemFontOfSize:14];
        _AssetsCount.text = btnTitleText;
        _AssetsCount.textColor = [UIColor whiteColor];
        _AssetsCount.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_AssetsCount];
        //WEC
        NSString *wecStr = @"WEC: ";
        NSString *wecNum = wecNumber;
        NSString *pinjiewecStr = [wecStr stringByAppendingString: wecNum];
        _WECCount = [[UILabel alloc] init];
        _WECCount.text = pinjiewecStr;
        _WECCount.textColor = [UIColor whiteColor];
        _WECCount.font = [UIFont systemFontOfSize:14];
        _WECCount.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_WECCount];
        //xiaoxi
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _messageBtn.backgroundColor = [UIColor grayColor];
        [_messageBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [_messageBtn setImage:[UIImage imageNamed:imageH] forState:UIControlStateHighlighted];
        [_messageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_messageBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [self addSubview:_messageBtn];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGSize userNamesize = [self.userName.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.userName.font,NSFontAttributeName,nil]];
    CGFloat userNameContentWidth = userNamesize.width;
    
    CGSize assetsCountsize = [self.AssetsCount.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.AssetsCount.font,NSFontAttributeName,nil]];
    CGFloat assetsCountContentWidth = assetsCountsize.width;
    
    _iconImage.frame = CGRectMake(10, 10, 40, 40);
    _userName.frame = CGRectMake(CGRectGetMaxX(_iconImage.frame)+10, 15, userNameContentWidth, 30);
    _AssetsCount.frame = CGRectMake(10, CGRectGetMaxY(_iconImage.frame)+10, assetsCountContentWidth, 20);
    _WECCount.frame = CGRectMake(CGRectGetMaxX(_AssetsCount.frame)+20, CGRectGetMaxY(_iconImage.frame)+10, self.CZH_width-CGRectGetMaxX(_AssetsCount.frame)-20, 20);
    _messageBtn.frame = CGRectMake(self.CZH_width-40, 10, 30, 30);
}


@end
