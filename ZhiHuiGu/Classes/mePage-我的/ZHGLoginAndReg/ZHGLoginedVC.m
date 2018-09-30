//  文件名: ZHGLoginedVC.m
//  创建者: CYJ 时间: 2018/9/30.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：已登录界面

#import "ZHGLoginedVC.h"
#import "ZHGLoginTextField.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "ZHGLoginBtn.h"
#import "ZHGSMSOrPsdBtn.h"
#import "ZHGForgotPwVC.h"

@interface ZHGLoginedVC ()
//滚动视图
@property(nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
@property(nonatomic,strong) UIImageView *iconImageView;
@property(nonatomic,strong) ZHGpromptLabel *userNameLabel;
@property(nonatomic,strong) ZHGLoginTextField *smsorpsdtextField;
@property(nonatomic,strong) ZHGLoginBtn *loginBtn;
@property(nonatomic,strong) ZHGSMSOrPsdBtn *smsorpsdBtn;
@property(nonatomic,assign) int count;


@end

@implementation ZHGLoginedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册 - 登录";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}
-(void)setupView{
    TPKeyboardAvoidingScrollView * contentScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    [self.view addSubview:contentScrollView];
    _contentScrollView.bounces = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView = contentScrollView;
    
    CGFloat iconImageViewW = Main_Screen_Width/3;
    CGFloat iconImageViewH = Main_Screen_Width/3;
    CGFloat iconImageViewX = (Main_Screen_Width - iconImageViewW)/2;
    CGFloat iconImageViewY = 100.f;
    
    //头像
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH)];
    iconImageView.backgroundColor = [UIColor orangeColor];
    [self.contentScrollView addSubview:iconImageView];
    _iconImageView = iconImageView;
    //用户名
    ZHGpromptLabel *userNameLabel = [[ZHGpromptLabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.iconImageView.frame) + 20, Main_Screen_Width - 40, 44) labelText:@"阿木,欢迎回来"];
    userNameLabel.font = [UIFont systemFontOfSize:22.0f];
    [self.contentScrollView addSubview:userNameLabel];
    _userNameLabel = userNameLabel;
    
    //密码登录or验证码登录
    ZHGLoginTextField *smsorpsdtextField = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameLabel.frame) + 30, Main_Screen_Width - 40, 44) placeHolder:@"请输入密码" boolLeftView:YES rightTitle:@"忘记密码"];
    [self.contentScrollView addSubview:smsorpsdtextField];
    _smsorpsdtextField = smsorpsdtextField;
    
    //登录按钮
    ZHGLoginBtn *loginBtn = [[ZHGLoginBtn alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.smsorpsdtextField.frame) + 30, Main_Screen_Width - 40, 44)];
    [loginBtn setTitle:@"登        录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = MAIN_COLOR;
    [self.contentScrollView addSubview:loginBtn];
    _loginBtn = loginBtn;
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //用户密码 -- 手机验证码切换按钮
    ZHGSMSOrPsdBtn *smsorpsdBtn = [[ZHGSMSOrPsdBtn alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.loginBtn.frame) + 20, Main_Screen_Width - 40, 40) title:@"短信验证码登录"];
    [smsorpsdBtn addTarget:self action:@selector(smsorpsdBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    smsorpsdBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.contentScrollView addSubview:smsorpsdBtn];
    _smsorpsdBtn = smsorpsdBtn;
    
    __weak __typeof(self)weakSelf = self;
    [self.smsorpsdtextField.rBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"--------回调成功！");
        ZHGForgotPwVC * vc = [[ZHGForgotPwVC alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:true];
        // 需要执行的操作
    } andEvent:UIControlEventTouchUpInside];
}
-(void)loginBtnClick{
    CZHLog(@"已登录界面登录按钮点击-------回调成功！");
}

//用户密码 -- 手机验证码切换按钮 -- Click
- (void)smsorpsdBtnClick:(UIButton *)sender
{
    __weak __typeof(self)weakSelf = self;
    if ([sender.titleLabel.text isEqualToString:@"短信验证码登录"]) {
        [self.smsorpsdtextField removeFromSuperview];
        [self.smsorpsdBtn setTitle:@"账户密码登录" forState:UIControlStateNormal];
        CZHLog(@"处理什么？");
        self.smsorpsdtextField = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameLabel.frame) + 30, Main_Screen_Width - 40, 44) placeHolder:@"请输入验证码" boolLeftView:YES rightTitle:@"获取验证码"];
        [self.contentScrollView addSubview:self.smsorpsdtextField];
        
        // 需要执行的操作
        [self.smsorpsdtextField.rBtn setClickBlock:^(UIButton *button) {
            [weakSelf sendCode];
        } andEvent:UIControlEventTouchUpInside];
    }
    else{
        [self.smsorpsdBtn setTitle:@"短信验证码登录" forState:UIControlStateNormal];
        CZHLog(@"又处理什么？");
        [self.smsorpsdtextField removeFromSuperview];
        self.smsorpsdtextField = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameLabel.frame) + 30, Main_Screen_Width - 40, 44) placeHolder:@"请输入密码" boolLeftView:YES rightTitle:@"忘记密码"];
        [self.contentScrollView addSubview:self.smsorpsdtextField];
        [self.smsorpsdtextField.rBtn setClickBlock:^(UIButton *button) {
            CZHLog(@"--------回调成功！");
            ZHGForgotPwVC * vc = [[ZHGForgotPwVC alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:true];
            // 需要执行的操作
        } andEvent:UIControlEventTouchUpInside];
    }
}

-(void)sendCode
{
    //这里进行判断
    [self performSelector:@selector(countClick) withObject:nil];
}
-(void)countClick
{
    self.smsorpsdtextField.rBtn.enabled =NO;
    _count = 60;
    [self.smsorpsdtextField.rBtn setTitle:@"等待 60 秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}
-(void)timerFired:(NSTimer *)timer
{
    if (_count !=1) {
        _count -=1;
        [self.smsorpsdtextField.rBtn setTitle:[NSString stringWithFormat:@"等待 %d 秒",_count] forState:UIControlStateDisabled];
    }else{
        [timer invalidate];
        self.smsorpsdtextField.rBtn.enabled = YES;
        [self.smsorpsdtextField.rBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
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
