//
//  LCUserDefaultsModel.m
//  NSUserDefaultsModel
//
//  Created by 刘冲 on 2018/7/19.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCUserDefaultsModel.h"

/**
 以“name”来说，如果想要进行取值的话只需要调用[LCUserDefaultsModel userDefaultsModel].name就行，对"name"进行更改并保存到plist文件的话只需要调用[LCUserDefaultsModel userDefaultsModel].name = @"newName"就可以了。
 */
@implementation LCUserDefaultsModel

@dynamic name;
@dynamic gender;
@dynamic age;
@dynamic floatNumber;
@dynamic doubleNumber;
@dynamic isMan;

#pragma mark - Init

- (NSDictionary *)setupDefaultValues {
    return @{@"name": @"lc",
             @"gender": @1,
             @"age": @20,
             @"floatNumber": @11.1,
             @"doubleNumber": @22.2,
             @"isMan": @YES,
             };
}

@end
