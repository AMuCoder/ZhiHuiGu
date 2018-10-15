//  文件名: Czh_MarketModel.h
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import <Foundation/Foundation.h>

@interface Czh_MarketModel : NSObject
/**币种*/
@property(nonatomic,copy) NSString *currency;
/**价格*/
@property(nonatomic,copy) NSString *price;
/**总额*/
@property(nonatomic,copy) NSString *totalAmount;
/**涨跌幅*/
@property(nonatomic,copy) NSString *riseFall;

//自定义初始化
+ (instancetype) marketModelWithDic:(NSDictionary *)dic;
- (instancetype) initWithDic:(NSDictionary *)dic;

@end
