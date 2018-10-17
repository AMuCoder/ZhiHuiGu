//  文件名: Czh_RechargePsdVC.m
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_RechargePsdVC.h"

@interface Czh_RechargePsdVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation Czh_RechargePsdVC
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
    // Do any additional setup after loading the view.
    self.title = @"重置登录密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        return 20;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else{
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierID = @"cell_Czh_RechargePsdVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifierID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    if (indexPath.section == 0) {
        cell.textLabel.text = @"原登录密码";
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"新登录密码";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"再次输入密码";
        }
    }
    return cell;
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
