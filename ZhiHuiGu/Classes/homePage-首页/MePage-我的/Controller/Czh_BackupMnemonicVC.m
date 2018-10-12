//  文件名: Czh_BackupMnemonicVC.m
//  创建者: CYJ 时间: 2018/10/8.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_BackupMnemonicVC.h"
#import "RTNavigationBar.h"
#import "Czh_LoginBtn.h"
#import "UILabel+Czh_UILabel.h"
#import "Czh_UILabel.h"
#import "Czh_TabBarController.h"

#import "Czh_RememberParticalView.h"

@interface Czh_BackupMnemonicVC ()
@property(nonatomic,strong) Czh_LoginBtn *ZJCNextBtn;
@property (nonatomic, strong) NSArray *zjcArr;
@property (nonatomic, strong) NSMutableArray *zjcToArr;
@property(nonatomic,copy) NSString *mnemonicStr;
@property(nonatomic,strong) Czh_RememberParticalView *rticalView;
@property(nonatomic,copy) NSString *zjcToArrString;
@property(nonatomic,strong) UIButton *cityButton;

@end

@implementation Czh_BackupMnemonicVC
-(NSMutableArray *)zjcToArr
{
    if (!_zjcToArr) {
        self.zjcToArr = [NSMutableArray array];
    }
    return _zjcToArr;
}
-(NSArray *)zjcArr
{
    if (!_zjcArr) {
        self.zjcArr = [NSArray array];
    }
    return _zjcArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _mnemonicStr = [Czh_AccountTool getUserMnemonic];
    NSLog(@"_mnemonicStr:%@",_mnemonicStr);
    NSArray* unsortedArray = [_mnemonicStr componentsSeparatedByString:@" "];//#为分隔符
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    //排序
    _zjcArr = [unsortedArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor,nil]];
    NSLog(@"sortedArray:%@",_zjcArr);
    //_zjcArr = @[@"Will",@"attempt",@"recover",@"symbolic",@"category",@"catch",@"methods",@"animated",@"tableView",@"textLabel",@"NSString",@"animated0",@"tableView0",@"textLabel0"];
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
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"备份助记词"];
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
        kheight = 120.f;
    }else{
        kheight = 64;
    }
    
#pragma mark
    UILabel *label = [[Czh_UILabel alloc] initWithFrame:CGRectMake(10, kheight, Main_Screen_Width - 20, 44) labelTextColor:[UIColor blackColor] sizeFloat:20.f textAlignment:NSTextAlignmentCenter];
    label.text = @"确认您的钱包助记词";
    [self.view addSubview:label];
    
#pragma mark
    UILabel *tsLabel = [[Czh_UILabel alloc] init];
    tsLabel.numberOfLines = 0;
    [tsLabel setFont:[UIFont systemFontOfSize:15.f]];
    tsLabel.text = @"请按顺序点击助记词，以确认您的备份助记词正确。";
    CGRect frameNew = [tsLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:tsLabel.font} context:nil];  // 指定为width，通常都是控件的width都是固定调整height
    tsLabel.frame = CGRectMake(25, CGRectGetMaxY(label.frame) + 20, self.view.CZH_width - 50, frameNew.size.height);
    [self.view addSubview:tsLabel];
    [tsLabel setTextColor:[UIColor grayColor]];
    [UILabel changeLineSpaceForLabel:tsLabel WithSpace:5];
    
    Czh_RememberParticalView *rticalView = [[Czh_RememberParticalView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tsLabel.frame) + 20, self.view.CZH_width, 120)];
    [self.view addSubview:rticalView];
    _rticalView = rticalView;
#pragma mark
    
    CGFloat LABELW = (Main_Screen_Width - 40)/3;
    CGFloat LABELH = 30;
    NSInteger COL_COUNT = 3;
    for (int i = 0; i < _zjcArr.count; i++) {

        NSInteger row = i / COL_COUNT;
        NSInteger col = i % COL_COUNT;
        CGFloat margin = (self.view.bounds.size.width - (LABELW * COL_COUNT)) / (COL_COUNT + 1);
        CGFloat picX = margin + (LABELW + margin) * col;
        CGFloat picY = margin + (LABELH + 10) * row;
        
        UIButton *cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cityButton.frame = CGRectMake(picX, CGRectGetMaxY(rticalView.frame) + 20 + picY, LABELW, LABELH);
        cityButton.layer.borderWidth = 0.5;
        cityButton.tag = 200 + i;
        [cityButton addTarget:self action:@selector(selectCity:) forControlEvents:UIControlEventTouchUpInside];
        cityButton.titleLabel.font = [UIFont systemFontOfSize:20.f];
        [cityButton setTitle:_zjcArr[i] forState:UIControlStateNormal];
        [cityButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:cityButton];
        _cityButton = cityButton;
    }
    Czh_LoginBtn *ZJCNextBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(_cityButton.frame) + 20, Main_Screen_Width - 40, 44)];
    [ZJCNextBtn setTitle:@"确认" forState:UIControlStateNormal];
    ZJCNextBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:ZJCNextBtn];
    _ZJCNextBtn = ZJCNextBtn;
    [self.ZJCNextBtn addTarget:self action:@selector(ZJCNextBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)selectCity:(UIButton*)sender{
    sender.enabled = NO;
    if (!sender.enabled) {
        [sender setBackgroundColor:[UIColor lightGrayColor]];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    NSString *btnStr = sender.titleLabel.text;
    CZHLog(@"点击这个按钮的名称是-----%@",sender.titleLabel.text);
    [self.zjcToArr addObject:btnStr];
    CZHLog(@"点击这个按钮的数组-----%@",self.zjcToArr);
    _zjcToArrString = [self.zjcToArr componentsJoinedByString:@" "];
    CZHLog(@"zjcToArrString-----%@",_zjcToArrString);
    _rticalView.label.text = [_zjcToArrString stringByReplacingOccurrencesOfString:@" "withString:@"    "];
    CZHLog(@"------------------------------------------------------------_rticalView.label.text:%@",_rticalView.label.text);
    [sender removeFromSuperview];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)ZJCNextBtnClick{
    if ([_mnemonicStr isEqualToString:_zjcToArrString]) {
        //[Czh_WarnWindow HUD:self.view andWarnText:@"验证成功" andXoffset:0 andYoffset:Main_Screen_Height/3];
        [self showAlterView];
    }else{
        //[Czh_WarnWindow HUD:self.view andWarnText:@"验证失败,请重新验证" andXoffset:0 andYoffset:Main_Screen_Height/3];
        [self showAlterViewError];
    }
}
-(void)showAlterView{
    [CZHAlertView showAlertWithTitle:@"您备份的助记词顺序验证成功。"
                             message:nil
                         cancelTitle:@"知道了"
                          completion:^(BOOL cancelled) {
                              if (cancelled) {
                                  [self presentViewController:[Czh_TabBarController new] animated:false completion:nil];
                              } else {
                                  NSLog(@"Simple Alert View dismissed, but not cancelled");
                              }
                          }];
}
-(void)showAlterViewError{
    [CZHAlertView showAlertWithTitle:@"您备份的助记词顺序验证失败，请返回查看/重试？"
                             message:nil
                         cancelTitle:@"确认"
                          completion:^(BOOL cancelled) {
                              if (cancelled) {
                                  [self dismissViewControllerAnimated:YES completion:nil];
                              } else {
                                  NSLog(@"Simple Alert View dismissed, but not cancelled");
                              }
                          }];
}
@end
