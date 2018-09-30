//
//  ZHGForgotPwVC.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/29.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGForgotPwVC.h"
#import "ZHGLoginTextField.h"
#import "ZHGLoginBtn.h"

@interface ZHGForgotPwVC ()

//滚动视图
@property (nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
@property (nonatomic,strong) ZHGLoginTextField *phonetextField;
@property (nonatomic,strong) ZHGLoginTextField *yzNumtextField;
@property (nonatomic,strong) ZHGLoginTextField *pdNumtextField;
@property (nonatomic,strong) ZHGLoginTextField *pdNumtextField2;
@property (nonatomic,strong) ZHGLoginBtn *fpdloginBtn;
@property (nonatomic,assign) int count;
@property (nonatomic,strong) ZHGpromptLabel *label;

@end

@implementation ZHGForgotPwVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"找回密码";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupView];
    [self yzmBtnClick];
}

-(void)setupView{
    TPKeyboardAvoidingScrollView * contentScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    [self.view addSubview:contentScrollView];
    _contentScrollView.bounces = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView = contentScrollView;
    
    //手机号
    ZHGLoginTextField *phonetextField = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,40, Main_Screen_Width - 40, 44) placeHolder:@"请输入昵称" boolLeftView:NO rightTitle:nil];
    [self.contentScrollView addSubview:phonetextField];
    _phonetextField = phonetextField;
    
    //验证码
    ZHGLoginTextField *yzNumtextField = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.phonetextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入验证码" boolLeftView:YES rightTitle:@"获取验证码"];
    yzNumtextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:yzNumtextField];
    _yzNumtextField = yzNumtextField;
    
    //密码
    ZHGLoginTextField *pdNumtextField = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.yzNumtextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入新密码" boolLeftView:NO rightTitle:nil];
    pdNumtextField.secureTextEntry = YES;
    [self.contentScrollView addSubview:pdNumtextField];
    _pdNumtextField = pdNumtextField;
    
    //再次输入密码
    ZHGLoginTextField *pdNumtextField2 = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.pdNumtextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请再次输入密码" boolLeftView:NO rightTitle:nil];
    pdNumtextField2.secureTextEntry = YES;
    [self.contentScrollView addSubview:pdNumtextField2];
    _pdNumtextField2 = pdNumtextField2;
    
    ZHGpromptLabel *label = [[ZHGpromptLabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.pdNumtextField2.frame) + 25, Main_Screen_Width - 40, 25) labelText:@"验证码错误, 请重新输入"];
    [self.contentScrollView addSubview:label];
    _label = label;
    
    //注册按钮
    ZHGLoginBtn *fpdloginBtn = [[ZHGLoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(label.frame) + 25, Main_Screen_Width - 40, 44)];
    [fpdloginBtn setTitle:@"登    录" forState:UIControlStateNormal];
    fpdloginBtn.backgroundColor = MAIN_COLOR;
    [self.contentScrollView addSubview:fpdloginBtn];
    _fpdloginBtn = fpdloginBtn;
    [self.fpdloginBtn addTarget:self action:@selector(fpdloginBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)fpdloginBtnClick{
    CZHLog(@"忘记密码界面，登录按钮点击！----");
}

- (void)yzmBtnClick{
    __block ZHGForgotPwVC *blockSelf = self;
    [self.yzNumtextField.rBtn setClickBlock:^(UIButton *button) {
        // 需要执行的操作
        [blockSelf sendCode];
    } andEvent:UIControlEventTouchUpInside];
}

-(void)sendCode
{
    
    NSString *msg = nil;
    if ([self.phonetextField.text isEqualToString:@""]||(self.phonetextField.text==NULL)) {
        msg =@"手机号码不能为空";
    }
    if (msg.length !=0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
        [alert show];
        return;
    }
    [self performSelector:@selector(countClick) withObject:nil];
}
-(void)countClick
{
    self.yzNumtextField.rBtn.enabled =NO;
    _count = 60;
    [self.yzNumtextField.rBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}
-(void)timerFired:(NSTimer *)timer
{
    if (_count !=1) {
        _count -=1;
        [self.yzNumtextField.rBtn setTitle:[NSString stringWithFormat:@"等待 %ld 秒",_count] forState:UIControlStateDisabled];
        self.phonetextField.enabled = false;
    }else{
        [timer invalidate];
        self.yzNumtextField.rBtn.enabled = YES;
        [self.yzNumtextField.rBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.phonetextField.enabled = true;
    }
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
