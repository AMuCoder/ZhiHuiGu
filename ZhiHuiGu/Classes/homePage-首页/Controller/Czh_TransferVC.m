//  文件名: Czh_TransferVC.m
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_TransferVC.h"
#import "Czh_CWTextField.h"
#import "Czh_UnderlineTextField.h"
#import "Czh_LoginBtn.h"

@interface Czh_TransferVC ()
/**币种*/
@property(nonatomic,strong) UILabel *currencyLabel;
@property(nonatomic,strong) UIButton *currencyBtn;
@property(nonatomic,strong) Czh_CWTextField *numTextField;

@end

@implementation Czh_TransferVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转账";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    [self addRightBtn];
    [self addSelfViewWithCurrencyStr:@"WTO" NumberStr:@"100"];
}
- (void)addRightBtn{
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightitem;
}
- (void)addSelfViewWithCurrencyStr:(NSString *)currencyStrtext NumberStr:(NSString *)numberStrtext{
    
    _currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, self.view.CZH_width/3, 40)];
    _currencyLabel.text = currencyStrtext;
    _currencyLabel.font = [UIFont systemFontOfSize:15];
    _currencyLabel.textColor = [UIColor blackColor];
    _currencyLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_currencyLabel];
    
    
    NSString *bearerStr = @"余额: ";
    NSString *numberStr = numberStrtext;
    NSString *nillStr = @" ";
    NSString *currencyStr = currencyStrtext;
    NSString *rightStr = @" >";
    NSString *pinjieStr2 = [bearerStr stringByAppendingString: numberStr];
    NSString *pinjieStr3 = [pinjieStr2 stringByAppendingString: nillStr];
    NSString *pinjieStr4 = [pinjieStr3 stringByAppendingString: currencyStr];
    NSString *pinjieStr5 = [pinjieStr4 stringByAppendingString: rightStr];
    NSString *btnTitleText = pinjieStr5;
    UIButton *currencyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [currencyBtn setTitle:btnTitleText forState:UIControlStateNormal];
    //[currencyBtn setTitle:@"摸我一下" forState:UIControlStateHighlighted];
    currencyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    currencyBtn.titleLabel.textAlignment = NSTextAlignmentRight;//这句无效
    currencyBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [currencyBtn setTitleColor:[UIColor redColor]  forState:UIControlStateNormal];
    [currencyBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    currencyBtn.frame = CGRectMake(self.view.CZH_width/3 + 10,20, 2*self.view.CZH_width/3-20, 40);
    [self.view addSubview:currencyBtn];
    _currencyBtn = currencyBtn;
    
    Czh_CWTextField *numTextField = [[Czh_CWTextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_currencyLabel.frame) + 10, self.view.CZH_width-20, 40)];
    numTextField.placeholder = @"请输入金额";
    numTextField.borderStyle = UITextBorderStyleNone;
    numTextField.backgroundColor = [UIColor whiteColor];
    numTextField.textAlignment = NSTextAlignmentLeft;
    numTextField.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [self.view addSubview:numTextField];
    _numTextField = numTextField;
    
    UILabel *beiZhuLable = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(numTextField.frame)+10, 50, 40)];
    beiZhuLable.text = @"备注：";
    beiZhuLable.font = [UIFont systemFontOfSize:15];
    beiZhuLable.textColor = [UIColor blackColor];
    beiZhuLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:beiZhuLable];
    
    UITextField *beiZhu = [[UITextField alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(numTextField.frame) + 10, self.view.CZH_width-20, 40)];
    beiZhu.placeholder = @"(选填)";
    beiZhu.borderStyle = UITextBorderStyleNone;
    beiZhu.backgroundColor = [UIColor whiteColor];
    beiZhu.textAlignment = NSTextAlignmentLeft;
    //beiZhu.keyboardType = UIKeyboardTypeNumberPad;//数字键盘
    [self.view addSubview:beiZhu];
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(beiZhu.frame),  self.view.CZH_width,20)];
    lineView.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:lineView];
    
    UILabel *shouKuan = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lineView.frame)+10, self.view.CZH_width-20, 20)];
    shouKuan.text = @"收款地址";
    shouKuan.font = [UIFont systemFontOfSize:15];
    shouKuan.textColor = [UIColor blackColor];
    shouKuan.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:shouKuan];
    
    Czh_UnderlineTextField *underline = [[Czh_UnderlineTextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(shouKuan.frame)+10, self.view.CZH_width-20, 40) PlaceHolder:@"输入地址" boolLeftView:NO LeftViewImage:nil boolRightView:YES RightViewImage:@"xxx"];
    [self.view addSubview:underline];
    
    UILabel *fuKuanDz = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(underline.frame)+10, self.view.CZH_width-20, 20)];
    fuKuanDz.text = @"付款地址";
    fuKuanDz.font = [UIFont systemFontOfSize:15];
    fuKuanDz.textColor = [UIColor blackColor];
    fuKuanDz.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:fuKuanDz];
    
    UILabel *fuKuanDzLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(fuKuanDz.frame)+10, self.view.CZH_width-20, 20)];
    fuKuanDzLabel.text = @"000000000000qwqeqwe0000000qweqwe0qw000qeweq";
    fuKuanDzLabel.font = [UIFont systemFontOfSize:15];
    fuKuanDzLabel.textColor = [UIColor lightGrayColor];
    fuKuanDzLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:fuKuanDzLabel];
    
    //注册按钮
    Czh_LoginBtn *nextBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(fuKuanDzLabel.frame) + 25, Main_Screen_Width - 40, 44)];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:nextBtn];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextBtnClick{
    CZHLog(@"%s",__func__);
}
- (void)rightBtnClick{
    CZHLog(@"%s",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
