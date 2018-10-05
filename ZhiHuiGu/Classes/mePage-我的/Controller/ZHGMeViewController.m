//
//  ZHGMeViewController.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/20.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "ZHGMeViewController.h"
#import "ZHGMeUserView.h"
#import "ZHGLoginAndRegisterVC.h"
#import "ZHGLoginedVC.h"

@interface ZHGMeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableview;
@property (nonatomic , strong) ZHGMeUserView *userView;
@end

@implementation ZHGMeViewController

- (UITableView *)tableview {
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
    // 去掉多余的cell
    self.tableview.tableFooterView = [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifierID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"用户注册与登录";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"登录";
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行", indexPath.row];
    }
    return cell;
}

#pragma mark - UITableViewDataSource , UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.f;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[NSClassFromString(@"ZHGLoginAndRegisterVC") new] animated:YES];
    }else if (indexPath.row == 1){
        [self.navigationController pushViewController:[ZHGLoginedVC new] animated:YES];
    }else if (indexPath.row == 1){
    }
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
