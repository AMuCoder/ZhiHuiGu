//
//  CzhNetworkingTools.m
//  阿木
//
//  Created by 阿木 on 16/5/13.
//  Copyright © 2016年 阿木. All rights reserved.
//

#import "CzhNetworkingTools.h"

#import <UIKit/UIKit.h>

@implementation CzhNetworkingTools

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsDownloadFilePathDispose:  ( 下载 文件 路径处理 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)czhNetworkingToolsDownloadFilePathDispose:(NSURL *)filePath {
    return [NSString stringWithFormat:@"%@/%@", [CzhNetworkingTools czhNetworkingToolsGetDocumentsPath], [CzhNetworkingTools czhNetworkingToolsGetDownloadFileName:filePath]];
}

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsGetDownloadFileName:  ( 取出 下载 文件名称 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)czhNetworkingToolsGetDownloadFileName:(NSURL *)filePath {
    NSString *filePathString = [NSString stringWithFormat:@"%@", filePath];
    return [filePathString componentsSeparatedByString:@"/"].lastObject;
}

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsGetDocumentsPath  ( 取出 documents 文件路径 )
 *
 *  @return NSString
 */
+ (NSString *)czhNetworkingToolsGetDocumentsPath {
    NSArray  *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPaths = [paths objectAtIndex:0];
    return documentsPaths;
}

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsSetNetworkActivityIndicatorVisible:  ( 显示 或 隐藏 网络获取数据时 UINavigationBar 上的图标 <转圈的菊花 > )
 *
 *  @param  networkActivityIndicatorVisible
 */
+ (void)czhNetworkingToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = networkActivityIndicatorVisible;
}

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsGetErrorMessage: ( 获取 错误信息 )
 *
 *  @param  error
 *
 *  @return NSString
 */
+ (NSString *)czhNetworkingToolsGetErrorMessage:(NSError *)error {
    return error == nil ? nil : [NSString stringWithFormat:@"错误代码%ld \n 错误信息%@", (long)error.code, error.localizedDescription];
}

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsRequestDispose:      ( 返回 网络 结果集 处理 )
 *
 *  @param  responseObject
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)czhNetworkingToolsRequestDispose:(id)responseObject {
    
    // 转换成 字符串
    NSString *decodeJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSLog(@"responseJson === > %@", decodeJson);
    
    if (!decodeJson) {
        NSAssert(@" responseObject ===> %@", decodeJson);
        return nil;
    }
    
    NSLog(@"responseObject ===> %@", decodeJson);
    
    // 字符串转成流
    NSData        *data      = [decodeJson dataUsingEncoding:NSUTF8StringEncoding];
    
    // 转换字典
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dictionary;
}


@end
