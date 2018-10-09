//
//  Czh_RegisterVC.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/28.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_RegisterVC.h"
#import <QuartzCore/QuartzCore.h>
#import "Czh_LoginTextField.h"
#import "Czh_LoginBtn.h"
#import "Czh_CreateWalletVC.h"
#import "Czh_RegularVerification.h"
#import "Czh_SingleObject.h"
#import "UserInfoModel.h"
#import "UserInfoTool.h"
#import "User.h"
#import "RTNavigationBar.h"

@interface Czh_RegisterVC ()
//滚动视图
@property(nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
//用户名
@property(nonatomic,strong) Czh_LoginTextField *nametextField;
//手机号码
@property(nonatomic,strong) Czh_LoginTextField *phoneNum;
//验证码
@property(nonatomic,strong) Czh_LoginTextField *yzNum;
//密码
@property(nonatomic,strong) Czh_LoginTextField *pdNum;
//同意协议
@property(nonatomic,strong) UIButton *checkBox;
//注册按钮
@property(nonatomic,strong) Czh_LoginBtn *regBtn;
//返回登录
@property(nonatomic,strong) Czh_LoginBtn *backLoginBtn;
//计时器数字
@property(nonatomic,assign) int count;

@property(strong,nonatomic)NSDictionary *userInfoDic;

@property(copy,nonatomic)NSString *codeStr;//验证码

@property(nonatomic,strong) NSMutableDictionary *czh_dict;

@end

@implementation Czh_RegisterVC
-(NSMutableDictionary *)czh_dict
{
    if (!_czh_dict) {
        self.czh_dict = [NSMutableDictionary dictionary];
    }
    return _czh_dict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setNav];
}
#pragma mark -- 添加导航栏
-(void)setNav{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    UINavigationBar *nav = [RTNavigationBar defaultBar];
    nav.barTintColor = [UIColor whiteColor];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"注册"];
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"common_btn_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [left setImageEdgeInsets:UIEdgeInsetsMake(0, /*0*/-23, 0, 0)];
    [left addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithCustomView:left];
    [navigationItem setLeftBarButtonItem:leftBtn animated:NO];
    [nav pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:nav];
}
#pragma mark -- 添加界面控件
-(void)setupView{
    TPKeyboardAvoidingScrollView * contentScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    [self.view addSubview:contentScrollView];
    _contentScrollView.bounces = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView = contentScrollView;
    //用户名
    CGFloat kheight;
    if (@available(iOS 11.0, *)) {
        kheight = 120.f;
    }else{
        kheight = 30.f;
    }
    Czh_LoginTextField *nametextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,kheight, Main_Screen_Width - 40, 44) placeHolder:@"请输入用户名" boolLeftView:NO rightTitle:nil];
    [self.contentScrollView addSubview:nametextField];
    _nametextField = nametextField;
    
    //手机号
    Czh_LoginTextField *phoneNum = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.nametextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入手机号" boolLeftView:NO rightTitle:nil];
    phoneNum.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:phoneNum];
    _phoneNum = phoneNum;
    
    //验证码
    Czh_LoginTextField *yzNum = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.phoneNum.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入验证码" boolLeftView:YES rightTitle:@"获取验证码"];
    yzNum.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:yzNum];
    _yzNum = yzNum;
    
    //密码
    Czh_LoginTextField *pdNum = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.yzNum.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请设置密码" boolLeftView:NO rightTitle:nil];
    pdNum.secureTextEntry = YES;
    [self.contentScrollView addSubview:pdNum];
    _pdNum = pdNum;
    
    //阅读协议//同意”免责声明及风险披露“
    UIButton *accpetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    accpetBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    accpetBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    accpetBtn.frame = CGRectMake(25, CGRectGetMaxY(self.pdNum.frame) + 25, self.view.frame.size.width - CGRectGetMaxX(self.checkBox.frame) - 50, 20);
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"点击注册,即表示同意”免责声明及风险披露“"];
    NSRange allRange = {10,[str length]-10};
    NSDictionary *attrs = [NSDictionary dictionary];
    attrs = @{
              NSForegroundColorAttributeName:[UIColor orangeColor],
//              NSFontAttributeName:[UIFont systemFontOfSize:15]
              };
    [str addAttributes:attrs range:allRange];
    [accpetBtn setAttributedTitle:str forState:UIControlStateNormal];
    [accpetBtn sizeToFit];
    [accpetBtn addTarget:self action:@selector(accpetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_contentScrollView addSubview:accpetBtn];
    
    //注册按钮
    Czh_LoginBtn *regBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(accpetBtn.frame) + 25, Main_Screen_Width - 40, 44)];
    [regBtn setTitle:@"注  册" forState:UIControlStateNormal];
    regBtn.backgroundColor = MAIN_COLOR;
    [self.contentScrollView addSubview:regBtn];
    _regBtn = regBtn;
    [self.regBtn addTarget:self action:@selector(regBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //返回登录
    Czh_LoginBtn *backLoginBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(_regBtn.frame) + 25, Main_Screen_Width - 40, 44)];
    [backLoginBtn setTitle:@"已有账号, 去登录" forState:UIControlStateNormal];
    backLoginBtn.backgroundColor = [UIColor darkGrayColor];
    [self.contentScrollView addSubview:backLoginBtn];
    _backLoginBtn = backLoginBtn;
    [self.backLoginBtn addTarget:self action:@selector(gotobackLoginClick) forControlEvents:UIControlEventTouchUpInside];
    
    __weak __typeof(self)weakSelf = self;
    [self.yzNum.rBtn setClickBlock:^(UIButton *button) {// 需要执行的操作
        [weakSelf sendCode];
    } andEvent:UIControlEventTouchUpInside];
}

