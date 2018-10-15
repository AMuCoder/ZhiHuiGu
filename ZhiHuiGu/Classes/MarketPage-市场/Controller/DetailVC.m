//
//  DetailVC.m
//  XLBasePage
//
//  Created by apple on 17/3/24.
//  Copyright © 2017年 ZXL. All rights reserved.
//  市场行情

#import "DetailVC.h"
#import "Czh_MarketTableViewCell.h"
#import "Czh_MarketView.h"
#import "Czh_MarketModel.h"

//static NSString *ID = @"Czh_MarketTableViewCell";
@interface DetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) Czh_MarketView *marketView;
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSArray *marketArr;
@end

@implementation DetailVC
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, self.view.CZH_height)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    self.tableview.tableFooterView = [UIView new];
    self.view.backgroundColor = [UIColor orangeColor];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Czh_MarketTableViewCell *cell = [Czh_MarketTableViewCell cellWithTableView:tableView];
    //cell.showModel = self.marketArr[indexPath.row];
    return cell;
}

/**每组几行*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
/**头部View*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _marketView = [[Czh_MarketView alloc] initWithFrame:CGRectMake(0, 0, self.view.CZH_width, 40)];
    return _marketView;
}
/**cell高度*/
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
/**头部View高度*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//把数据导入到模型中,然后导入到定得数组中
- (NSArray *)marketArr{
    //这个是实现数句的加载,第一次调用这个方法的时候加载全部数据
    //当第二次调用这个方法时不用加载
    //使用懒加载
    if(_marketArr == nil){
        //1.读取heros.plist文件的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        //2.加载数组,读出plist中的数据
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        //3.将dicArray 中的字典转成模型对象,放到新的数组中
        //遍历dictArray数组
        //4.创建一个可变数组,把模型存到可变数组中
        NSMutableArray *dicArray = [NSMutableArray array];
        for (NSDictionary *dic in dictArray) {
            //初始化模型对象
            Czh_MarketModel *hero = [Czh_MarketModel marketModelWithDic:dic];
            [dicArray addObject:hero];
        }
        //5.赋值
        self.marketArr = dicArray;
    }
    return _marketArr;
    
}
@end
