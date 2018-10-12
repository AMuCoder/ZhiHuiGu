//  文件名: Czh_LoginedVC.m
//  创建者: 阿木 时间: 2018/9/30.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：已登录界面

#import "Czh_LoginedVC.h"
#import "Czh_LoginTextField.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "Czh_LoginBtn.h"
#import "Czh_SMSOrPsdBtn.h"
#import "Czh_ForgotPwVC.h"
#import "Czh_RegisterVC.h"
#import "Czh_CreateWalletVC.h"
#import "RTNavigationBar.h"

@interface Czh_LoginedVC ()
{
    NSInteger _COUNTN;
}
//滚动视图
@property(nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
@property(nonatomic,strong) UIImageView *iconImageView;
@property(nonatomic,strong) Czh_promptLabel *userNameLabel;
@property(nonatomic,strong) Czh_LoginTextField *smsorpsdtextField;
@property(nonatomic,strong) Czh_LoginBtn *loginBtn;
@property(nonatomic,strong) Czh_SMSOrPsdBtn *smsorpsdBtn;
@property(nonatomic,assign) int count;
@end

@implementation Czh_LoginedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _COUNTN = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupView];
    [self addRightBtn];
}
-(void)addRightBtn{
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedrightBarbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}
-(void)onClickedrightBarbtn{
    CZHLog(@"-----点击了导航栏右边按钮%s",__func__);
    
    UIAlertController *alertvc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取 消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        CZHLog(@"--------取 消！");
    }];
    UIAlertAction *replaceAcount = [UIAlertAction actionWithTitle:@"切换账户" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        CZHLog(@"--------切换账户！");
        [self presentViewController:[Czh_CreateWalletVC new] animated:YES completion:nil];
    }];
    UIAlertAction *registerAcount = [UIAlertAction actionWithTitle:@"注册新用户" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        CZHLog(@"--------注册新用户！");
        [self presentViewController:[Czh_RegisterVC new] animated:YES completion:nil];
    }];
    [alertvc addAction:cancle];
    [alertvc addAction:replaceAcount];
    [alertvc addAction:registerAcount];
    [cancle setValue:[UIColor redColor] forKey:@"titleTextColor"];
    [self presentViewController:alertvc animated:YES completion:nil];
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
    Czh_promptLabel *userNameLabel = [[Czh_promptLabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.iconImageView.frame) + 20, Main_Screen_Width - 40, 44) labelText:@"阿木,欢迎回来"];
    userNameLabel.font = [UIFont systemFontOfSize:22.0f];
    [self.contentScrollView addSubview:userNameLabel];
    _userNameLabel = userNameLabel;
    
    //密码登录or验证码登录
    Czh_LoginTextField *smsorpsdtextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameLabel.frame) + 30, Main_Screen_Width - 40, 44) placeHolder:@"请输入密码" boolLeftView:YES rightTitle:@"忘记密码"];
    [self.contentScrollView addSubview:smsorpsdtextField];
    _smsorpsdtextField = smsorpsdtextField;
    
    //登录按钮
    Czh_LoginBtn *loginBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.smsorpsdtextField.frame) + 30, Main_Screen_Width - 40, 44)];
    [loginBtn setTitle:@"登        录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = MAIN_COLOR;
    [self.contentScrollView addSubview:loginBtn];
    _loginBtn = loginBtn;
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //用户密码 -- 手机验证码切换按钮
    Czh_SMSOrPsdBtn *smsorpsdBtn = [[Czh_SMSOrPsdBtn alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.loginBtn.frame) + 20, Main_Screen_Width - 40, 40) title:@"短信验证码登录"];
    [smsorpsdBtn addTarget:self action:@selector(smsorpsdBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    smsorpsdBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.contentScrollView addSubview:smsorpsdBtn];
    _smsorpsdBtn = smsorpsdBtn;
    
    __weak __typeof(self)weakSelf = self;
    [self.smsorpsdtextField.rBtn setClickBlock:^(UIButton *button) {
        Czh_ForgotPwVC * vc = [[Czh_ForgotPwVC alloc] init];
        [weakSelf presentViewController:vc animated:false completion:nil];
        // 需要执行的操作
    } andEvent:UIControlEventTouchUpInside];
}
-(void)loginBtnClick{
    
    if (self.smsorpsdtextField.text.length==0) {
        if (_COUNTN == 0) {
            [Czh_WarnWindow HUD:self.view andWarnText:@"请输入密码" andXoffset:0 andYoffset:Main_Screen_Width/2];
        }else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"请输入验证码" andXoffset:0 andYoffset:Main_Screen_Width/2];
        }
    }else{
        //处理数据
    }
    CZHLog(@"已登录界面登录按钮点击-------回调成功！");
}

//用户密码 -- 手机验证码切换按钮 -- Click
- (void)smsorpsdBtnClick:(UIButton *)sender
{

    __weak __typeof(self)weakSelf = self;
    if ([sender.titleLabel.text isEqualToString:@"短信验证码登录"]) {
        _COUNTN = 1;
        [self.smsorpsdtextField removeFromSuperview];
        [self.smsorpsdBtn setTitle:@"账户密码登录" forState:UIControlStateNormal];
        CZHLog(@"处理什么？");
        self.smsorpsdtextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameLabel.frame) + 30, Main_Screen_Width - 40, 44) placeHolder:@"请输入验证码" boolLeftView:YES rightTitle:@"获取验证码"];
        [self.contentScrollView addSubview:self.smsorpsdtextField];
#pragma mark -- 按钮回调
        [self.smsorpsdtextField.rBtn setClickBlock:^(UIButton *button) {
            [weakSelf sendCode];
        } andEvent:UIControlEventTouchUpInside];
    }
    else{
        _COUNTN = 0;
        [self.smsorpsdBtn setTitle:@"短信验证码登录" forState:UIControlStateNormal];
        CZHLog(@"又处理什么？");
        [self.smsorpsdtextField removeFromSuperview];
        self.smsorpsdtextField = [[Czh_LoginTextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.userNameLabel.frame) + 30, Main_Screen_Width - 40, 44) placeHolder:@"请输入密码" boolLeftView:YES rightTitle:@"忘记密码"];
        [self.contentScrollView addSubview:self.smsorpsdtextField];
        [self.smsorpsdtextField.rBtn setClickBlock:^(UIButton *button) {
            CZHLog(@"--------回调成功！");
            Czh_ForgotPwVC * vc = [[Czh_ForgotPwVC alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:true];
            // 需要执行的操作
        } andEvent:UIControlEventTouchUpInside];
    }
    CZHLog(@"_COUNTN-------%ld",_COUNTN);
}

-(void)sendCode{
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
        [self.smsorpsdtextField.rBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    }
}




@end
