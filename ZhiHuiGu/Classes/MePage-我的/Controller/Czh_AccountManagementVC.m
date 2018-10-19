//  文件名: Czh_AccountManagementVC.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：账号管理

#import "Czh_AccountManagementVC.h"
#import "Czh_RechargePsdVC.h"
#import "Czh_RechargePayPwdVC.h"
#import "Czh_RechargeTelVC.h"

@interface Czh_AccountManagementVC ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation Czh_AccountManagementVC
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号管理";
    
    
    [self.view addSubview:self.tableView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
#pragma mark - UITableViewDataSource , UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else{
        return 30;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierID = @"cell_AccountManagementVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifierID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userTel = [userDefaults objectForKey:kUserTelKey];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改登录密码";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"修改交易密码";
        }else if (indexPath.row == 2){
            //手机号码
            cell.detailTextLabel.text = userTel;
            cell.textLabel.text = @"修改手机号";
        }
    }else{
        if (indexPath.row == 0) {
            cell.textLabel.text = @"多语言";
            cell.detailTextLabel.text = @"简体中文";
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[Czh_RechargePsdVC new] animated:YES];
        }else if (indexPath.row == 1) {
            [self.navigationController pushViewController:[Czh_RechargePayPwdVC new] animated:YES];
        }else if (indexPath.row == 2) {
            [self.navigationController pushViewController:[Czh_RechargeTelVC new] animated:YES];
        }
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
