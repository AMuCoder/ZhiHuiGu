//  文件名: Czh_KYCCertificationVC.m
//  创建者: CYJ 时间: 2018/10/18.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_KYCCertificationVC.h"
#import "Czh_RechargeField.h"
#import "Czh_SelectionView.h"
#import "Czh_TypeBtn.h"
#import "Czh_LoginBtn.h"

@interface Czh_KYCCertificationVC ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> //一定要声明这三个协议，缺一不可
@property(nonatomic,strong) UIImagePickerController *imagePicker; //声明全局的UIImagePickerController
@property(nonatomic,strong) Czh_RechargeField *userName;
@property(nonatomic,strong) Czh_SelectionView *sexSelectionView;
@property(nonatomic,strong) Czh_RechargeField *certificateType;
@property(nonatomic,strong) Czh_RechargeField *IDNum;
@property(nonatomic,strong) UIImageView *positeImageView;
@property(nonatomic,strong) UIImageView *reverseImageView;
@property(nonatomic,strong) Czh_LoginBtn *tureBtn;
@property(nonatomic,assign) NSInteger tagNum;
@property(nonatomic,copy) NSString *positeImageStr;
@property(nonatomic,copy) NSString *reverseImageStr;
@property(nonatomic,strong) NSString *maleorfemale;
//判断状态的按钮
@property (strong, nonatomic) Czh_TypeBtn *tempBtn;

@end

@implementation Czh_KYCCertificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"KYC认证";
    [self addSubViews];
}
- (void)addSubViews{
    Czh_RechargeField *userName = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, 0, self.view.CZH_width-20, 50) placeHolder:@"请输入姓名" boolRView:NO LeftViewTitle:@"姓名 " rightTitle:nil];
    userName.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:userName];
    _userName = userName;
    
    /**分割线*/
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_userName.frame), self.view.CZH_width, 1)];
    line.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line];
    
    Czh_SelectionView *sexSelectionView = [[Czh_SelectionView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line.frame), self.view.CZH_width-20, 50)leftlabelText:@"性别"];
    [self.view addSubview:sexSelectionView];
    sexSelectionView.womanBtn.rightLable.text = @"女";
    sexSelectionView.manBtn.rightLable.text = @"男";
    _sexSelectionView = sexSelectionView;
    /**按钮触发事件*/
    [_sexSelectionView.womanBtn addTarget:self action:@selector(buttonSelected:)forControlEvents:UIControlEventTouchUpInside];
    [_sexSelectionView.manBtn addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    __weak __typeof(self)weakSelf = self;
     [_sexSelectionView.womanBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"女");
         weakSelf.maleorfemale = @"female";
    } andEvent:UIControlEventTouchUpInside];
    [_sexSelectionView.manBtn setClickBlock:^(UIButton *button) {
        CZHLog(@"男");
        weakSelf.maleorfemale = @"male";
    } andEvent:UIControlEventTouchUpInside];
    /*************/
    
    /**分割线*/
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sexSelectionView.frame), self.view.CZH_width, 20)];
    line2.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line2];
    /**证件类型*/
    Czh_RechargeField *certificateType = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line2.frame), self.view.CZH_width-20, 50) placeHolder:@"身份证" boolRView:NO LeftViewTitle:@"证件类型" rightTitle:nil];
//    certificateType.text = @"身份证";
    certificateType.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:certificateType];
    _certificateType = certificateType;
    /**分割线*/
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_certificateType.frame), self.view.CZH_width, 1)];
    line3.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line3];
    /**身份证*/
    Czh_RechargeField *IDNum = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line3.frame), self.view.CZH_width-20, 50) placeHolder:@"350500000000000000000" boolRView:NO LeftViewTitle:@"证件号码" rightTitle:nil];
//    IDNum.text = @"350500000000000000000";
    IDNum.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:IDNum];
    _IDNum = IDNum;
    /**分割线*/
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_IDNum.frame), self.view.CZH_width, 1)];
    line4.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:line4];
    /**身份证*/
    Czh_RechargeField *picture = [[Czh_RechargeField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(line4.frame), self.view.CZH_width-20, 50) placeHolder:nil boolRView:NO LeftViewTitle:@"上传证件照" rightTitle:nil];
    picture.enabled = NO;
    [self.view addSubview:picture];
    /**证件照正面*/
    UIImageView *positeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(picture.frame)+10, (self.view.CZH_width-30)/2, self.view.CZH_width/3)];
    
    positeImageView.layer.cornerRadius = 5;
    positeImageView.backgroundColor = CZHRGBColor(244, 244, 244);
    [self.view addSubview:positeImageView];
    _positeImageView = positeImageView;
    _positeImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(positeImageViewClick)];
    [_positeImageView addGestureRecognizer:singleTap1];
    
    /**证件照反面*/
    UIImageView *reverseImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.CZH_width-30)/2+20, CGRectGetMaxY(picture.frame)+10, (self.view.CZH_width-30)/2, self.view.CZH_width/3)];
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
}
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
#pragma methods
-(void)buttonSelected:(Czh_TypeBtn *)sender{
    if (self.tempBtn == nil) {
        sender.selected = YES;
        self.tempBtn = sender;
    }else if (self.tempBtn != nil&&self.tempBtn == sender){
        sender.selected = YES;
    }else if (self.tempBtn != sender&&self.tempBtn != nil){
        self.tempBtn.selected = NO;
        sender.selected = YES;
        self.tempBtn = sender;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
//图片转字符串
-(NSString *)UIImageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
@end
