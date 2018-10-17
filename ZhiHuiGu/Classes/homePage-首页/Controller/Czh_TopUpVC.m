//  文件名: Czh_TopUpVC.m
//  创建者: CYJ 时间: 2018/10/13.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_TopUpVC.h"
#import "Czh_LoginTextField.h"
#import "Czh_LoginBtn.h"

@interface Czh_TopUpVC ()
@property(nonatomic,strong) UIButton *wechatPayBtn;
@property(nonatomic,strong) UIButton *zhifubaoPayBtn;
@property(nonatomic,strong) Czh_LoginBtn *ZFNextBtn;

@end

@implementation Czh_TopUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setSubViewsWithWechatPayBtnStr:@"xxx" ZhifubaoPayBtnStr:@"xxx" ZhifuHolder:@"请输入金额" LeftViewImageStr:@"xxx"];
}

-(void)setSubViewsWithWechatPayBtnStr:(NSString *)wechatPayBtnStr
                    ZhifubaoPayBtnStr:(NSString *)zhifubaoPayBtnStr
                          ZhifuHolder:(NSString *)zhifuHolder
                     LeftViewImageStr:(NSString *)leftViewImageStr
{
    UIView *superTopUpView = [[UIView alloc] initWithFrame:CGRectMake(10, 20, self.view.CZH_width-20, 194)];
    superTopUpView.backgroundColor = CZHRGBColor(244, 244, 244);
    superTopUpView.layer.cornerRadius = 5;
    [self.view addSubview:superTopUpView];
    
    UILabel *topupLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, superTopUpView.CZH_width-20, 20)];
    topupLabel.text = @"充值金额";
    topupLabel.textColor = [UIColor blackColor];
    topupLabel.font = [UIFont boldSystemFontOfSize:18];
    topupLabel.textAlignment = NSTextAlignmentLeft;
    [superTopUpView addSubview:topupLabel];
    
    UILabel *cnyLabel = [[UILabel alloc] init];
    cnyLabel.text = @"CNY";
    cnyLabel.font = [UIFont systemFontOfSize:20.0f];
    [superTopUpView addSubview:cnyLabel];
    // 根据字体得到label的内容的尺寸
    CGSize size = [cnyLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:cnyLabel.font,NSFontAttributeName,nil]];
    // label的内容的宽度
    CGFloat labelContentWidth = size.width;
    CZHLog(@"__________%f",labelContentWidth);
    // 如果label的内容的宽度度超过150，则label的宽度就设置为150，即label的最大宽度为150
    cnyLabel.frame = CGRectMake(superTopUpView.CZH_width - labelContentWidth-10, CGRectGetMaxY(topupLabel.frame) + 20, labelContentWidth, 40);
    
    //Czh_LoginTextField *topUpTextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(topupLabel.frame) + 20, superTopUpView.CZH_width-labelContentWidth-25, 40) PlaceHolder:@"请输入金额" LeftViewImage:@"xxx"];
    Czh_LoginTextField *topUpTextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(topupLabel.frame) + 20, superTopUpView.CZH_width-labelContentWidth-25, 40) PlaceHolder:zhifuHolder LeftViewImage:leftViewImageStr];
    [superTopUpView addSubview:topUpTextField];
    
    //paystyle
    UILabel *paystyleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(topUpTextField.frame) + 10, 100, 20)];
    paystyleLabel.text = @"支付方式";
    paystyleLabel.font = [UIFont systemFontOfSize:18];
    [superTopUpView addSubview:paystyleLabel];
    
    _wechatPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _wechatPayBtn.frame = CGRectMake(10, CGRectGetMaxY(paystyleLabel.frame) + 20, 44, 44);
//    [_wechatPayBtn setTitle:@"更换资产" forState:UIControlStateNormal];
    [_wechatPayBtn setImage:[UIImage imageNamed:wechatPayBtnStr] forState:UIControlStateNormal];
    [_wechatPayBtn setBackgroundColor:[UIColor lightGrayColor]];
//    [_wechatPayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _wechatPayBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [_wechatPayBtn addTarget:self action:@selector(wechatPayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [superTopUpView addSubview:_wechatPayBtn];
    
    _zhifubaoPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _zhifubaoPayBtn.frame = CGRectMake(64, CGRectGetMaxY(paystyleLabel.frame) + 20, 44, 44);
    [_zhifubaoPayBtn setImage:[UIImage imageNamed:zhifubaoPayBtnStr] forState:UIControlStateNormal];
    [_zhifubaoPayBtn setBackgroundColor:[UIColor lightGrayColor]];
    [_zhifubaoPayBtn addTarget:self action:@selector(zhifubaoPayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [superTopUpView addSubview:_zhifubaoPayBtn];
    
    _ZFNextBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(10,CGRectGetMaxY(superTopUpView.frame) + 30, Main_Screen_Width - 20, 44)];
    [_ZFNextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    _ZFNextBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:_ZFNextBtn];
    [_ZFNextBtn addTarget:self action:@selector(ZFNextBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)wechatPayBtnClick {
    CZHLog(@"%s",__func__);
    // Dispose of any resources that can be recreated.
}
- (void)zhifubaoPayBtnClick {
    CZHLog(@"%s",__func__);
    // Dispose of any resources that can be recreated.
}
- (void)ZFNextBtnClick{
    CZHLog(@"%s",__func__);
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
