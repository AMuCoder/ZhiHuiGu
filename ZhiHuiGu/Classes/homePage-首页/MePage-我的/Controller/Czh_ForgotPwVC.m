//
//  Czh_ForgotPwVC.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/29.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_ForgotPwVC.h"
#import "Czh_LoginTextField.h"
#import "Czh_LoginBtn.h"
#import "RTNavigationBar.h"
#import "Czh_RegularVerification.h"

@interface Czh_ForgotPwVC ()

//滚动视图
@property (nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
@property (nonatomic,strong) Czh_LoginTextField *phonetextField;
@property (nonatomic,strong) Czh_LoginTextField *yzNumtextField;
@property (nonatomic,strong) Czh_LoginTextField *pdNumtextField;
@property (nonatomic,strong) Czh_LoginTextField *pdNumtextField2;
@property (nonatomic,strong) Czh_LoginBtn *fpdloginBtn;
@property (nonatomic,assign) int count;
@property (nonatomic,strong) Czh_promptLabel *label;
@property (nonatomic, copy) NSString *codeStr;

@end

@implementation Czh_ForgotPwVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self yzmBtnClick];
    [self setNav];
}

-(void)setupView{
    TPKeyboardAvoidingScrollView * contentScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    [self.view addSubview:contentScrollView];
    _contentScrollView.bounces = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView = contentScrollView;
    /**
     ios 11判断
     */
    CGFloat kheight;
    if (@available(iOS 11.0, *)) {
        kheight = 120.f;
    }else{
        kheight = 64;
    }
    //手机号
    Czh_LoginTextField *phonetextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,kheight, Main_Screen_Width - 40, 44) placeHolder:@"请输入手机号码" boolLeftView:NO rightTitle:nil];
    [self.contentScrollView addSubview:phonetextField];
    _phonetextField = phonetextField;
    
    //验证码
    Czh_LoginTextField *yzNumtextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.phonetextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入验证码" boolLeftView:YES rightTitle:@"获取验证码"];
    yzNumtextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:yzNumtextField];
    _yzNumtextField = yzNumtextField;
    
    //密码
    Czh_LoginTextField *pdNumtextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.yzNumtextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入新密码" boolLeftView:NO rightTitle:nil];
    pdNumtextField.secureTextEntry = YES;
    [self.contentScrollView addSubview:pdNumtextField];
    _pdNumtextField = pdNumtextField;
    
    //再次输入密码
    Czh_LoginTextField *pdNumtextField2 = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.pdNumtextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请再次输入密码" boolLeftView:NO rightTitle:nil];
    pdNumtextField2.secureTextEntry = YES;
    [self.contentScrollView addSubview:pdNumtextField2];
    _pdNumtextField2 = pdNumtextField2;
    
    Czh_promptLabel *label = [[Czh_promptLabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.pdNumtextField2.frame) + 25, Main_Screen_Width - 40, 25) labelText:@"验证码错误, 请重新输入"];
    [self.contentScrollView addSubview:label];
    _label = label;
    _label.hidden = YES;
    
    //注册按钮
    Czh_LoginBtn *fpdloginBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(label.frame) + 25, Main_Screen_Width - 40, 44)];
    [fpdloginBtn setTitle:@"确定" forState:UIControlStateNormal];
    fpdloginBtn.backgroundColor = MAIN_COLOR;
    [self.contentScrollView addSubview:fpdloginBtn];
    _fpdloginBtn = fpdloginBtn;
    [self.fpdloginBtn addTarget:self action:@selector(fpdloginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)yzmBtnClick{
    __weak __typeof(self)weakSelf = self;
    [self.yzNumtextField.rBtn setClickBlock:^(UIButton *button) {
        [weakSelf sendCode];
    } andEvent:UIControlEventTouchUpInside];
}

-(void)sendCode
{
    if (self.phonetextField.text.length==0) {
        //通过第三方创建菊花//提示框
        [Czh_WarnWindow HUD:self.view andWarnText:@"请输入手机号码" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else{
        //正则判断手机号码
        if ([Czh_RegularVerification isMobileNumber:self.phonetextField.text]) {
            //验证码请求
            [self performSelector:@selector(countClick) withObject:nil];
        }else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"请输入正确手机号码" andXoffset:0 andYoffset:Main_Screen_Width/2];
        }
    }
}
-(void)countClick
{
    /**
     点击获取验证码的数据请求
     */
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //注册为1，登录2，修改密码3
    NSInteger typeCount = 3;
    NSString *countNstring = [NSString stringWithFormat:@"%ld",(long)typeCount];
    CZHLog(@"countNstring--------%@----%@",countNstring,self.phonetextField.text);
    [params setObject:self.phonetextField.text forKey:@"phone"];
    [params setObject:countNstring forKey:@"type"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_SendVerificationCode];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        self.codeStr = data[@"data"];
        CZHLog(@"验证码请求时成功返回的数据--------%@",data);
        [Czh_WarnWindow HUD:self.view andWarnText:@"已发送短信到您的手机" andXoffset:0 andYoffset:Main_Screen_Width/2];
    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"验证码请求时失败返回的数据--------%@",error);
    } WithShowHudToView:self.view];
    
    self.yzNumtextField.rBtn.enabled =NO;
    _count = 60;
    [self.yzNumtextField.rBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}
