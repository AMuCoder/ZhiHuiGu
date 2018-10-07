//  文件名: Czh_RememberParticalVC.m
//  创建者: CYJ 时间: 2018/10/7.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_RememberParticalVC.h"
#import "RTNavigationBar.h"

@interface Czh_RememberParticalVC ()

@end

@implementation Czh_RememberParticalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupView];
}
#pragma mark -- 添加导航栏
-(void)setNav{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    UINavigationBar *nav = [RTNavigationBar defaultBar];
    nav.barTintColor = [UIColor whiteColor];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"抄写记助词"];
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"common_btn_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [left setImageEdgeInsets:UIEdgeInsetsMake(0, /*0*/-23, 0, 0)];
    [left addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:left];
    [navigationItem setLeftBarButtonItem:leftBtn animated:NO];
    [nav pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:nav];
}
-(void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupView{
    /**
     ios 11判断
     */
    CGFloat kheight;
    if (@available(iOS 11.0, *)) {
        kheight = 108.f;
    }else{
        kheight = 20.f;
    }
    /**
     0
     */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, kheight, Main_Screen_Width - 20, 44)];
    [self.view addSubview:label];
    label.text = @"抄写下您的钱包助记词";
    label.textAlignment = NSTextAlignmentCenter;
    [label setTextColor:[UIColor blackColor]];
    [label setFont:[UIFont systemFontOfSize:20.f]];
    
    UILabel *tishiLabel = [[UILabel alloc] init];
    tishiLabel.numberOfLines = 0;
    [tishiLabel setFont:[UIFont systemFontOfSize:15.f]];
    tishiLabel.text = @"助记词用于创建或恢复钱包密码，将它准确的抄写到纸上，并存放于只有您知道的地方。切记千万不要保存到网络上。";
    CGRect frameNew = [tishiLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:tishiLabel.font} context:nil];  // 指定为width，通常都是控件的width都是固定调整height
    NSLog(@"%@",NSStringFromCGSize(tishiLabel.frame.size));
    tishiLabel.frame = CGRectMake(20, CGRectGetMaxY(label.frame) + 20, self.view.CZH_width - 40, frameNew.size.height);
    [self.view addSubview:tishiLabel];
    [tishiLabel setTextColor:[UIColor grayColor]];
    
    UITextView *textview =  [[UITextView alloc] init];
    textview.text = @"UITextView详解asddfasdfasdfsd qqqqqqqqq呜呜呜呜呜呜呜呜无无无无无无无无无无无无无无无无无无qqqqqqqqqqqqqqqqqqqqqqqqqqqq";
    textview.font = [UIFont systemFontOfSize:18.f];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    //设置字体名字和字体大小;
    CGRect frameNew0 = [textview.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:textview.font} context:nil];
    textview.frame = CGRectMake(20, CGRectGetMaxY(tishiLabel.frame) + 20, self.view.CZH_width - 40, frameNew0.size.height);
    textview.backgroundColor=[UIColor lightGrayColor]; //设置背景色
    textview.scrollEnabled = NO;    //设置当文字超过视图的边框时是否允许滑动，默认为“YES”
    textview.editable = NO;        //设置是否允许编辑内容，默认为“YES”
    textview.textColor = [UIColor blackColor];// 设置显示文字颜色
    textview.layer.backgroundColor = [[UIColor clearColor] CGColor];
    textview.layer.borderColor = [[UIColor grayColor]CGColor];
    textview.layer.borderWidth = 0.5;
    [textview.layer setMasksToBounds:YES];
    [self.view addSubview:textview];
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
