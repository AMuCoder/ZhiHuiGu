//  文件名: CZHAFNetWorKingAssistant.m
//  创建者: CYJ 时间: 2018/9/30.
//  Copyright © 2018年 CYJ. All rights reserved.
//  AFNetworking单例封装

#import "CZHAFNetWorKingAssistant.h"
#import "AFNetworking.h"

#define ACCEPTTYPENORMAL @[@"application/json",@"application/xml",@"text/json",@"text/javascript",@"text/html",@"text/plain"]
#define ACCEPTTYPEIMAGE @[@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json"]

@interface CZHAFNetWorKingAssistant()

@property (strong,nonatomic)AFHTTPSessionManager *manager;

@end

@implementation CZHAFNetWorKingAssistant

+(CZHAFNetWorKingAssistant *)shareAssistant{
    static dispatch_once_t onceToken;
    static CZHAFNetWorKingAssistant *assistant = nil;
    if (assistant == nil) {
        dispatch_once(&onceToken, ^{
            assistant = [[CZHAFNetWorKingAssistant alloc]init];
        });
    }
    return assistant;
}

-(instancetype)init{
    if (self = [super init]) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_manager.requestSerializer setTimeoutInterval:10];
        [_manager.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"User-Agent"];
    }
    return self;
}

//常用网络请求方法
-(void)POSTWithCompleteURL:(NSString *)URLString
                parameters:(id)parameters
                  progress:(void(^)(id progress))progress
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure
                  useHTTPS:(BOOL)use{
    if (use) {
        [_manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    [self POSTWithCompleteURL:URLString parameters:parameters progress:progress success:success failure:failure];
}

//常用网络请求方法
-(void)POSTWithCompleteURL:(NSString *)URLString
                parameters:(id)parameters
                  progress:(void(^)(id progress))progress
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(NSError *error))failure{
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:ACCEPTTYPENORMAL];
    [_manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

-(void)GETWithCompleteURL:(NSString *)URLString
               parameters:(id)parameters
                 progress:(void(^)(id progress))progress
                  success:(void (^)(id responseObject))success
                  failure:(void (^)(NSError *error))failure{
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:ACCEPTTYPENORMAL];
    [_manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

/**
 *  图片上传
 *
 *  @param imgArr 图片数组
 *  @param block  返回图片地址数组
 */
- (void)uploadImagesWihtImgArr:(NSArray *)imgArr
                           url:(NSString *)url
                    parameters:(id)parameters
                         block:(void (^)(id objc,BOOL success))block{
    // 基于AFN3.0+ 封装的HTPPSession句柄
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:ACCEPTTYPEIMAGE];
    // 在parameters里存放照片以外的对象
    [_manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < imgArr.count; i++) {
            UIImage *image = imgArr[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            NSString *dateString = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            [formData appendPartWithFileData:imageData name:@"multipartFile" fileName:fileName mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject,YES);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,NO);
    }];
}


/**
 文件下载
 
 @param urlString 请求地址
 @param block 状态通知
 */
- (void)downFileWithUrl:(NSString *)urlString
                  block:(void (^)(id objc,BOOL success))block{
    // 2.设置请求的URL地址
    NSURL *url = [NSURL URLWithString:urlString];
    // 3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [_manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"当前下载进度为:%lf", 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 下载地址
        NSLog(@"默认下载地址%@",targetPath);
        // 设置下载路径,通过沙盒获取缓存地址,最后返回NSURL对象
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        return [NSURL fileURLWithPath:filePath]; // 返回的是文件存放在本地沙盒的地址
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        // 下载完成调用的方法
        NSLog(@"%@---%@", response, filePath);
        block(filePath,YES);
    }];
}

//是否加入HTTPS证书
-(AFSecurityPolicy *)customSecurityPolicy
{
    //先导入证书，找到证书的路径
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"cerName" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [NSSet setWithObjects:certData, nil];
    return securityPolicy;
}

-(void)cancelTask{
    [self.manager.operationQueue cancelAllOperations];
}



@end