-(void)timerFired:(NSTimer *)timer
{
    if (_count !=1) {
        _count -=1;
        [self.yzNumtextField.rBtn setTitle:[NSString stringWithFormat:@"等待 %d 秒",_count] forState:UIControlStateDisabled];
        self.phonetextField.enabled = false;
    }else{
        [timer invalidate];
        self.yzNumtextField.rBtn.enabled = YES;
        [self.yzNumtextField.rBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.phonetextField.enabled = true;
    }
}


-(void)fpdloginBtnClick{
    //判断登录信息是否为空？
    if ((self.phonetextField.text.length == 0) || (self.pdNumtextField.text.length==0) || (self.pdNumtextField2.text.length==0)) {
        [Czh_WarnWindow HUD:self.view andWarnText:@"请完整输入登录信息" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    //判断密码是否一致？
    }else if (![self.pdNumtextField.text isEqualToString:self.pdNumtextField2.text]) {
        [Czh_WarnWindow HUD:self.view andWarnText:@"密码不一致，请重新输入" andXoffset:0 andYoffset:Main_Screen_Width/2];
    //判断填入的验证码和获取的验证码是否一致？
    }else if(![self.yzNumtextField.text isEqualToString:self.codeStr]){
        self.label.hidden = NO;
    }else{
        self.label.hidden = YES;
        [self LoginBtnClickNetWork];
    }
    CZHLog(@"忘记密码界面，登录按钮点击！----");
}
-(void)LoginBtnClickNetWork{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.pdNumtextField2.text forKey:@"pwd"];
    [params setObject:self.phonetextField.text forKey:@"tel"];
    [params setObject:self.yzNumtextField.text forKey:@"verify_code"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_RetrieveLoginPassword];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        CZHLog(@"验证码请求时成功返回的数据--------%@",data);
        [Czh_WarnWindow HUD:self.view andWarnText:@"已成功修改登录密码" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
        [self dismissViewControllerAnimated:YES completion:nil];
    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"验证码请求时失败返回的数据--------%@",error);
    } WithShowHudToView:self.view];
}




#pragma mark -- 添加导航栏
-(void)setNav{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    UINavigationBar *nav = [RTNavigationBar defaultBar];
    nav.barTintColor = [UIColor whiteColor];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"找回密码"];
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"common_btn_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [left setImageEdgeInsets:UIEdgeInsetsMake(0, /*0*/-23, 0, 0)];
    [left addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:left];
    [navigationItem setLeftBarButtonItem:leftBtn animated:NO];
    [nav pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:nav];
}
-(void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
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
