//  文件名: Czh_RechargePsdVC.m
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_RechargePsdVC.h"
#import "Czh_LoginBtn.h"
#import "Czh_RechargeField.h"

@interface Czh_RechargePsdVC ()
@property(nonatomic,strong) Czh_RechargeField *oldPsd;
@property(nonatomic,strong) Czh_RechargeField *psdNew;
@property(nonatomic,strong) Czh_RechargeField *psdNewToo;
@property(nonatomic,strong) Czh_LoginBtn *sureBtn;

@end

@implementation Czh_RechargePsdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"重置登录密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setViews];
}
-(void)setViews{
    Czh_RechargeField *oldPsd = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, 0, self.view.CZH_width-20, 50) LeftLabel:@"原登录密码: " Placeholder:@"请输入当前登录密码"];
    [self.view addSubview:oldPsd];
    _oldPsd = oldPsd;
    
    UIView *lines = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_oldPsd.frame), self.view.CZH_width, 20)];
    lines.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:lines];
    
    Czh_RechargeField *psdNew = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lines.frame), self.view.CZH_width-20, 50) LeftLabel:@"新登录密码: " Placeholder:@"请输入新登录密码"];
    [self.view addSubview:psdNew];
    _psdNew = psdNew;
    
    UIView *lineOne = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_psdNew.frame), self.view.CZH_width, 0.5)];
    lineOne.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lineOne];
    
    Czh_RechargeField *psdNewToo = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lineOne.frame), self.view.CZH_width-20, 50) LeftLabel:@"再次输入密码: " Placeholder:@"请再次输入新登录密码"];
    [self.view addSubview:psdNewToo];
    _psdNewToo = psdNewToo;
    
    UIView *lineTwo = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_psdNewToo.frame), self.view.CZH_width, 0.5)];
    lineTwo.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lineTwo];
    
    //注册按钮
    Czh_LoginBtn *sureBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,self.view.CZH_height - 120, Main_Screen_Width - 40, 44)];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    sureBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:sureBtn];
    _sureBtn = sureBtn;
    [self.sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)sureBtnClick{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    /**旧密码
     else if (![self.oldPsd.text isEqual:pwdNum]) {
     [Czh_WarnWindow HUD:self.view andWarnText:@"旧密码输入错误" andXoffset:0 andYoffset:Main_Screen_Width/2];
     }
     */
    NSString *pwdNum = [userDefaults objectForKey:kUserPwdKey];
    CZHLog(@"%s--旧密码：%@",__func__,pwdNum);
    if (self.psdNew.text.length == 0 || self.oldPsd.text.length == 0 || self.psdNewToo.text.length == 0){
        [Czh_WarnWindow HUD:self.view andWarnText:@"密码不能为空" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else if (![self.psdNew.text isEqual:self.psdNewToo.text]){
        [Czh_WarnWindow HUD:self.view andWarnText:@"新密码输入不一致" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else if (self.psdNew.text.length < 6){
        [Czh_WarnWindow HUD:self.view andWarnText:@"新密码必须6位数以上" andXoffset:0 andYoffset:Main_Screen_Width/2];
    }else{
        [self sureBtnClickNext];
    }
}
-(void)sureBtnClickNext{
    CZHLog(@"%s",__func__);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *IDNum = [userDefaults objectForKey:kUserIDKey];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:self.oldPsd.text forKey:@"old_pwd"];
    [params setObject:self.psdNewToo.text forKey:@"pwd"];
    [params setObject:IDNum forKey:@"user_id"];
    CZHLog(@"新密码：%@",self.psdNewToo.text);
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_ChangeUserPwdURL];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        CZHLog(@"验证码请求时成功返回的数据--------%@",data);
        if ([[NSString stringWithFormat:@"%@",data[@"code"]] isEqualToString:@"200"]) {
            [userDefaults setObject:self.psdNewToo.text  forKey:kUserPwdKey];//用户密码
            [userDefaults synchronize];
            [self showAlterView];
        }else if([data[@"message"] isEqualToString:@"旧密码错误"]){
            [self showAlterViewError];
        }
    } WithFailurBlock:^(NSString *error) {
        [Czh_WarnWindow HUD:self.view andWarnText:@"密码修改失败" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    } WithShowHudToView:self.view];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
-(void)showAlterView{
    [CZHAlertView showAlertWithTitle:@"密码修改成功"
                             message:nil
                         cancelTitle:@"知道了"
                          completion:^(BOOL cancelled) {
                              if (cancelled) {
                                  [self.navigationController popViewControllerAnimated:YES];
                              } else {
                                  NSLog(@"Simple Alert View dismissed, but not cancelled");
                              }
                          }];
}
-(void)showAlterViewError{
    [CZHAlertView showAlertWithTitle:@"旧密码错误"
                             message:nil
                         cancelTitle:@"确认"
                          completion:^(BOOL cancelled) {
                              if (cancelled) {
                                  [self.navigationController popViewControllerAnimated:YES];
                              } else {
                                  NSLog(@"Simple Alert View dismissed, but not cancelled");
                              }
                          }];
}
@end
