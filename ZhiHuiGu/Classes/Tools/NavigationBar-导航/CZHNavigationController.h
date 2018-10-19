//
//  CZHNavigationController.h
//  沁汉堂
//
//  Created by Mac on 16/8/4.
//  Copyright © 2016年 CHANT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZHNavigationController : UINavigationController
@property (strong ,nonatomic) NSMutableArray *arrayScreenshot;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@end