-(void)didClickCheckBox{
    CZHLog(@"%s",__func__);
    self.checkBox.selected = !self.checkBox.selected;
    if (!self.checkBox.selected) {
//        self.btn.userInteractionEnabled = NO;
//        [self.btn setBackgroundColor:[UIColor grayColor]];
        CZHLog(@"------");
    }else{
        CZHLog(@"******");
//        self.btn.userInteractionEnabled = YES;
//        [self.btn setBackgroundColor:BTNBACKGROUND_COLOR];
    }
}

- (void)regBtnClick{
    // 点击登录按钮后，关闭键盘
    [self.view endEditing:YES];
    if (self.nametextField.text.length==0 || _phoneNum.text.length==0 || _pdNum.text.length==0 || _yzNum.text.length==0) {
        //通过第三方创建菊花//提示框
        [Czh_WarnWindow HUD:self.view andWarnText:@"请输入完整注册信息" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    }else{
        //正则判断手机号码
        if ([Czh_RegularVerification isMobileNumber:self.phoneNum.text]) {
            //验证码请求
            [self performSelector:@selector(regBtnClickNetWork) withObject:nil];
        }else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"请输入正确手机号码" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
        }
    }
}
    
/**
 点击注册按钮
 */
-(void)regBtnClickNetWork{
    CZHLog(@"点击注册按钮 -- %s",__func__);
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    [parametersDic setObject:self.nametextField.text forKey:@"nick"];
    [parametersDic setObject:self.phoneNum.text forKey:@"tel"];
    [parametersDic setObject:self.pdNum.text forKey:@"pwd"];
    [parametersDic setObject:self.yzNum.text forKey:@"verify_code"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_userRegister];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:parametersDic WithSuccessBlock:^(id data) {
        
        if ([[NSString stringWithFormat:@"%@",data[@"code"]] isEqualToString:@"200"]) {
            NSArray *keypairsArr = [NSArray array];
            keypairsArr = data[@"data"][@"keypairs"];
            NSDictionary *keypairsDict = [NSDictionary dictionary];
            keypairsDict = keypairsArr.firstObject;
            
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            [userDefaults setObject:data[@"data"][@"user"][@"nick"]  forKey:kUserNameKey];
            [userDefaults setObject:data[@"data"][@"user"][@"pwd"]  forKey:kUserPwdKey];
            [userDefaults setObject:data[@"data"][@"user"][@"id"]  forKey:kUserIDKey];
            [userDefaults setObject:data[@"data"][@"user"][@"created"]  forKey:kUserCreatedKey];
            [userDefaults setObject:data[@"data"][@"user"][@"updated"]  forKey:kUserUpdatedKey];
            [userDefaults setObject:data[@"data"][@"user"][@"tel"]  forKey:kUserTelKey];
            [userDefaults setObject:data[@"data"][@"token"]  forKey:kUserTokenKey];
            [userDefaults setObject:data[@"data"][@"mnemonic"]  forKey:kUserMnemonicKey];
            [userDefaults setObject:keypairsDict[@"address"]  forKey:kUserAddressKey];
            [userDefaults setObject:keypairsDict[@"Seed"]  forKey:kUserSeedKey];
            [userDefaults setBool:YES forKey:kUserisLogin];
             [userDefaults synchronize];
            //注册成功--提示框
            [Czh_WarnWindow HUD:self.view andWarnText:@"注册成功" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
            [self presentViewController:[Czh_CreateWalletVC new] animated:YES completion:nil];
            
        }else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"注册失败,请重新注册" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
        }

    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"验证码请求时失败返回的数据--------%@",error);
    } WithShowHudToView:self.view];
    
}
#pragma mark 获取用户信息
-(void)GetUserInfoRequset:(NSDictionary *)userInfoDic{
    
}
/**
 返回登录（返回上一页面）
 */
