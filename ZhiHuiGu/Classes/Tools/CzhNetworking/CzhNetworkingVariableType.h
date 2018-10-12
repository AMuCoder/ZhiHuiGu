//
//  CzhNetworkingVariableType.h
//  阿木
//
//  Created by 阿木 on 16/5/13.
//  Copyright © 2016年 阿木. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CzhNetworkingVariableType : NSObject

typedef long long czh_int64_t;

/*! CzhNetworking 的请求成功 回调 Block !*/
typedef void(^CzhNetworkingSuccessHandle)(NSURLSessionDataTask *task, id resultObject);
/*! CzhNetworking 的请求失败 回调 Block !*/
typedef void(^CzhNetworkingErrorHandle)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);

/*! 表示 下载进度 结构体 !*/
struct CzhDownloadProgress {
    double      czhFractionCompleted;
    czh_int64_t czhTotalUnitCount;
    czh_int64_t czhCompletedUnitCount;
};
typedef struct CzhDownloadProgress CzhDownloadProgress;

/*!
 *  @author 阿木
 *
 *  @brief  CzhDownloadProgress ( 快速初始化 表示下载进度的结构体 )
 *
 *  @return CzhDownloadProgress
 */
CzhDownloadProgress CzhDownloadProgressMake(double czhFractionCompleted, czh_int64_t czhTotalUnitCount, czh_int64_t czhCompletedUnitCount);

/*! 网络状态  !*/
typedef NS_ENUM(NSInteger, CzhNetworkingReachabilityStatus) {
    CzhNetworkingReachabilityStatusUnknown          = -1,   /*! 未知网络    !*/
    CzhNetworkingReachabilityStatusNotReachable     = 0,    /*! 无网络      !*/
    CzhNetworkingReachabilityStatusReachableViaWWAN = 1,    /*! WWAN        !*/
    CzhNetworkingReachabilityStatusReachableViaWiFi = 2,    /*! WiFi        !*/
};

@end

NS_ASSUME_NONNULL_END
