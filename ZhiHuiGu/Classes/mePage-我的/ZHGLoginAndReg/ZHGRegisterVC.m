//
//  ZHGRegisterVC.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/28.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGRegisterVC.h"
#import "ZHGLoginTextField.h"
#import "ZHGLoginBtn.h"

@interface ZHGRegisterVC ()
//滚动视图
@property(nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
@property(nonatomic,strong) ZHGLoginTextField *nametextField;
@property(nonatomic,strong) ZHGLoginTextField *phoneNum;
@property(nonatomic,strong) ZHGLoginTextField *yzNum;
@property(nonatomic,strong) ZHGLoginTextField *pdNum;
@property(nonatomic,strong) UIButton *checkBox;
@property(nonatomic,strong) ZHGLoginBtn *regBtn;
@property(nonatomic,strong) ZHGLoginBtn *backLoginBtn;
@property(nonatomic,assign) int count;



@end

@implementation ZHGRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupView];
}
-(void)setupView{
    TPKeyboardAvoidingScrollView * contentScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    [self.view addSubview:contentScrollView];
    _contentScrollView.bounces = NO;
    _contentScrollView.showsVerticalScrollIndicator = NO;
    _contentScrollView = contentScrollView;
    
    //用户名
    ZHGLoginTextField *nametextField = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,40, Main_Screen_Width - 40, 44) placeHolder:@"请输入昵称" boolLeftView:NO rightTitle:nil];
    [self.contentScrollView addSubview:nametextField];
    _nametextField = nametextField;
    
    //手机号
    ZHGLoginTextField *phoneNum = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.nametextField.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入手机号" boolLeftView:NO rightTitle:nil];
    phoneNum.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:phoneNum];
    _phoneNum = phoneNum;
    
    //验证码
    ZHGLoginTextField *yzNum = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.phoneNum.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请输入验证码" boolLeftView:YES rightTitle:@"获取验证码"];
    yzNum.keyboardType = UIKeyboardTypeNumberPad;
    [self.contentScrollView addSubview:yzNum];
    _yzNum = yzNum;
    
    //密码
    ZHGLoginTextField *pdNum = [[ZHGLoginTextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(self.yzNum.frame) + 25, Main_Screen_Width - 40, 44) placeHolder:@"请设置密码" boolLeftView:NO rightTitle:nil];
    pdNum.secureTextEntry = YES;
    [self.contentScrollView addSubview:pdNum];
    _pdNum = pdNum;
    
    //阅读协议
    UIButton *checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.frame = CGRectMake(20,CGRectGetMaxY(self.pdNum.frame) + 25, 20, 20);
    self.checkBox = checkBox;
//    [checkBox setImage:[UIImage imageNamed:@"ic_unselected"] forState:UIControlStateNormal];
//    [checkBox setImage:[UIImage imageNamed:@"ic_selected"] forState:UIControlStateSelected];
    [checkBox setBackgroundColor:[UIColor orangeColor]];
    [checkBox addTarget:self action:@selector(didClickCheckBox) forControlEvents:UIControlEventTouchUpInside];
    [_contentScrollView addSubview:checkBox];
    //同意”免责声明及风险披露“
    UIButton *accpetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    accpetBtn.frame = CGRectMake(CGRectGetMaxX(self.checkBox.frame)+ 10, CGRectGetMaxY(self.pdNum.frame) + 25, self.view.frame.size.width - CGRectGetMaxX(self.checkBox.frame) - 20, 20);
    accpetBtn.backgroundColor = [UIColor greenColor];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"同意”免责声明及风险披露“"];
    NSRange allRange = {0,[str length]};
    NSDictionary *attrs = [NSDictionary dictionary];
    attrs = @{
              NSForegroundColorAttributeName:[UIColor orangeColor],
              NSFontAttributeName:[UIFont systemFontOfSize:15]
              };
    [str addAttributes:attrs range:allRange];
    //同意后按钮
    [accpetBtn setAttributedTitle:str forState:UIControlStateNormal];
    [accpetBtn sizeToFit];
    [_contentScrollView addSubview:accpetBtn];
    
    //注册按钮
    ZHGLoginBtn *regBtn = [[ZHGLoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(accpetBtn.frame) + 25, Main_Screen_Width - 40, 44)];
    [regBtn setTitle:@"注  册" forState:UIControlStateNormal];
    regBtn.backgroundColor = MAIN_COLOR;
    [self.contentScrollView addSubview:regBtn];
    _regBtn = regBtn;
    [self.regBtn addTarget:self action:@selector(regBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //返回登录
    ZHGLoginBtn *backLoginBtn = [[ZHGLoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(_regBtn.frame) + 25, Main_Screen_Width - 40, 44)];
    [backLoginBtn setTitle:@"已有账号, 去登录" forState:UIControlStateNormal];
    backLoginBtn.backgroundColor = [UIColor darkGrayColor];
    [self.contentScrollView addSubview:backLoginBtn];
    _backLoginBtn = backLoginBtn;
    [self.backLoginBtn addTarget:self action:@selector(backLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    __block ZHGRegisterVC *blockSelf = self;
    [self.yzNum.rBtn setClickBlock:^(UIButton *button) {
            // 需要执行的操作
        [blockSelf sendCode];
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
//获取验证码

- (void)regBtnClick{
    CZHLog(@"%s",__func__);
}
- (void)backLoginBtnClick{
    CZHLog(@"%s",__func__);
}
-(void)sendCode
{
    
    NSString *msg = nil;
    if ([_phoneNum.text isEqualToString:@""]||(_phoneNum.text==NULL)) {
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
    self.yzNum.rBtn.enabled =NO;
    _count = 60;
    [self.yzNum.rBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}
-(void)timerFired:(NSTimer *)timer
{
    if (_count !=1) {
        _count -=1;
        [self.yzNum.rBtn setTitle:[NSString stringWithFormat:@"等待 %ld 秒",_count] forState:UIControlStateDisabled];
        _phoneNum.enabled = false;
    }else{
        [timer invalidate];
        self.yzNum.rBtn.enabled = YES;
        [self.yzNum.rBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _phoneNum.enabled = true;
    }
}

@end
