//
//  CzhNetworkingVariableType.m
//  阿木
//
//  Created by 阿木 on 16/5/13.
//  Copyright © 2016年 阿木. All rights reserved.
//

#import "CzhNetworkingVariableType.h"

@implementation CzhNetworkingVariableType

/*!
 *  @author 阿木
 *
 *  @brief  CzhDownloadProgress ( 快速初始化 表示下载进度的结构体 )
 *
 *  @param  czhFractionCompleted
 *
 *  @param  czhTotalUnitCount
 *
 *  @param  czhCompletedUnitCount
 *
 *  @return CzhDownloadProgress
 */
CzhDownloadProgress CzhDownloadProgressMake(double czhFractionCompleted, czh_int64_t czhTotalUnitCount, czh_int64_t czhCompletedUnitCount) {
    CzhDownloadProgress czhDownloadProgress;
    czhDownloadProgress.czhFractionCompleted  = czhFractionCompleted;
    czhDownloadProgress.czhTotalUnitCount     = czhTotalUnitCount;
    czhDownloadProgress.czhCompletedUnitCount = czhCompletedUnitCount;
    return czhDownloadProgress;
}

@end

