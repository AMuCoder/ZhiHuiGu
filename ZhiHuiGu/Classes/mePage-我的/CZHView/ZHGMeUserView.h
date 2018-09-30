//
//  ZHGMeUserView.h
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/27.
//  Copyright © 2018年 CYJ. All rights reserved.
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