- (void)gotobackLoginClick{
    CZHLog(@"%s",__func__);
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 点击获取验证码按钮：验证手机号是否填写正确
 */
-(void)sendCode{
    CZHLog(@"点击了获取验证码按钮----");
    if (self.phoneNum.text.length==0) {
        //通过第三方创建菊花//提示框
        [Czh_WarnWindow HUD:self.view andWarnText:@"请输入手机号码" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    }else{
        //正则判断手机号码
        if ([Czh_RegularVerification isMobileNumber:self.phoneNum.text]) {
            //验证码请求
            [self performSelector:@selector(countClick) withObject:nil];
        }else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"请输入正确手机号码" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
        }
    }
}

/**
 手机号填写正确后，进去请求获取验证码
 */
-(void)countClick{
#pragma mark
    self.yzNum.rBtn.enabled =NO;
    _count = 60;
    [self.yzNum.rBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    /**
     *点击获取验证码的数据请求
     */
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //注册为1，登录2，修改密码3
    NSInteger typeCount = 1;
    NSString *countNstring = [NSString stringWithFormat:@"%ld",(long)typeCount];
    [params setObject:self.phoneNum.text forKey:@"phone"];
    [params setObject:countNstring forKey:@"type"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_SendVerificationCode];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        CZHLog(@"验证码请求时成功返回的数据--------%@",data);
        [Czh_WarnWindow HUD:self.view andWarnText:@"已发送短信到您的手机" andXoffset:0 andYoffset:Main_Screen_Width/5*2];
        self.codeStr = data[@"data"];
        self.yzNum.text = self.codeStr;
    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"验证码请求时失败返回的数据--------%@",error);
    } WithShowHudToView:self.view];
    
}

-(void)timerFired:(NSTimer *)timer{
    if (_count !=1) {
        _count -=1;
        [self.yzNum.rBtn setTitle:[NSString stringWithFormat:@"等待 %d 秒",_count] forState:UIControlStateDisabled];
        _phoneNum.enabled = false;
    }else{
        [timer invalidate];
        self.yzNum.rBtn.enabled = YES;
        [self.yzNum.rBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        _phoneNum.enabled = true;
    }
}

-(void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)accpetBtnClick{
    CZHLog(@"点击同意按钮");
}
@end
     
