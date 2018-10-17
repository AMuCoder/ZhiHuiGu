//  文件名: Czh_UserInfoView.h
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_UserInfoView : UIView
/**头像*/
@property(nonatomic,strong) UIButton *iconImage;
/**用户名*/
@property(nonatomic,strong) UILabel *userName;
/**总资产*/
@property(nonatomic,strong) UILabel *AssetsCount;
/**WEC资产*/
@property(nonatomic,strong) UILabel *WECCount;
/**消息按钮*/
@property(nonatomic,strong) UIButton *messageBtn;

- (instancetype)initWithFrame:(CGRect)frame IconImage:(NSString *)iconImage userName:(NSString *)userNameStr Zongzichan:(NSString *)assetNumber ZichanStyle:(NSString *)currencyStyle WECNum:(NSString *)wecNumber MessageBtnImage:(NSString *)image MessageBtnHightImage:(NSString *)imageH  NextBtnImage:(NSString *)nextimage NextBtnHightImage:(NSString *)nextimageH;
@end
