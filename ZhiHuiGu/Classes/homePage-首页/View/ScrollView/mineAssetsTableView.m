//  文件名: mineAssetsTableView.m
//  创建者: CYJ 时间: 2018/10/12.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "mineAssetsTableView.h"
#import "Czh_mineAssetsTableViewCell.h"
#define kRowHeight 55

@interface mineAssetsTableView()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation mineAssetsTableView

/** tabview构造方法 */
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        self.scrollEnabled = NO;
    }
    return self;
}
#pragma mark - Set方法
-(void)setRowNumber:(NSInteger)rowNumber {
    _rowNumber = rowNumber;
    // 重置高度为：行数（rowNumber） *  行高（kRowHeight）
    self.CZH_height = rowNumber * kRowHeight;
    [self reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNumber = 4;
    _rowNumber = rowNumber;
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kRowHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"mineAssetsTableViewCell";
    Czh_mineAssetsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[Czh_mineAssetsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.rowHeight = 70;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"这是第%ld行", (long)indexPath.row];
    CZHLog(@"%@",str);
}
@end
