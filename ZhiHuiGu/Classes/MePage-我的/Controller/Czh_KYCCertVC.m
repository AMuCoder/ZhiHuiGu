//  文件名: Czh_KYCCertVC.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_KYCCertVC.h"
#import "Czh_NameCell.h"
#import "Czh_maleCell.h"
#import "Czh_LoginBtn.h"

@interface Czh_KYCCertVC ()<UITableViewDataSource, UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,Czh_maleCellDelegate> //一定要声明这三个协议，缺一不可
@property(nonatomic,strong) UIImagePickerController *imagePicker; //声明全局的UIImagePickerController
@property(nonatomic,strong) UIImageView *positeImageView;
@property(nonatomic,strong) UIImageView *reverseImageView;
@property(nonatomic,strong) Czh_LoginBtn *tureBtn;
@property(nonatomic,assign) NSInteger tagNum;
@property(nonatomic,copy) NSString *positeImageStr;
@property(nonatomic,copy) NSString *reverseImageStr;
@property(nonatomic,strong) NSString *maleorfemale;
@property(nonatomic,assign) NSInteger clickIndex;

//判断状态的按钮
@property (strong, nonatomic) Czh_ZYbtn *tempBtn;
@property(nonatomic,strong) UITableView *tableView;

@end

@implementation Czh_KYCCertVC
-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 270)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    /**证件照正面*/
    UIImageView *positeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 280, (self.view.CZH_width-30)/2, self.view.CZH_width/3)];
    
    positeImageView.layer.cornerRadius = 5;
    positeImageView.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:positeImageView];
    _positeImageView = positeImageView;
    _positeImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(positeImageViewClick)];
    [_positeImageView addGestureRecognizer:singleTap1];
    
    /**证件照反面*/
    UIImageView *reverseImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.CZH_width-30)/2+20, 280, (self.view.CZH_width-30)/2, self.view.CZH_width/3)];
    reverseImageView.backgroundColor = CZHRGBColor(244, 244, 244);
    reverseImageView.layer.cornerRadius = 5;
    [reverseImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(positeImageViewClick)]];
    [self.view addSubview:reverseImageView];
    _reverseImageView = reverseImageView;
    _reverseImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reverseImageViewClick)];
    [_reverseImageView addGestureRecognizer:singleTap2];
    
    Czh_LoginBtn *tureBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,self.view.CZH_height - 120, Main_Screen_Width - 40, 44)];
    [tureBtn setTitle:@"确定" forState:UIControlStateNormal];
    tureBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:tureBtn];
    _tureBtn = tureBtn;
    [self.tureBtn addTarget:self action:@selector(tureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
#pragma mark -头像UIImageview的点击事件
- (void)positeImageViewClick {
    //自定义消息框
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择",@"取消", nil];
    sheet.tag = 20181008;
    _tagNum = 20181008;
    //显示消息框
    [sheet showInView:self.view];
}
#pragma mark -头像UIImageview的点击事件
- (void)reverseImageViewClick {
    //自定义消息框
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择",@"取消", nil];
    sheet.tag = 20181009;
    _tagNum = 20181009;
    //显示消息框
    [sheet showInView:self.view];
}
#pragma mark -消息框代理实现-
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.tag == 20181008) {
        NSUInteger sourceType = 0;
        // 判断系统是否支持相机
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePickerController.delegate = self; //设置代理
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = sourceType; //图片来源
            if (buttonIndex == 0) {
                //拍照
                sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePickerController.sourceType = sourceType;
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }else if (buttonIndex == 1) {
                //相册
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePickerController.sourceType = sourceType;
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }else if (buttonIndex == 2){
                return;
            }
        }else {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickerController.sourceType = sourceType;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
    }else if (actionSheet.tag == 20181009) {
        NSUInteger sourceType = 0;
        // 判断系统是否支持相机
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePickerController.delegate = self; //设置代理
            imagePickerController.allowsEditing = YES;
            imagePickerController.sourceType = sourceType; //图片来源
            if (buttonIndex == 0) {
                //拍照
                sourceType = UIImagePickerControllerSourceTypeCamera;
                imagePickerController.sourceType = sourceType;
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }else if (buttonIndex == 1) {
                //相册
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                imagePickerController.sourceType = sourceType;
                [self presentViewController:imagePickerController animated:YES completion:nil];
            }else if (buttonIndex == 2){
                return;
            }
        }else {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickerController.sourceType = sourceType;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
    }
}
#pragma mark -实现图片选择器代理-（上传图片的网络请求也是在这个方法里面进行，这里我不再介绍具体怎么上传图片）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    if (_tagNum == 20181008) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        _positeImageView.image = image;
        _positeImageStr = [self UIImageToBase64Str:image];
    }else{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        _reverseImageView.image = image;
        _reverseImageStr = [self UIImageToBase64Str:image];
    }
}
//当用户取消选择的时候，调用该方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{}];
}
//图片转字符串
-(NSString *)UIImageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
/***
- (void)tureBtnClick{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *idStr = [userDefaults objectForKey:kUserIDKey];
    NSInteger intString = [idStr intValue];
    // 1.URL
    NSURL *url = [NSURL URLWithString:@"http://119.23.206.144:8000/v1/user/apply-kyc"];
    // 2.请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3.请求方法
    request.HTTPMethod = @"POST";
    // 4.设置请求体（请求参数）
    // 创建一个描述订单信息的JSON数据
    NSDictionary *orderInfo = @{
                                @"cert_num" : self.IDNum.text,
                                @"cert_type" : @1,
                                @"gender" : self.maleorfemale,
                                @"name" : self.userName.text,
                                @"photo_back" : self.reverseImageStr,
                                @"photo_front" : self.positeImageStr,
                                @"user_id" : @(intString)
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
}*/
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
        return 2;
    }
    else{
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierID = @"cell_KYCVC";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifierID];
    }
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
    //NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //NSString *userTel = [userDefaults objectForKey:kUserTelKey];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            Czh_NameCell *cell = [Czh_NameCell cellWithTableView:tableView];
            cell.leftLabel.text = @"姓名";
            cell.textField.placeholder = @"请输入您的真实名字";
            return cell;
        }else if (indexPath.row == 1){
            Czh_maleCell *cell = [Czh_maleCell cellWithTableView:tableView];
            cell.delegate = self;
            cell.leftLabel.text = @"性别";
            return cell;
        }
    }else{
        if (indexPath.row == 0) {
            Czh_NameCell *cell = [Czh_NameCell cellWithTableView:tableView];
            cell.leftLabel.text = @"证件类型";
            cell.textField.placeholder = @"身份证";
            cell.userInteractionEnabled =NO;
            return cell;
        }else if (indexPath.row == 1) {
            Czh_NameCell *cell = [Czh_NameCell cellWithTableView:tableView];
            cell.leftLabel.text = @"证件号码";
            cell.textField.placeholder = @"请输入证件号码";
            return cell;
        }else if (indexPath.row == 2) {
            Czh_NameCell *cell = [Czh_NameCell cellWithTableView:tableView];
            cell.leftLabel.text = @"上传证件照";
            cell.userInteractionEnabled =NO;
            return cell;
        }
    }
    return cell;
}


-(void)didClickButton:(UIButton *)sender{
    CZHLog(@"----------%@",sender.titleLabel.text);
}

@end
