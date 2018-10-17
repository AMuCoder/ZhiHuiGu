//  文件名: Czh_trustVC.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：信任资产，开关选择器

#import "Czh_trustVC.h"
#import "Czh_MineAssetsCell.h"

@interface Czh_trustVC ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation Czh_trustVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"我的信任";
    self.title = @"我的信任";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

- (void)setSubViews {
    
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
#pragma mark - UITableViewDataSource , UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, 50)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    label.text = @"我的资产";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:label];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, self.view.CZH_width, 0.5)];
    line.backgroundColor = [UIColor blackColor];
    [headerView addSubview:line];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Czh_MineAssetsCell *cell = [Czh_MineAssetsCell cellWithTableView:tableView];
    return cell;
}

@end
