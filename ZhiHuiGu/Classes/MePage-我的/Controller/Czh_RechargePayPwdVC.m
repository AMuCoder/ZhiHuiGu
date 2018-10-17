//  文件名: Czh_RechargePayPwdVC.m
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_RechargePayPwdVC.h"
#import "Czh_CWTextField.h"
#import "Czh_RechargeField.h"
#import "Czh_LoginBtn.h"

@interface Czh_RechargePayPwdVC ()
@property(nonatomic,strong) Czh_CWTextField *oneText;
@property(nonatomic,strong) Czh_CWTextField *twoText;
@property(nonatomic,strong) Czh_CWTextField *threeText;
@property(nonatomic,strong) Czh_CWTextField *fourText;
@property(nonatomic,strong) Czh_RechargeField *idPsd;
@property(nonatomic,strong) Czh_RechargeField *payPsd;
@property(nonatomic,strong) Czh_RechargeField *payPsdtoo;
@property(nonatomic,strong) Czh_LoginBtn *tureBtn;

//滚动视图
@property (nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
@end

@implementation Czh_RechargePayPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"重置交易密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setSubViews];
}

- (void)setSubViews {
    
    TPKeyboardAvoidingScrollView * contentScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, self.view.CZH_height)];
    [self.view addSubview:contentScrollView];
    _contentScrollView.bounces = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView = contentScrollView;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    /**手机号码*/
    NSString *TelNum = [userDefaults objectForKey:kUserTelKey];
    CZHLog(@"Tel --- %@",TelNum);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"我们已发送  ";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    CGSize labelsize = [label.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName,nil]];
    // label的内容的宽度
    CGFloat labelsizeContentWidth = labelsize.width;
    label.frame = CGRectMake(10, 20, labelsizeContentWidth, 20);
    [self.contentScrollView addSubview:label];
    
    UILabel *yzlabel = [[UILabel alloc] init];
    yzlabel.text = @"验证码";
    yzlabel.textColor = [UIColor redColor];
    yzlabel.font = [UIFont systemFontOfSize:20];
    yzlabel.textAlignment = NSTextAlignmentCenter;
    CGSize yzlabelsize = [yzlabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:yzlabel.font,NSFontAttributeName,nil]];
    CGFloat yzlabelsizeContentWidth = yzlabelsize.width;
    yzlabel.frame = CGRectMake(CGRectGetMaxX(label.frame), 20, yzlabelsizeContentWidth, 20);
    [self.contentScrollView addSubview:yzlabel];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"  短信到您的手机:";
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:14];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.frame = CGRectMake(CGRectGetMaxX(yzlabel.frame), 20, self.view.CZH_width - CGRectGetMaxX(yzlabel.frame)- 10, 20);
    [self.contentScrollView addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = TelNum;
    label3.textColor = [UIColor blackColor];
    label3.font = [UIFont systemFontOfSize:18];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.frame = CGRectMake(10, CGRectGetMaxY(label.frame)+20, self.view.CZH_width - 20, 20);
    [self.contentScrollView addSubview:label3];
    
    CGFloat Width = (self.view.CZH_width - 50)/4;
    
    Czh_CWTextField *oneText = [[Czh_CWTextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(label3.frame)+30, Width, 40)];
    oneText.textAlignment = NSTextAlignmentCenter;
    oneText.font = [UIFont systemFontOfSize:18];
    oneText.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:oneText];
    _oneText = oneText;
    
    Czh_CWTextField *twoText = [[Czh_CWTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(oneText.frame)+10, CGRectGetMaxY(label3.frame)+30, Width, 40)];
    twoText.textAlignment = NSTextAlignmentCenter;
    twoText.keyboardType = UIKeyboardTypeNumberPad;
    twoText.font = [UIFont systemFontOfSize:18];
    [self.contentScrollView addSubview:twoText];
    _twoText = twoText;
    
    Czh_CWTextField *threeText = [[Czh_CWTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(twoText.frame)+10, CGRectGetMaxY(label3.frame)+30, Width, 40)];
    threeText.textAlignment = NSTextAlignmentCenter;
    threeText.keyboardType = UIKeyboardTypeNumberPad;
    threeText.font = [UIFont systemFontOfSize:18];
    [self.contentScrollView addSubview:threeText];
    _threeText = threeText;
    
    Czh_CWTextField *fourText = [[Czh_CWTextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(threeText.frame)+10, CGRectGetMaxY(label3.frame)+30, Width, 40)];
    fourText.textAlignment = NSTextAlignmentCenter;
    fourText.keyboardType = UIKeyboardTypeNumberPad;
    fourText.font = [UIFont systemFontOfSize:18];
    [self.contentScrollView addSubview:fourText];
    _fourText = fourText;
    
    UILabel *label4 = [[UILabel alloc] init];
    label4.text = @"填写身份证 - 验证身份";
    label4.textColor = [UIColor blackColor];
    label4.font = [UIFont systemFontOfSize:14];
    label4.frame = CGRectMake(10, CGRectGetMaxY(_oneText.frame)+20, self.view.CZH_width - 20, 40);
    [self.contentScrollView addSubview:label4];
    
    Czh_RechargeField *idPsd = [[Czh_RechargeField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(label4.frame)+10, self.view.CZH_width - 20, 40) LeftLabel:nil Placeholder:@"请输入身份证号码"];
    [self.view addSubview:idPsd];
    _idPsd = idPsd;
    UIView *lineOne = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_idPsd.frame), self.view.CZH_width-20, 1)];
    lineOne.backgroundColor = [UIColor lightGrayColor];
    [self.contentScrollView addSubview:lineOne];
    
    UILabel *label5 = [[UILabel alloc] init];
    label5.text = @"请为账号设置6位新的支付密码";
    label5.textColor = [UIColor blackColor];
    label5.font = [UIFont systemFontOfSize:14];
    label5.frame = CGRectMake(10, CGRectGetMaxY(lineOne.frame)+20, self.view.CZH_width - 20, 20);
    [self.contentScrollView addSubview:label5];
    Czh_RechargeField *payPsd = [[Czh_RechargeField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(label5.frame)+10, self.view.CZH_width - 20, 40) LeftLabel:nil Placeholder:@"请请输入新的支付密码"];
    payPsd.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:payPsd];
    _payPsd = payPsd;
    UIView *linetwo = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_payPsd.frame), self.view.CZH_width-20, 1)];
    linetwo.backgroundColor = [UIColor lightGrayColor];
    [self.contentScrollView addSubview:linetwo];
    
    UILabel *label6 = [[UILabel alloc] init];
    label6.text = @"再次输入";
    label6.textColor = [UIColor blackColor];
    label6.font = [UIFont systemFontOfSize:14];
    label6.frame = CGRectMake(10, CGRectGetMaxY(linetwo.frame)+20, self.view.CZH_width - 20, 20);
    [self.contentScrollView addSubview:label6];
    Czh_RechargeField *payPsdtoo = [[Czh_RechargeField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(label6.frame)+10, self.view.CZH_width - 20, 40) LeftLabel:nil Placeholder:@"请请输入新的支付密码"];
    payPsdtoo.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:payPsdtoo];
    _payPsdtoo = payPsdtoo;
    UIView *linethree = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_payPsdtoo.frame), self.view.CZH_width-20, 1)];
    linethree.backgroundColor = [UIColor lightGrayColor];
    [self.contentScrollView addSubview:linethree];
    
    //
    Czh_LoginBtn *tureBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,self.view.CZH_height - 120, Main_Screen_Width - 40, 44)];
    [tureBtn setTitle:@"确定" forState:UIControlStateNormal];
    tureBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:tureBtn];
    _tureBtn = tureBtn;
    [self.tureBtn addTarget:self action:@selector(tureBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)tureBtnClick{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
