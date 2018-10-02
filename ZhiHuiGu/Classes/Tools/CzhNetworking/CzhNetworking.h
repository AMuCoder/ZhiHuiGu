//
//  CzhNetworking.h
//  阿木
//
//  Created by 阿木 on 16/4/7.
//  Copyright © 2016年 阿木. All rights reserved.
//

#import <Foundation/Foundation.h>

/*! ---------------------- Tool       ---------------------- !*/
#import "AFNetworking.h"     // AFNetworking 网络库
#import "CzhNetworkingVariableType.h"     // 自定 参数
/*! ---------------------- Tool       ---------------------- !*/

NS_ASSUME_NONNULL_BEGIN

@interface CzhNetworking : NSObject


#pragma mark - CzhNetworking Tool Methods
/*!
 *  @author 阿木
 *
 *  @brief  czhPOST:parameters:czhResultSuccess:czhResultError:     ( 请求网络获取数据 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数     ( 和后台一致 )
 *
 *  @param  czhNetworkingSuccess            请求获取数据成功
 *
 *  @param  czhNetworkingError              请求获取数据失败
 */
+ (void)czhPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError;

/*!
 *  @author 阿木
 *
 *  @brief  czhPOSTAddFile:parameters:fileName:fileData:czhNetworkingSuccess:czhNetworkingError ( 请求网络获上传文件 单文件上传 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数          ( 可以传 nil )
 *
 *  @param  fileName                        请求 上传文件的名称          ( 和后台一致 )
 *
 *  @param  fileData                        请求 上传文件的数据流
 *
 *  @param  czhNetworkingSuccess            请求获取数据成功
 *
 *  @param  czhNetworkingError              请求获取数据失败
 *
 */
+ (void)czhPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError;

/*!
 *  @author 阿木
 *
 *  @brief  czhPOSTAddFiles:parameters:fileName:fileDatas:czhNetworkingSuccess:czhNetworkingError   ( 请求网络获上传文件 多文件上传, 文件名称相同使用该方法 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数          ( 可以传 nil )
 *
 *  @param  fileName                        请求 上传文件的名称          ( 和后台一致 )
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  czhNetworkingSuccess            请求获取数据成功
 *
 *  @param  czhNetworkingError              请求获取数据失败
 *
 */
+ (void)czhPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError;

/*!
 *  @author 阿木
 *
 *  @brief  czhPOSTAddWithFiles:parametersfileNames:fileDatas:czhNetworkingSuccess:czhNetworkingSuccess:czhNetworkingError: ( 请求网络获上传文件 多文件上传, 文件名称不相同相同使用该方法  <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数          ( 可以传 nil )
 *
 *  @param  fileNames                       请求 上传文件的名称数组      ( 和后台一致 )
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  czhNetworkingSuccess            请求获取数据成功
 *
 *  @param  czhNetworkingError              请求获取数据失败
 */
+ (void)czhPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError;

/*!
 *  @author 阿木
 *
 *  @brief  czhDownloadFile:czhDownloadProgress:czhCompletionHandler:   ( 请求网络 < 下载图片方法 > )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  czhDownloadProgress             下载进度
 *
 *  @param  czhCompletionHandler            下载回调    ( 成功 | 失败 回调, 成功 Error 为 nil )
 */
+ (void)czhDownloadFile:(NSString *)URLString czhDownloadProgress:(void(^)(CzhDownloadProgress czhDownloadProgress))czhDownloadProgress czhCompletionHandler:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))czhCompletionHandler;

/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingReachabilityStatusChangeBlock: ( 验证 网路 环境 )
 *
 *  @param  czhNetworkingStatus
 */
+ (void)czhNetworkingReachabilityStatusChangeBlock:(void(^)(CzhNetworkingReachabilityStatus czhResultStatus))czhResultStatus;

/*!
 *  @author 阿木
 *
 *  @brief czhAFNetworkingTest:parametersisEncrypt:  ( AFNetworking 测试方法 )
 *
 *  @param  URLString                   请求的 url
 *
 *  @param  parameters                  请求 需要传递的参数
 */
+ (void)czhAFNetworkingTest:(NSString *)URLString parameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
