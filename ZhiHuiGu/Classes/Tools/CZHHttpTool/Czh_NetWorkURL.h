//  文件名: Czh_NetWorkURL.h
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：//请求枚举

#import <Foundation/Foundation.h>

//请求枚举
typedef  enum
{
    
    
#pragma mark 智慧谷 -- User
    Interface_For_editAndSaveUserInformation,//用户信息编辑保存
    Interface_For_userLogin,//用户登陆
    Interface_For_userRegister,//用户注册用户更改支付密码
    Interface_For_editSavePaypwd,//用户更改支付密码//用户更改登陆密码
    Interface_For_editSavePwd,//用户更改登陆密码
    Interface_For_refreshToken,//刷新token
    
#pragma mark 智慧谷 -- Wallet
    Interface_For_activeUserWalletAddress,//激活用户钱包地址
    Interface_For_createKeypair,//创建数字密钥匙对, 助记词
    Interface_For_getMnemonic,//获取助记词
    Interface_For_walletPay,//支付- asset code 要相同
    Interface_For_settingsWallet,//数字钱包设定
    
#pragma mark 之前项目（先不删）
//    Interface_For_SecurityCode,//获取验证码
//    Interface_For_Register,//注册
//    Interface_For_UserInfo,//获取用户信息
//    Interface_For_option,//获取用户配置
//    Interface_For_report,//举报列表
//    Interface_For_workers,//获取职业列表
//    Interface_For_pair,//配对
//    Interface_For_Unpair,//取消配对
//    Interface_For_follow,//喜欢／不喜欢
//    Interface_For_getToken,//获取骑牛云token
//    Interface_For_UpdataVideo,//上传视频
//    Interface_For_topics,//话题
//    Interface_For_video,//获取视频信息
//    Interface_For_timing,//定时删除时间
//    Interface_For_latest,//获取用户最新视频
//    Interface_For_categories,//获取所有分类
//    Interface_For_contact,//判断给定手机号是否注册
//    Interface_For_pairs,//配对列表
//    Interface_For_messages,//系统消息
//    Interface_For_messageDelete,//删除消息
//    Interface_For_nearby,//获取用户附近视频
//    Interface_For_message,//极光推送
//    Interface_For_is_pair,//是否配对
//    Interface_For_is_read,//系统消息是否已读
//#pragma mark --
//    Interface_For_tiyantype,//体验分类
//    Interface_For_tiyanlists,//获取体验列表
//    Interface_For_tiyanDetail,//体验描述
//    Interface_For_aboutus,//关于我们
//    Interface_For_orderDetail,//订单信息
//    Interface_For_orderLists,//订单列表
//    Interface_For_addRate,//评价
//    Interface_For_collect,//收藏
//    Interface_For_tiyanCollect,//喜欢收藏
//    Interface_For_tiyanunlike,//取消收藏
//    Interface_For_orderappchange,//支付完成，修改订单状态
//    Interface_For_addOrder,//添加订单(达人体验购买订单)
//    Interface_For_getappMobile,//手机（是否存在）
//    Interface_For_bindappMobile,//绑定手机号
}Interface_Type;


@interface Czh_NetWorkURL : NSObject

+ (NSString *)returnURL:(Interface_Type)type;
//+ (NSString *)returnURL:(Interface_Type)type andID:(NSString *)ID;

@end
