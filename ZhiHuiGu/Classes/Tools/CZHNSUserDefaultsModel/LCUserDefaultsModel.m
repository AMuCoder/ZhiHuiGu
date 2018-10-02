//
//  LCUserDefaultsModel.m
//  NSUserDefaultsModel
//
//  Created by 刘冲 on 2018/7/19.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCUserDefaultsModel.h"
@implementation LCUserDefaultsModel

@dynamic name;
@dynamic gender;
@dynamic age;
@dynamic floatNumber;
@dynamic doubleNumber;
@dynamic isMan;

#pragma mark - Init

- (NSDictionary *)setupDefaultValues {
    return @{@"name": @"lc",
             @"gender": @1,
             @"age": @20,
             @"floatNumber": @11.1,
             @"doubleNumber": @22.2,
             @"isMan": @YES,
             };
}

@end
/**
 以“name”来说，如果想要进行取值的话只需要调用[LCUserDefaultsModel userDefaultsModel].name就行，对"name"进行更改并保存到plist文件的话只需要调用[LCUserDefaultsModel userDefaultsModel].name = @"newName"就可以了。
 
 // Init
 LCUserDefaultsModel *userDefaultsModel = [LCUserDefaultsModel userDefaultsModel];
 
 NSLog(@"name = %@", userDefaultsModel.name);
 userDefaultsModel.name = @"Near1sssss";
 NSLog(@"gender = %ld", (long)userDefaultsModel.gender);
 userDefaultsModel.gender += 1;
 NSLog(@"age = %ld", userDefaultsModel.age);
 userDefaultsModel.age += 1;
 NSLog(@"floatNumber = %f", userDefaultsModel.floatNumber);
 userDefaultsModel.floatNumber += 1;
 NSLog(@"doubleNumber = %f", userDefaultsModel.doubleNumber);
 userDefaultsModel.doubleNumber += 1;
 NSLog(@"isMan = %d", userDefaultsModel.isMan);
 userDefaultsModel.isMan = !userDefaultsModel.isMan;
 
 
 #define AccountKey @"account"
 #define PwdKey @"pwd"
 #define RmbPwdKey @"rmb_pwd"
 #define AutoLoginKey @"auto_login"
 
 @property (weak, nonatomic) UITextField *accountField;
 @property (weak, nonatomic) UITextField *pwdField;
 @property (weak, nonatomic) UISwitch *rmbPwdSwitch;
 @property (weak, nonatomic) UISwitch *autoLoginSwitch;
 
 自动登录: 在viewDidLoad里读取上一次登录的信息
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 
 //读取上次的配置(记住密码、自动登录)
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 self.accountField.text = [defaults objectForKey:AccountKey];
 self.rmbPwdSwitch.on = [[defaults objectForKey:RmbPwdKey] boolValue];
 self.autoLoginSwitch.on = [[defaults objectForKey:AutoLoginKey] boolValue];
 //处理密码
 if (self.rmbPwdSwitch.isOn) {
 self.pwdField.text = [defaults objectForKey:PwdKey];
 }
 //处理自动登录的情况
 if (self.autoLoginSwitch.isOn) {
 [self login]; // 点击了『登录』按钮
 }
 }
 
 点击记住密码按钮时存储用户信息
 -(IBAction)login {
 
 if (![self.accountField.text isEqualToString:@"admin"]) {
 //帐号不存在
 [MBProgressHUD showError:@"帐户不存在"];
 return;
 }
 if (![self.pwdField.text isEqualToString:@"123"]) {
 //帐号不存在
 [MBProgressHUD showError:@"密码错误"];
 return;
 }
 //显示一个蒙版
 [MBProgressHUD showMessage:@"正在登录中..."];
 
 //发送网络请求
 
 //隐藏蒙版
 [MBProgressHUD hideHUD];
 
 //验证成功，跳转到下一个控制器
 [self performSegueWithIdentifier:@"contacts" sender:self];
 
 //存储数据
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 [defaults setObject:self.accountField.text forKey:AccountKey];
 [defaults setObject:self.pwdField.text forKey:PwdKey];
 [defaults setObject:[NSNumber numberWithBool:self.rmbPwdSwitch.isOn] forKey:RmbPwdKey];
 [defaults setObject:[NSNumber numberWithBool:self.autoLoginSwitch.isOn]  forKey:AutoLoginKey];
 [defaults synchronize];
 }
 
 
 
 */
