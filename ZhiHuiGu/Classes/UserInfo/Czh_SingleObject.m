//  文件名: Czh_SingleObject.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 CYJ. All rights reserved..
//  用途：

#import "Czh_SingleObject.h"

@implementation Czh_SingleObject

//1.定义static的类型变量
static Czh_SingleObject *instance;
//2.单例对象创建
+(instancetype)getInstance{
    @synchronized(self) {//多线程同步，防止多线程的并发访问
        if (instance == nil) {
            instance = [[Czh_SingleObject alloc]init];
        }
    }
    return instance;
}

//3.重写alloc对应方法，防止用户通过alloc方法构建多个对象
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if (instance == nil) {
        instance = [[super allocWithZone:zone] init];
    }
    return instance;
}

//1. 必须把static dispatch_once_t onceToken; 这个拿到函数体外,成为全局的.
//2.

//static dispatch_once_t onceToken;
+(void)attempDealloc{
    // onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    // [instance release];
    instance = nil;
}
@end
