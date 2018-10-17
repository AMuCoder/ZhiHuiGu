//  文件名: Czh_AboutUsVC.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_AboutUsVC.h"

@interface Czh_AboutUsVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIImageView *logo;

@end

@implementation Czh_AboutUsVC
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
    self.title = @"关于我们";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self setUpView];
}

- (void)setUpView {
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource , UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, 200)];
    
    _logo = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.CZH_width/2-40, 10, 80, 80)];
    _logo.layer.cornerRadius = 40;
    _logo.backgroundColor = [UIColor grayColor];
    _logo.image = [UIImage imageNamed:@"xx"];
    [headView addSubview:_logo];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_logo.frame) + 10, self.view.CZH_width-40, 20)];
    name.text = @"智慧谷";
    name.textColor = [UIColor blackColor];
    name.font = [UIFont systemFontOfSize:14];
    name.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:name];
    
    UILabel *version = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(name.frame) + 10, self.view.CZH_width-40, 20)];
    version.text = @"V1.0.0";
    version.textColor = [UIColor blackColor];
    version.font = [UIFont systemFontOfSize:14];
    version.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:version];
    if (section == 0) {
        return headView;
    }else
        return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 150;
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
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierID = @"cell_AccountManagementVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifierID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    if (indexPath.section == 0) {
            cell.textLabel.text = @"给我们评分";
    }else{
        if (indexPath.row == 0) {
            cell.textLabel.text = @"版本介绍";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"版本日志";
        }else if (indexPath.row == 2){
            //手机号码
//            cell.detailTextLabel.text = @"18800004396";
            cell.textLabel.text = @"版本更新";
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
