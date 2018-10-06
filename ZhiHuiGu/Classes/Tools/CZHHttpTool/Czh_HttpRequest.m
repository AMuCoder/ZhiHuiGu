//  文件名: Czh_HttpRequest.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：HttpRequest

#import "Czh_HttpRequest.h"

@implementation Czh_HttpRequest

+ (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
                WithToken:(NSString *)token
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(void (^)(id data))success
          WithFailurBlock:(void (^)(NSString *error))failure
        WithShowHudToView:(UIView *)view{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    MBProgressHUD *hub;
    if (view) {
        hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    NSString *tokerStr=[NSString stringWithFormat:@"%@",token];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:tokerStr forHTTPHeaderField:@"Authorization"];
    
    switch (method) {
        case GET:{
            //状态栏菊花
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (view) {
                    [MBProgressHUD hideHUDForView:view animated:YES];
                }
                NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                success(dic);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (hub) {
                    [hub hide:YES afterDelay:0.5];
                }
                NSString *ErrorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                NSData* errorData = [ErrorResponse dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:errorData options:NSJSONReadingMutableLeaves error:nil];
                CZHLog(@"错误消息为:%@",dic[@"error"]);
            }];
            break;
        }
        case POST:{
            //状态栏菊花
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
            [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (view) {
                    [MBProgressHUD hideHUDForView:view animated:YES];
                    
                }
                NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                success(dic);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (hub) {
                    [hub hide:YES afterDelay:0.5];
                }
                NSString *ErrorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                NSData* errorData = [ErrorResponse dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:errorData options:NSJSONReadingMutableLeaves error:nil];
                CZHLog(@"错误消息为:%@",dic[@"error"]);
            }];
            break;
        }
        case DELETE:{
            //状态栏菊花
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [manager DELETE:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (view) {
                    [MBProgressHUD hideHUDForView:view animated:YES];
                }
                success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                CZHLog(@"Error: %@", error);
            }];
        }break;
        case PUT:{
            [manager PUT:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
                if (success) {
                    //成功的操作
                    NSLog(@"%@",dict);
                    success(dict);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                CZHLog(@"Error: %@", error);
                // failure(error);
            }];
            
            
        }break;
        default:
            break;
    }
}


+(NSData *)imagesSynRequest:(NSString *)urlStr{
    //构建url对象
    NSURL *url=[NSURL URLWithString:urlStr];
    //2.构建请求基本配置
    NSURLRequest *requset=[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0f];
    //3.链接服务器  请求数据
    //sendSynchronousRequest  同步
    NSError *error = nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:requset returningResponse:nil error:&error];
    //'sendSynchronousRequest:returningResponse:error:' is deprecated: first deprecated in iOS 9.0 - Use [NSURLSession dataTaskWithRequest:completionHandler:] (see NSURLSession.h
    if (error!=nil) {
        //请求错误
        NSLog(@"%@",error);
    }else{
        return data;
    }
    
    return nil;
}

+(void)postSynRequest:(NSString *)urlStr
   andtimeoutInterval:(NSTimeInterval)times
            andParams:(NSDictionary *)paramDict
          andSucBlock:(SuccessBlock)sucBlock
         andFailBlock:(FailBlock)failBlock
{
    if (urlStr == nil || urlStr.length == 0)
    {
        return;
    }
    //构建url
    NSURL *url = [NSURL URLWithString:urlStr];
    //构建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:times];
    //设置请求类型
    request.HTTPMethod = @"POST";
    //设置参数
    request.HTTPBody = [self dictToData:paramDict];
    
    //第三步，连接服务器
    
    NSError *error = nil;
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (error!=nil) {
        //请求错误，调用错误代码块
        failBlock(error);
    }else{
        //请求成功 -- 数据解析-json
        //请求成功---解析数据
        id obj = [NSJSONSerialization JSONObjectWithData:received options:kNilOptions error:&error];
        if (error) {
            NSLog(@"解析出错！！");
        }else{
            //调用成功代码块
            sucBlock(obj);
        }
    }
}

+(NSData *)dictToData:(NSDictionary *)dict
{
    NSMutableString *paramStr = [NSMutableString new];
    NSArray *allKeys = [dict allKeys];
    //通过遍历，获取字典中的所有key 和 value
    for (int i=0; i<allKeys.count; i++)
    {
        NSString *strKey = allKeys[i];//获取key
        id value = dict[strKey];//通过key 获取值
        //字符串拼接
        NSString *str = [NSString stringWithFormat:@"%@=%@&",strKey,value];
        [paramStr appendString:str];
    }
    //移除字符串中最后一位 &
    NSRange range = NSMakeRange(paramStr.length - 1, 1);
    [paramStr deleteCharactersInRange:range];
    //字符串转成数据流对象
    return [paramStr dataUsingEncoding:NSUTF8StringEncoding];
}


@end
