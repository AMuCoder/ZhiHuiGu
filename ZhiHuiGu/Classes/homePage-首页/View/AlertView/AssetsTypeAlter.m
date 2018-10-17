//  文件名: AssetsTypeAlter.m
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "AssetsTypeAlter.h"
#import "AssetsTableViewCell.h"
static NSString *ID = @"AssetsTableViewCell";
@implementation AssetsTypeAlter
{
    UIView *view;
    UIView *bgView;
}

-(instancetype)initWithFrame:(CGRect)frame andHeight:(float)height {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 5;
        //半透明view
        view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = AlterRGBColor(0, 0, 0);
        [self addSubview:view];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView)];
        [view addGestureRecognizer:tap];
        //白色底view
        bgView = [[UIView alloc] initWithFrame:CGRectMake(0, Main_Screen_Height, Main_Screen_Width, height)];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.userInteractionEnabled = YES;
        [self addSubview:bgView];
        //手势是可以点击空白地方让键盘下去或者弹窗消失的
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        tap1.delegate = self;
        [bgView addGestureRecognizer:tap1];
        
        //头部信息
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, kSize(40))];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, Main_Screen_Width -20, kSize(20))];
        headerView.backgroundColor = CZHRGBColor(0, 169, 97);
        label.text = @"选择资产类型";
        label.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:label];
        [bgView addSubview:headerView];
        
        //kbottomHeight为了适配iphonex，不让按钮显示在x底部圆弧范围内
        [bgView addSubview:self.tableview];
        self.tableview.sd_layout.leftSpaceToView(bgView, 0).rightSpaceToView(bgView, 0).topSpaceToView(headerView, 0).bottomSpaceToView(bgView, 0);
    }
    return self;
}
#pragma mark - methods
-(void)hideView
{
    [self tap];
    [UIView animateWithDuration:0.25 animations:^{
         self->bgView.centerY = self->bgView.centerY+CGRectGetHeight(self->bgView.frame);
     } completion:^(BOOL fin){
         [self removeFromSuperview];
     }];
}

-(void)showView
{
    self.alpha = 1;
    [UIView animateWithDuration:0.25 animations:^{
         self->bgView.centerY = self->bgView.centerY-CGRectGetHeight(self->bgView.frame);
     } completion:^(BOOL fin){}];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    NSLog(@"%@",[gestureRecognizer class]);
    if ([NSStringFromClass([gestureRecognizer class]) isEqualToString:@"UITapGestureRecognizer"]){
        // 输出点击的view的类名
        NSLog(@"ismain:   %@", NSStringFromClass([touch.view class]));
        //判断当前点击手势是什么情况下发生的-编辑状态就失去焦点
        return NO;
    }else{
        return YES;
    }
}
-(void)tap
{
    self.tableview.contentOffset = CGPointMake(0, 0);
//    [countView.countTextField resignFirstResponder];
}
#pragma mark - tavdelegete
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AssetsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[AssetsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.rowHeight = 70;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"这是第%ld行", (long)indexPath.row];
    AssetsTableViewCell *cell = [[AssetsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    NSString *cellInfoCurrencyLabelText = cell.currencyLabel.text;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:cellInfoCurrencyLabelText  forKey:KcellAssetsCurrencyTypeText];
    [userDefaults synchronize];
    CZHLog(@"%@-------%@",str,cellInfoCurrencyLabelText);
    [self hideView];
    
}
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) style:UITableViewStylePlain];
        _tableview.sectionHeaderHeight = 0;
        _tableview.backgroundColor = [UIColor whiteColor];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _tableview;
}
@end
