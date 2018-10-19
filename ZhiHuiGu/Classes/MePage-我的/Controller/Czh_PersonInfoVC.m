//  文件名: Czh_PersonInfoVC.m
//  创建者: CYJ 时间: 2018/10/17.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_PersonInfoVC.h"
#import "Czh_KYCCertificationVC.h"
#import "Czh_KYCCertVC.h"
#import "Czh_IconCell.h"
#import "Czh_NameCell.h"
#import "Czh_UserIconVC.h"
@interface Czh_PersonInfoVC ()<UITableViewDataSource, UITableViewDelegate,UITextViewDelegate,Czh_UserIconDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) Czh_NameCell *mailCell;
@property(nonatomic,strong) UIImage *iconimage;
@property(nonatomic,strong) Czh_IconCell *iconCell;
@property(nonatomic,strong) UIImage *tximage;

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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showiconImage:)name:@"iconimageNotification"object:nil];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [self.view addSubview:self.tableView];
}
- (void)showiconImage:(NSNotification *)notification{
    id image = notification.object;
    _iconCell.iconView.image = image;
    self.tximage = _iconCell.iconView.image;
    CZHLog(@"-------------------self.tximage%@",self.tximage);
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
        return 4;
    }
    else{
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierID = @"cell_PersonInfoVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifierID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
#pragma mark  --  处理逻辑
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:kUserNameKey];
    NSString *certing = [userDefaults objectForKey:KUserSubmitCertification];
    NSString *maleorfemale = [userDefaults objectForKey:kUserGenderKey];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            _iconCell = [Czh_IconCell cellWithTableView:tableView];
            _iconCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return _iconCell;
        }else if (indexPath.row == 1){
            Czh_NameCell *cell = [Czh_NameCell cellWithTableView:tableView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftLabel.text = @"用户名";
            cell.textField.placeholder = @"userName";
            cell.textField.text = userName;
            cell.textField.enabled = NO;
            return cell;
        }else if (indexPath.row == 2){
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.text = @"性别";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
            if (maleorfemale.length != 0) {
                cell.detailTextLabel.text = maleorfemale;
            }else{
                cell.detailTextLabel.text = @"男";
            }
        }else if (indexPath.row == 3){
            _mailCell = [Czh_NameCell cellWithTableView:tableView];
            _mailCell.leftLabel.text = @"邮箱";
            if (maleorfemale.length == 0) {
                _mailCell.textField.placeholder = @"可选填";
            }
            return _mailCell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"KYC认证";
            cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
            if ([certing isEqualToString:@"1"]) {
                cell.detailTextLabel.text = @"认证中";
            }else{
                cell.detailTextLabel.text = @"未认证";
            }
        }
        return cell;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[Czh_UserIconVC new] animated:YES];
        }else if (indexPath.row == 1) {
            //
        }else if (indexPath.row == 2) {
            //            [self.navigationController pushViewController:[Czh_RechargeTelVC new] animated:YES];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[Czh_KYCCertVC new] animated:YES];
        }
    }
}

-(void)saveBtnClick{
    NSString *iconimage = [self UIImageToBase64Str:self.tximage];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [userDefaults objectForKey:kUserNameKey];
    NSString *idStr = [userDefaults objectForKey:kUserIDKey];
    NSString *gender = [userDefaults objectForKey:kUserGenderKey];
    CZHLog(@"----gender-%@---idStr-%@----userName-%@----self.mailCell.textField.text:%@",gender,idStr,userName,self.mailCell.textField.text);
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
                                @"email" : self.mailCell.textField.text,
                                @"gender" : @"male",
                                @"head_img" : iconimage,
                                @"id" : @(intString),
                                @"nick" : userName
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
            CZHLog(@"-------%@",dict);
        }
    }];
}

//内容将要发生改变编辑
-(BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

//图片转字符串
-(NSString *)UIImageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"iconimageNotification"object:nil];
    CZHLog(@"-------传递成功");
}
@end
