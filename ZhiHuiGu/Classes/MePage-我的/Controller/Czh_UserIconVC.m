//  文件名: Czh_UserIconVC.m
//  创建者: CYJ 时间: 2018/10/19.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_UserIconVC.h"
#import "Czh_LoginBtn.h"

@interface Czh_UserIconVC ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,copy) NSString *iconStr;
@property(nonatomic,strong) Czh_LoginBtn *PhotoBtn;
@property(nonatomic,strong) Czh_LoginBtn *cameraBtn;
@property(nonatomic,strong) UIImageView *iconView;
@property(nonatomic,strong) UIImagePickerController *imagePicker; //声明全局的UIImagePickerController
@property(nonatomic,strong) UIImage *images;

@end

@implementation Czh_UserIconVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置个人头像";
    [self addSubViewTo];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnClick:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)addSubViewTo {
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.view.CZH_width-20, self.view.CZH_width-20)];
//    iconView.image = [UIImage imageNamed:self.iconStr];
    iconView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:iconView];
    _iconView = iconView;
    
    Czh_LoginBtn *PhotoBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(_iconView.frame)+30, Main_Screen_Width - 40, 44)];
    [PhotoBtn setTitle:@"从相册选一张" forState:UIControlStateNormal];
    PhotoBtn.backgroundColor = CZHRGBColor(255, 255, 255);
    [PhotoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:PhotoBtn];
    _PhotoBtn = PhotoBtn;
    [self.PhotoBtn addTarget:self action:@selector(PhotoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    Czh_LoginBtn *cameraBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(_PhotoBtn.frame)+20, Main_Screen_Width - 40, 44)];
    [cameraBtn setTitle:@"拍一张照片" forState:UIControlStateNormal];
    cameraBtn.backgroundColor = CZHRGBColor(255, 255, 255);
    [cameraBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:cameraBtn];
    _cameraBtn = cameraBtn;
    [self.cameraBtn addTarget:self action:@selector(cameraBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)PhotoBtnClick {
    CZHLog(@"-------%s",__func__);
    NSUInteger sourceType = 0;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerController.delegate = self; //设置代理
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType; //图片来源:相册
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}
- (void)cameraBtnClick {
    CZHLog(@"-------%s",__func__);
    NSUInteger sourceType = 0;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    sourceType = UIImagePickerControllerSourceTypeCamera;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerController.delegate = self; //设置代理
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType; //图片来源:相机
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}
#pragma mark -实现图片选择器代理-（上传图片的网络请求也是在这个方法里面进行，这里我不再介绍具体怎么上传图片）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _iconView.image = image;
    _images = image;
//    _iconStr = [self UIImageToBase64Str:image];
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults setObject:_iconStr  forKey:KUserUserIconStrKey];//已提交认证
//    [userDefaults synchronize];//写入沙盒
}

-(void)saveBtnClick:(UIButton *)button{
//    [self.iconDelegate iconController:self withButton:button];
//    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"iconimageNotification"object:self.images];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
