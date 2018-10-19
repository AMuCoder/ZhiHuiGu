//  文件名: Czh_RechargeTelVC.m
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_RechargeTelVC.h"
#import "Czh_RechargeField.h"
#import "Czh_LoginBtn.h"
#import "Czh_RegularVerification.h"

@interface Czh_RechargeTelVC ()
@property(nonatomic,strong) Czh_RechargeField *oldtel;
@property(nonatomic,strong) Czh_RechargeField *newtel;
@property(nonatomic,strong) Czh_RechargeField *YZtel;
@property(nonatomic,strong) Czh_RechargeField *paywdtel;
@property(nonatomic,strong) Czh_RechargeField *IDtel;
@property(nonatomic,strong) Czh_LoginBtn *tureBtn;
@property(nonatomic,assign) int count;//计时器数字
@end

@implementation Czh_RechargeTelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改手机号";
    [self addSubViews];
}
- (void)addSubViews{
    /**旧手机验证码*/
    Czh_RechargeField *oldtel = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, 0, self.view.CZH_width-20, 50) placeHolder:@"请输入验证码" boolRView:YES LeftViewTitle:@"原手机验证码:  " rightTitle:@"获取验证码"];
    [self.view addSubview:oldtel];
    _oldtel = oldtel;
    
    /**旧手机获取验证码方法入口*/
    __weak __typeof(self)weakSelf = self;
    [self.oldtel.rtBtn setClickBlock:^(UIButton *button) {// 需要执行的操作
        [weakSelf sendYZCode];
        CZHLog(@"%s",__func__);
    } andEvent:UIControlEventTouchUpInside];
    
    /**分割栏*/
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_oldtel.frame), self.view.CZH_width, 20)];
    line.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line];
    
    /**新手机*/
    Czh_RechargeField *newtel = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line.frame), self.view.CZH_width-20, 50) placeHolder:@"请输入手机号码" boolRView:YES LeftViewTitle:@"中国 +86: " rightTitle:@"获取验证码"];
    [self.view addSubview:newtel];
    _newtel = newtel;
    /**新手机获取验证码方法入口*/
    [self.newtel.rtBtn setClickBlock:^(UIButton *button) {// 需要执行的操作
        [weakSelf sendNEWYZCode];
        CZHLog(@"%s",__func__);
    } andEvent:UIControlEventTouchUpInside];
    /**分割线*/
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_newtel.frame), self.view.CZH_width-20, 1)];
    line1.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line1];
    
    /**验证码*/
    Czh_RechargeField *YZtel = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line1.frame), self.view.CZH_width-20, 50) placeHolder:@"请输入验证码" boolRView:NO LeftViewTitle:@"验证码:  " rightTitle:nil];
    [self.view addSubview:YZtel];
    _YZtel = YZtel;
    
    /**分割栏*/
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_YZtel.frame), self.view.CZH_width, 20)];
    line2.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line2];
    
    /**交易密码*/
    Czh_RechargeField *paywdtel = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line2.frame), self.view.CZH_width-20, 50) placeHolder:@"请输入交易密码" boolRView:NO LeftViewTitle:@"交易密码:  " rightTitle:nil];
    [self.view addSubview:paywdtel];
    _paywdtel = paywdtel;
    
    /**身份证*/
    Czh_RechargeField *IDtel = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_paywdtel.frame), self.view.CZH_width-20, 50) placeHolder:@"请输入身份证号码" boolRView:NO LeftViewTitle:@"身份证:  " rightTitle:nil];
    [self.view addSubview:IDtel];
    _IDtel = IDtel;
    
    /**分割栏*/
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_IDtel.frame), self.view.CZH_width, 20)];
    line3.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line3];
    
    //初始化UITextView
    UITextView *textview =  [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line3.frame)+10, self.view.CZH_width-20, 100)];
    textview.backgroundColor=[UIColor whiteColor]; //设置背景色
    textview.scrollEnabled = NO;    //设置当文字超过视图的边框时是否允许滑动，默认为“YES”
    textview.font=[UIFont systemFontOfSize:13]; //设置字体名字和字体大小;
    textview.textAlignment = NSTextAlignmentLeft; //文本显示的位置默认为居左
    textview.dataDetectorTypes = UIDataDetectorTypeAll; //显示数据类型的连接模式（如电话号码、网址、地址等）
    textview.textColor = [UIColor lightGrayColor];// 设置显示文字颜色
    textview.text = @"温馨提示:修改手机号需三天的安全审核,期间无法进行交易、转账等操作，请慎重选择。";//设置显示的文本内容
    [self.view addSubview:textview];
    
    Czh_LoginBtn *tureBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,self.view.CZH_height - 120, Main_Screen_Width - 40, 44)];
    [tureBtn setTitle:@"确定" forState:UIControlStateNormal];
    tureBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:tureBtn];
    _tureBtn = tureBtn;
    [self.tureBtn addTarget:self action:@selector(tureBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)tureBtnClick{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *PayPwdNum = [userDefaults objectForKey:kUserPayPwdKey];
    if (self.oldtel.text.length == 0 || self.newtel.text.length == 0 || self.paywdtel.text.length == 0 ) {
        [Czh_WarnWindow HUD:self.view andWarnText:@"请输入正确完整信息" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else if (![self.paywdtel.text isEqualToString:PayPwdNum]){
        [Czh_WarnWindow HUD:self.view andWarnText:@"支付密码错误" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else if(![self.paywdtel.text isEqualToString:PayPwdNum]){//身份证
        [Czh_WarnWindow HUD:self.view andWarnText:@"身份证号码错误" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else{
        [self tureBtnNextClick];
    }
}
- (void)tureBtnNextClick{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *pwdNum = [userDefaults objectForKey:kUserPwdKey];
    NSString *IDNum = [userDefaults objectForKey:kUserIDKey];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.oldtel.text forKey:@"old_verify_code"];
    [params setObject:pwdNum forKey:@"pay_pwd"];
    [params setObject:IDNum forKey:@"user_id"];
    [params setObject:self.newtel.text forKey:@"tel"];
    [params setObject:self.YZtel.text forKey:@"verify_code"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_ChangeUserTelURL];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        CZHLog(@"验证码请求时成功返回的数据--------%@",data);
        if ([[NSString stringWithFormat:@"%@",data[@"code"]] isEqualToString:@"200"]) {
            [userDefaults setObject:self.newtel.text  forKey:kUserTelKey];//用户密码
            [userDefaults synchronize];
            [self showAlterView];
        }else if([data[@"message"] isEqualToString:@"旧密码错误"]){
            [self showAlterViewError];
        }
    } WithFailurBlock:^(NSString *error) {
        [Czh_WarnWindow HUD:self.view andWarnText:@"密码修改失败" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    } WithShowHudToView:self.view];
}
-(void)showAlterView{
    [CZHAlertView showAlertWithTitle:@"手机修改成功"
                             message:nil
                         cancelTitle:@"确定"
                          completion:^(BOOL cancelled) {
                              if (cancelled) {
                                  [self.navigationController popViewControllerAnimated:YES];
                              } else {
                                  NSLog(@"Simple Alert View dismissed, but not cancelled");
                              }
                          }];
}
-(void)showAlterViewError{
    [CZHAlertView showAlertWithTitle:@"手机修改失败"
                             message:nil
                         cancelTitle:@"确定"
                          completion:^(BOOL cancelled) {
                              if (cancelled) {
                                  [self.navigationController popViewControllerAnimated:YES];
                              } else {
                                  NSLog(@"Simple Alert View dismissed, but not cancelled");
                              }
                          }];
}
#pragma mark --- 旧手机获取验证码
/**
 点击获取验证码按钮：验证手机号是否填写正确
 */
-(void)sendYZCode{
    CZHLog(@"点击了获取验证码按钮----");
    if (self.oldtel.text.length==0) {
        [Czh_WarnWindow HUD:self.view andWarnText:@"请输入原手机号码" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else{
        if ([Czh_RegularVerification isMobileNumber:self.oldtel.text]) {//正则判断手机号码
            //验证码请求
            [self performSelector:@selector(countClick) withObject:nil];
        }else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"请输入正确手机号码" andXoffset:0 andYoffset:Main_Screen_Width/2];
        }
    }
}
/**
 手机号填写正确后，进去请求获取验证码
 */
-(void)countClick{
#pragma mark
    self.oldtel.rtBtn.enabled =NO;
    _count = 60;
    [self.oldtel.rtBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    /**
     *点击获取验证码的数据请求
     */
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //注册为1，登录2，修改密码3
    NSInteger typeCount = 3;
    NSString *countNstring = [NSString stringWithFormat:@"%ld",(long)typeCount];
    [params setObject:self.oldtel.text forKey:@"phone"];
    [params setObject:countNstring forKey:@"type"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_SendVerificationCode];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        CZHLog(@"验证码请求时成功返回的数据--------%@",data);
        [Czh_WarnWindow HUD:self.view andWarnText:@"已发送短信到您的手机" andXoffset:0 andYoffset:Main_Screen_Width/2];
    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"验证码请求时失败返回的数据--------%@",error);
    } WithShowHudToView:self.view];
    
}
-(void)timerFired:(NSTimer *)timer{
    if (_count !=1) {
        _count -=1;
        [self.oldtel.rtBtn setTitle:[NSString stringWithFormat:@"等待 %d 秒",_count] forState:UIControlStateDisabled];
        _oldtel.enabled = false;
    }else{
        [timer invalidate];
        self.oldtel.rtBtn.enabled = YES;
        [self.oldtel.rtBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        _oldtel.enabled = true;
    }
}


#pragma mark --- 新手机获取验证码
-(void)sendNEWYZCode{
    CZHLog(@"点击了获取验证码按钮----");
    if (self.newtel.text.length==0) {
        [Czh_WarnWindow HUD:self.view andWarnText:@"请输入新手机号码" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else{
        if ([Czh_RegularVerification isMobileNumber:self.newtel.text]) {//正则判断手机号码
            //验证码请求
            [self performSelector:@selector(countNEWClick) withObject:nil];
        }else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"请输入正确手机号码" andXoffset:0 andYoffset:Main_Screen_Width/2];
        }
    }
}
/**
 手机号填写正确后，进去请求获取验证码
 */
-(void)countNEWClick{
#pragma mark
    self.newtel.rtBtn.enabled =NO;
    _count = 60;
    [self.newtel.rtBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerNEWFired:) userInfo:nil repeats:YES];
    
    /**
     *点击获取验证码的数据请求
     */
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //注册为1，登录2，修改密码3
    NSInteger typeCount = 3;
    NSString *countNstring = [NSString stringWithFormat:@"%ld",(long)typeCount];
    [params setObject:self.newtel.text forKey:@"phone"];
    [params setObject:countNstring forKey:@"type"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_SendVerificationCode];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        CZHLog(@"验证码请求时成功返回的数据--------%@",data);
        [Czh_WarnWindow HUD:self.view andWarnText:@"已发送短信到您新手机" andXoffset:0 andYoffset:Main_Screen_Width/2];
    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"验证码请求时失败返回的数据--------%@",error);
    } WithShowHudToView:self.view];
    
}
-(void)timerNEWFired:(NSTimer *)timer{
    if (_count !=1) {
        _count -=1;
        [self.newtel.rtBtn setTitle:[NSString stringWithFormat:@"等待 %d 秒",_count] forState:UIControlStateDisabled];
        _newtel.enabled = false;
    }else{
        [timer invalidate];
        self.newtel.rtBtn.enabled = YES;
        [self.newtel.rtBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        _newtel.enabled = true;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
