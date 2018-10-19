//  文件名: Czh_WoWalletVC.m
//  创建者: CYJ 时间: 2018/10/16.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：我的钱包界面

#import "Czh_WoWalletVC.h"
#import "Czh_WoWalletView.h"
#import "Czh_mineAssetsTableViewCell.h"
#import "Czh_trustVC.h"

@interface Czh_WoWalletVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong) TPKeyboardAvoidingScrollView * contentScrollView;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIButton *trustBtn;

@end

@implementation Czh_WoWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的钱包";
    
    [self setScrollView];
}
- (void)setScrollView{
    /**
     控制前添加ScrollView（非必备）
     */
    
    TPKeyboardAvoidingScrollView * contentScrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    contentScrollView.bounces = NO;
    contentScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:contentScrollView];
    _contentScrollView = contentScrollView;
    
    _walletView = [[Czh_WoWalletView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, 160) WalletAddressText:@"QQQQQQQQQ.....QQQQQQ" QrcodeImage:@"XXX"  WalletMoney:@"10000" KYCBtnImage:@"life_add" KYCBtnHightImage:@"life_add"];
    [self.contentScrollView addSubview:_walletView];
    [self.contentScrollView addSubview:self.tableView];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, Main_Screen_Width, Main_Screen_Height-160)];
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
    label.text = @"资产";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentLeft;
    [headerView addSubview:label];
    
    _trustBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _trustBtn.frame = CGRectMake(self.view.CZH_width-110,10,100, 30);
    _trustBtn.backgroundColor = [UIColor clearColor];
    [_trustBtn setTitle:@"信任" forState:UIControlStateNormal];
    _trustBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_trustBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_trustBtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [_trustBtn addTarget:self action:@selector(trustBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:_trustBtn];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, self.view.CZH_width, 0.5)];
    line.backgroundColor = [UIColor blackColor];
    [headerView addSubview:line];
    
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Czh_mineAssetsTableViewCell *cell = [Czh_mineAssetsTableViewCell cellWithTableView:tableView];
    return cell;
}
-(void)trustBtnClick{
    [self.navigationController pushViewController:[Czh_trustVC new] animated:YES];
}

@end
