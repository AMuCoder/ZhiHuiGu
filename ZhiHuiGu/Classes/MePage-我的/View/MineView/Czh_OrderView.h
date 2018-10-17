//  文件名: Czh_OrderView.h
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface Czh_OrderView : UIView
@property(nonatomic,strong) UILabel *order;
@property(nonatomic,strong) UIView *line;
/**待付款*/
@property(nonatomic,strong) UIButton *paymentBtn;
/**待发货*/
@property(nonatomic,strong) UIButton *sendBtn;
/**待收货*/
@property(nonatomic,strong) UIButton *goodsBtn;
/**待评价*/
@property(nonatomic,strong) UIButton *evaluateBtn;
/**退款售后*/
@property(nonatomic,strong) UIButton *refundBtn;


- (instancetype)initWithFrame:(CGRect)frame PaymentBtn:(NSString *)paymentBtnImage SendBtn:(NSString *)sendBtnImage GoodsBtn:(NSString *)goodsBtnImage EvaluateBtn:(NSString *)evaluateBtnImage RefundBtn:(NSString *)refundBtnImage;
@end
