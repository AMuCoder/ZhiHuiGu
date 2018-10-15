//  文件名: Czh_MarketModel.m
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_MarketModel.h"

@implementation Czh_MarketModel
+ (instancetype) marketModelWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
- (instancetype) initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //KVC 字典转模型,这个不行,因为对象中的数据类型和dic中的数据类型不同
        //KVC 通过字符串名名字找到字符串
        //[self setValuesForKeysWithDictionary:dic];
//        self.heroimage = [UIImage imageNamed:dic[@"icon"]];
//        self.heroDis = dic[@"intro"];
//        self.heroName = dic[@"name"];
        
    }
    return self;
}
@end
