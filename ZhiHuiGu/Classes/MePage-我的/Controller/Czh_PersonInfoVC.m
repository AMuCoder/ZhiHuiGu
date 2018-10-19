//  文件名: Czh_PersonInfoVC.m
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_PersonInfoVC.h"
#import "Czh_KYCCertificationVC.h"
#import "Czh_KYCCertVC.h"
#import "Czh_IconCell.h"
#import "Czh_NameCell.h"
@interface Czh_PersonInfoVC ()<UITableViewDataSource, UITableViewDelegate,UITextViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation Czh_PersonInfoVC
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
    self.title = @"个人信息";
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [self.view addSubview:self.tableView];
}
-(void)saveBtnClick{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *idStr = [userDefaults objectForKey:kUserIDKey];
    NSInteger intString = [idStr intValue];
    // 1.URL
    NSURL *url = [NSURL URLWithString:@"http://119.23.206.144:8000/v1/user/edit"];///v1/user/edit用户信息编辑保存
    // 2.请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3.请求方法
    request.HTTPMethod = @"POST";
    // 4.设置请求体（请求参数）
    // 创建一个描述订单信息的JSON数据
    NSDictionary *orderInfo = @{
//                                @"cert_num" : self.IDNum.text,
//                                @"cert_type" : @1,
//                                @"gender" : self.maleorfemale,
//                                @"name" : self.userName.text,
//                                @"photo_back" : self.reverseImageStr,
//                                @"photo_front" : self.positeImageStr,
//                                @"user_id" : @(intString)
                                };
    //把字典转换为可以传输的NSData类型
    NSData *json = [NSJSONSerialization dataWithJSONObject:orderInfo options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = json;
    // 5.设置请求头：这次请求体的数据不再是普通的参数，而是一个JSON数据
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // 6.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data == nil || connectionError) return;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSString *error = dict[@"error"];
        if (error) {
            CZHLog(@"-------");
        } else {
            NSString *success = dict[@"success"];
            CZHLog(@"-------%@",dict);
        }
    }];
}
#pragma mark - UITableViewDataSource , UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 30;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 100;
        }
    }
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    else{
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierID = @"cell_PersonInfoVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifierID];
    }
    
#pragma mark  --  处理逻辑
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:kUserNameKey];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Czh_IconCell *cell = [Czh_IconCell cellWithTableView:tableView];
            return cell;
        }else if (indexPath.row == 1){
            Czh_NameCell *cell = [Czh_NameCell cellWithTableView:tableView];
            cell.leftLabel.text = @"用户名";
            cell.textField.placeholder = @"请输入用户名";
            return cell;
        }else if (indexPath.row == 2){
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
            cell.detailTextLabel.text = @"男";
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.text = @"性别";
        }
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"KYC认证";
            cell.detailTextLabel.text = @"已认证";
            cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
            
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"我的地址";
            cell.detailTextLabel.text = @"qqqqqqrrrrrrrrrr";
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            //            [self.navigationController pushViewController:[Czh_RechargePsdVC new] animated:YES];
        }else if (indexPath.row == 1) {
            //            [self.navigationController pushViewController:[Czh_RechargePayPwdVC new] animated:YES];
        }else if (indexPath.row == 2) {
            //            [self.navigationController pushViewController:[Czh_RechargeTelVC new] animated:YES];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[Czh_KYCCertVC new] animated:YES];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//内容将要发生改变编辑
-(BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
