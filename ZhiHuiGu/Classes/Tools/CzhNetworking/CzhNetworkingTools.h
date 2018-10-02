//
//  CzhNetworkingTools.h
//  阿木
//
//  Created by 阿木 on 16/5/13.
//  Copyright © 2016年 阿木. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CzhNetworkingTools : NSObject

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsDownloadFilePathDispose:  ( 下载 文件 路径处理 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)czhNetworkingToolsDownloadFilePathDispose:(NSURL *)filePath;

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsGetDownloadFileName:  ( 取出 下载 文件名称 )
 *
 *  @param  filePath
 *
 *  @return NSString
 */
+ (NSString *)czhNetworkingToolsGetDownloadFileName:(NSURL *)filePath;

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsSetNetworkActivityIndicatorVisible:  ( 显示 或 隐藏 网络获取数据时 UINavigationBar 上的图标 <转圈的菊花 > )
 *
 *  @param  networkActivityIndicatorVisible
 */
+ (void)czhNetworkingToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible;

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsGetErrorMessage: ( 获取 错误信息 )
 *
 *  @param  error
 *
 *  @return NSString
 */
+ (NSString *)czhNetworkingToolsGetErrorMessage:(NSError *)error;

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingToolsRequestDispose:      ( 返回 网络 结果集 处理 )
 *
 *  @param  responseObject
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)czhNetworkingToolsRequestDispose:(id)responseObject;

@end
NS_ASSUME_NONNULL_END
