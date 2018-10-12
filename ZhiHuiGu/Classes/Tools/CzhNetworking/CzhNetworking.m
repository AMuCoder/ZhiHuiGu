//
//  CzhNetworking.m
//  阿木
//
//  Created by 阿木 on 16/4/7.
//  Copyright © 2016年 阿木. All rights reserved.
//

#import "CzhNetworking.h"

/*! ---------------------- Tool       ---------------------- !*/
#import "CzhNetworkingTools.h"
/*! ---------------------- Tool       ---------------------- !*/

@interface CzhNetworking ()

/*! AFHTTPSessionManager 网络请求管理者对象 !*/
@property (nonatomic, strong) AFHTTPSessionManager *czhSessionManager;

@end

@implementation CzhNetworking


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
+ (void)czhPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError {
    
    // 初始化自定义网络请求类
    CzhNetworking        *czhNetworking = [CzhNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [czhNetworking.czhSessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [CzhNetworkingTools czhNetworkingToolsRequestDispose:responseObject];
        czhNetworkingSuccess(task, resultObject);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        czhNetworkingError(task, error, [CzhNetworkingTools czhNetworkingToolsGetErrorMessage:error]);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

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
+ (void)czhPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError {
    
    // 初始化自定义网络请求类
    CzhNetworking        *czhNetworking = [CzhNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    // 显示 状态栏 请求数据的菊花
    [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [czhNetworking.czhSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData name:fileName fileName:@"picture.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [CzhNetworkingTools czhNetworkingToolsRequestDispose:responseObject];
        czhNetworkingSuccess(task, resultObject);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        czhNetworkingError(task, error, [CzhNetworkingTools czhNetworkingToolsGetErrorMessage:error]);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

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
+ (void)czhPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError {
    
    // 初始化自定义网络请求类
    CzhNetworking        *czhNetworking = [CzhNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [czhNetworking.czhSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileName, i];
            [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [CzhNetworkingTools czhNetworkingToolsRequestDispose:responseObject];
        czhNetworkingSuccess(task, resultObject);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        czhNetworkingError(task, error, [CzhNetworkingTools czhNetworkingToolsGetErrorMessage:error]);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
}

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
+ (void)czhPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas czhNetworkingSuccess:(CzhNetworkingSuccessHandle)czhNetworkingSuccess czhNetworkingError:(CzhNetworkingErrorHandle)czhNetworkingError {
    
    // 初始化自定义网络请求类
    CzhNetworking        *czhNetworking = [CzhNetworking shareInstance];
    // 返回结果集
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    // 显示 状态栏 请求数据的菊花
    [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    // 发起请求
    [czhNetworking.czhSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            [formData appendPartWithFileData:fileDatas[i] name:fileNames[i] fileName:fileNames[i] mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [CzhNetworkingTools czhNetworkingToolsRequestDispose:responseObject];
        czhNetworkingSuccess(task, resultObject);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        czhNetworkingError(task, error, [CzhNetworkingTools czhNetworkingToolsGetErrorMessage:error]);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
}

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
+ (void)czhDownloadFile:(NSString *)URLString czhDownloadProgress:(void(^)(CzhDownloadProgress czhDownloadProgress))czhDownloadProgress czhCompletionHandler:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))czhCompletionHandler {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSMutableURLRequest       *request       = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    AFHTTPSessionManager      *manager       = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    // 发起 请求
    [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    NSURLSessionDownloadTask *downloadTask   = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        czhDownloadProgress(CzhDownloadProgressMake(downloadProgress.fractionCompleted, downloadProgress.totalUnitCount, downloadProgress.completedUnitCount));
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 返回 文件 路径
        NSURL *pathURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        return [pathURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSString *downloadFilePath = [CzhNetworkingTools czhNetworkingToolsDownloadFilePathDispose:filePath];
        if (error) [[NSFileManager defaultManager] removeItemAtPath:downloadFilePath error:nil];
        czhCompletionHandler(downloadFilePath, [CzhNetworkingTools czhNetworkingToolsGetDownloadFileName:filePath], [CzhNetworkingTools czhNetworkingToolsGetErrorMessage:error]);
        [CzhNetworkingTools czhNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
    // 开始 请求
    [downloadTask resume];
}


/*!
 *  @author 阿木
 *
 *  @brief  czhNetworkingReachabilityStatusChangeBlock: ( 验证 网路 环境 )
 *
 *  @param  czhNetworkingStatus
 */
+ (void)czhNetworkingReachabilityStatusChangeBlock:(void(^)(CzhNetworkingReachabilityStatus czhNetworkingStatus))czhNetworkingStatus {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                czhNetworkingStatus(CzhNetworkingReachabilityStatusUnknown);
                break;
            case AFNetworkReachabilityStatusNotReachable:
                czhNetworkingStatus(CzhNetworkingReachabilityStatusNotReachable);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                czhNetworkingStatus(CzhNetworkingReachabilityStatusReachableViaWWAN);
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                czhNetworkingStatus(CzhNetworkingReachabilityStatusReachableViaWiFi);
                break;
            default:
                break;
        }
    }];
}


/*!
 *  @author 阿木
 *
 *  @brief czhAFNetworkingTest:parametersisEncrypt:  ( AFNetworking 测试方法 )
 *
 *  @param  URLString                   请求的 url
 *
 *  @param  parameters                  请求 需要传递的参数
 */
+ (void)czhAFNetworkingTest:(NSString *)URLString parameters:(NSDictionary *)parameters {
    NSLog(@"This is AFNetworking Test Method");
}

#pragma mark - Init CzhNetworking Method
/*!
 *  @author 阿木, 2016-04-07 14:03:50
 *
 *  @brief  shareInstance       ( 单利 快速初始化一个 CzhNetworking )
 *
 *  @return CzhNetworking
 */
+ (instancetype)shareInstance {
    
    static CzhNetworking *czhNetworking = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        czhNetworking = [[self alloc] init];
    });
    return czhNetworking;
}
/*!
 *  @author 阿木, 2016-04-07 14:05:24
 *
 *  @brief  init    ( Init Override )
 *
 *  @return czhNetworking
 */
- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
}


#pragma Init AFHTTPSessionManager Method
- (AFHTTPSessionManager *)czhSessionManager {
    
    if (!_czhSessionManager) {
        _czhSessionManager                    = [AFHTTPSessionManager manager];
        _czhSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_czhSessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/css", @"text/javascript", nil]];
    }
    return _czhSessionManager;
}




@end
