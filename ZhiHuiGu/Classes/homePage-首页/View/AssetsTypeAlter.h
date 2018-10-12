//  文件名: AssetsTypeAlter.h
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <UIKit/UIKit.h>

@interface AssetsTypeAlter : UIView <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong)UITableView *tableview;//tabelview
@property (nonatomic, strong)NSMutableArray *dataSource;

-(void)hideView;
-(void)showView;
-(instancetype)initWithFrame:(CGRect)frame andHeight:(float)height;//height 白色弹框高度，自己想设多高设多高
@end
