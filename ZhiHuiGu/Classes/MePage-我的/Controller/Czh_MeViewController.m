//
//  Czh_MeViewController.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/20.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_MeViewController.h"
#import "Czh_MeUserView.h"
#import "Czh_LoginAndRegisterVC.h"
#import "Czh_LoginedVC.h"
#import "Czh_RememberParticalVC.h"
#import "Czh_ImportWalletVC.h"
#import "Czh_UserInfoView.h"
#import "Czh_OrderView.h"
#import "Czh_WoWalletVC.h"
#import "Czh_AccountManagementVC.h"
#import "Czh_UserAgreementVC.h"
#import "Czh_HelpCenterVC.h"
#import "Czh_AboutUsVC.h"
#import "Czh_PersonInfoVC.h"

@interface Czh_MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableview;
@property (nonatomic , strong) Czh_MeUserView *userView;
@property(nonatomic,strong) Czh_UserInfoView *userInfoView;
@property(nonatomic,strong) Czh_OrderView *orderView;

@end

@implementation Czh_MeViewController

- (UITableView *)tableview {
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, self.view.CZH_width, self.view.CZH_height-90-(100+(self.view.CZH_width-60)/5))];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    NSString *homePath = NSHomeDirectory();
    NSString *docPath = [homePath stringByAppendingPathComponent:@"Documents"];
    CZHLog(@"----%@",docPath);
    
    [self.view addSubview:self.tableview];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:kUserNameKey];
    // 去掉多余的cell
    self.tableview.tableFooterView = [UIView new];
    Czh_UserInfoView *userInfoView = [[Czh_UserInfoView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, 90) IconImage:@"xxx" userName:userName Zongzichan:@"1000" ZichanStyle:@"CNY" WECNum:@"1000" MessageBtnImage:@"xxx" MessageBtnHightImage:@"xxx" NextBtnImage:@"xxx" NextBtnHightImage:@"xxx"];
    [self.view addSubview:userInfoView];
    _userInfoView = userInfoView;
    [_userInfoView.iconImage addTarget:self action:@selector(personInfoClick) forControlEvents:UIControlEventTouchUpInside];
    
    Czh_OrderView *orderView = [[Czh_OrderView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, 80+(self.view.CZH_width-60)/5) PaymentBtn:@" " SendBtn:@" " GoodsBtn:@" " EvaluateBtn:@" " RefundBtn:@" "];
    _orderView = orderView;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return _orderView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100+(self.view.CZH_width-60)/5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifierID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的钱包";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"账户安全与设置";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"用户协议";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"帮助中心";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"关于我们";
    }
    return cell;
}

#pragma mark - UITableViewDataSource , UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[NSClassFromString(@"Czh_WoWalletVC") new] animated:YES];
    }else if (indexPath.row == 1){
        [self.navigationController pushViewController:[Czh_AccountManagementVC new] animated:YES];
    }else if (indexPath.row == 2){
        [self.navigationController pushViewController:[Czh_UserAgreementVC new] animated:YES];
    }else if (indexPath.row == 3){
        [self.navigationController pushViewController:[Czh_HelpCenterVC new] animated:YES];
    }else if (indexPath.row == 4){
        [self.navigationController pushViewController:[Czh_AboutUsVC new] animated:YES];
    }
}
-(void)personInfoClick{
    [self.navigationController pushViewController:[Czh_PersonInfoVC new] animated:YES];
}

@end
