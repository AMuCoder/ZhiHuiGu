//  文件名: Czh_OrderView.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：我的订单，高度：70 +(self.CZH_width- 60)/5

#import "Czh_OrderView.h"

@implementation Czh_OrderView

- (instancetype)initWithFrame:(CGRect)frame PaymentBtn:(NSString *)paymentBtnImage SendBtn:(NSString *)sendBtnImage GoodsBtn:(NSString *)goodsBtnImage EvaluateBtn:(NSString *)evaluateBtnImage RefundBtn:(NSString *)refundBtnImage
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        _order = [[UILabel alloc] init];
        _order.font = [UIFont systemFontOfSize:18];
        _order.text = @"我的订单";
        _order.textColor = [UIColor whiteColor];
        _order.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_order];
        
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor blackColor];
        [self addSubview:_line];
        /**偏移量
          //button图片的偏移量，距上左下右分别(10, 10, 10, 60)像素点
         */
        CGFloat mar = 10;
        CGFloat btnW = (self.CZH_width- 6*mar)/5;
        CGFloat btnH = btnW + 30;
        /**待付款*/
        _paymentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _paymentBtn.backgroundColor = [UIColor orangeColor];
        [_paymentBtn setImage:[UIImage imageNamed:paymentBtnImage] forState:UIControlStateNormal];
        [_paymentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_paymentBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [_paymentBtn setTitle:@"待付款" forState:UIControlStateNormal];
        _paymentBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _paymentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 30, 0);
        _paymentBtn.titleEdgeInsets = UIEdgeInsetsMake(btnW, 0, 0, 0);
        [self addSubview:_paymentBtn];
        /**待发货*/
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.backgroundColor = [UIColor orangeColor];
        [_sendBtn setImage:[UIImage imageNamed:sendBtnImage] forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [_sendBtn setTitle:@"待发货" forState:UIControlStateNormal];
        _sendBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _sendBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 30, 0);
        _sendBtn.titleEdgeInsets = UIEdgeInsetsMake(btnW, 0, 0, 0);
        [self addSubview:_sendBtn];
        /**待收货*/
        _goodsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _goodsBtn.backgroundColor = [UIColor orangeColor];
        [_goodsBtn setImage:[UIImage imageNamed:goodsBtnImage] forState:UIControlStateNormal];
        [_goodsBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_goodsBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [_goodsBtn setTitle:@"待收货" forState:UIControlStateNormal];
        _goodsBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _goodsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 30, 0);
        _goodsBtn.titleEdgeInsets = UIEdgeInsetsMake(btnW, 0, 0, 0);
        [self addSubview:_goodsBtn];
        /**待评价*/
        _evaluateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _evaluateBtn.backgroundColor = [UIColor orangeColor];
        [_evaluateBtn setImage:[UIImage imageNamed:evaluateBtnImage] forState:UIControlStateNormal];
        [_evaluateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_evaluateBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [_evaluateBtn setTitle:@"待评价" forState:UIControlStateNormal];
        _evaluateBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _evaluateBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 30, 0);
        _evaluateBtn.titleEdgeInsets = UIEdgeInsetsMake(btnW, 0, 0, 0);
        [self addSubview:_evaluateBtn];
        /**退款售后*/
        _refundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _refundBtn.backgroundColor = [UIColor orangeColor];
        [_refundBtn setImage:[UIImage imageNamed:refundBtnImage] forState:UIControlStateNormal];
        [_refundBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_refundBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        [_refundBtn setTitle:@"退款/售后" forState:UIControlStateNormal];
        _refundBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _refundBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 30, 0);
        _refundBtn.titleEdgeInsets = UIEdgeInsetsMake(btnW, 0, 0, 0);
        [self addSubview:_refundBtn];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat mar = 10;
    CGFloat btnW = (self.CZH_width- 6*mar)/5;
    CGFloat btnH = btnW + 30;
    
    _order.frame = CGRectMake(10, 10, self.CZH_width, 20);
    _line.frame = CGRectMake(10, CGRectGetMaxY(_order.frame) +10, self.CZH_width-20, 0.5);
    
    _paymentBtn.frame = CGRectMake(10, CGRectGetMaxY(_line.frame) +10, btnW, btnH);
    _sendBtn.frame = CGRectMake(CGRectGetMaxX(_paymentBtn.frame) +10, CGRectGetMaxY(_line.frame) +10, btnW, btnH);
    _goodsBtn.frame = CGRectMake(CGRectGetMaxX(_sendBtn.frame) +10, CGRectGetMaxY(_line.frame) +10, btnW, btnH);
    _evaluateBtn.frame = CGRectMake(CGRectGetMaxX(_goodsBtn.frame) +10, CGRectGetMaxY(_line.frame) +10, btnW, btnH);
    _refundBtn.frame = CGRectMake(CGRectGetMaxX(_evaluateBtn.frame) +10, CGRectGetMaxY(_line.frame) +10, btnW, btnH);
    
}
@end
