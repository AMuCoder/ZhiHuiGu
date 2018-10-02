//
//  ZHGMeUserView.h
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/27.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHGMeUserView : UIView
/**
 头像
 */
@property (nonatomic, strong) UIImageView *pictureView;

/**
 用户名
 */
@property (nonatomic, strong) UILabel *nameLabel;

/**
 账号
 */
@property (nonatomic, strong) UILabel *countLabel;
@end
