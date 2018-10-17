//  文件名: Czh_NetWorkURL.m
//  创建者: CYJ 时间: 2018/10/6.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_NetWorkURL.h"

#define LoginOrRegister @"http://juepei.oldlooker.com/v1"

@implementation Czh_NetWorkURL

+ (NSString *)returnURL:(Interface_Type)type
{
    NSString *url;
    switch (type) {
        case Interface_For_editAndSaveUserInformation:{
            url=[NSString stringWithFormat:@"%@/v1/user/edit",CZH_MainURL];
            CZHLog(@"用户信息编辑保存%@",url);
        }break;
        case Interface_For_RetrieveLoginPassword:{
            url=[NSString stringWithFormat:@"%@/v1/user/find-pwd",CZH_MainURL];
            CZHLog(@"找回登陆密码%@",url);
        }break;
        case Interface_For_GET_AccessUserDigitalWalletAssets:{
            url=[NSString stringWithFormat:@"%@/v1/user/get-wallets",CZH_MainURL];
            CZHLog(@"获取用户数字钱包的资产情况%@",url);
        }break;
        case Interface_For_userLogin:{
            url=[NSString stringWithFormat:@"%@/v1/user/login",CZH_MainURL];
            CZHLog(@"用户登陆%@",url);
        }break;
        case Interface_For_userRegister:{
            url=[NSString stringWithFormat:@"%@/v1/user/register",CZH_MainURL];
            CZHLog(@"用户注册%@",url);
        }break;
        case Interface_For_editSavePaypwd:{
            url=[NSString stringWithFormat:@"%@/v1/user/save-paypwd",CZH_MainURL];
            CZHLog(@"用户更改支付密码%@",url);
        }break;
        case Interface_For_editSavePwd:{
            url=[NSString stringWithFormat:@"%@/v1/user/save-paypwd",CZH_MainURL];
            CZHLog(@"用户更改登陆密码%@",url);
        }break;
        case Interface_For_refreshToken:{
            url=[NSString stringWithFormat:@"%@/v1/user/token",CZH_MainURL];
            CZHLog(@"刷新token%@",url);
        }break;
            //
        case Interface_For_SendVerificationCode:{
            url=[NSString stringWithFormat:@"%@/v1/user/sms",CZH_MainURL];
            CZHLog(@"验证码%@",url);
        }break;
        case Interface_For_AddFriendURL:{
            url=[NSString stringWithFormat:@"%@/v1/user/add-friend",CZH_MainURL];
            CZHLog(@"添加好友%@",url);
        }break;
        case Interface_For_ApplyKycURL:{
            url=[NSString stringWithFormat:@"%@/v1/user/apply-kyc",CZH_MainURL];
            CZHLog(@"提交申请KYC实名认证信息%@",url);
        }break;
        case Interface_For_GetUserInfoURL:{
            url=[NSString stringWithFormat:@"%@/v1/user/get",CZH_MainURL];
            CZHLog(@"获取用户信息%@",url);
        }break;
        case Interface_For_GetUserKYCURL:{
            url=[NSString stringWithFormat:@"%@/v1/user/kyc",CZH_MainURL];
            CZHLog(@"获取用户KYC认证信息%@",url);
        }break;
        case Interface_For_RemoveUserURL:{
            url=[NSString stringWithFormat:@"%@/v1/user/remove",CZH_MainURL];
            CZHLog(@"删除用户%@",url);
        }break;
        case Interface_For_ChangeUserPwdURL:{
            url=[NSString stringWithFormat:@"%@/v1/user/change-pwd",CZH_MainURL];
            CZHLog(@"用户更改登陆密码%@",url);
        }break;
        case Interface_For_ChangeUserTelURL:{
            url=[NSString stringWithFormat:@"%@/v1/user/change-tel",CZH_MainURL];
            CZHLog(@"用户更改手机号码%@",url);
        }break;
            
#pragma mark 智慧谷 -- Wallet
            
        case Interface_For_activeUserWalletAddress:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/active",CZH_MainURL];
            CZHLog(@"激活用户钱包地址%@",url);
        }break;
        case Interface_For_createKeypair:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/create-keypair",CZH_MainURL];
            CZHLog(@"创建数字密钥匙对, 助记词%@",url);
        }break;
        case Interface_For_getMnemonic:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/get-mnemonic",CZH_MainURL];
            CZHLog(@"获取助记词%@",url);
        }break;
        case Interface_For_walletPay:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/pay",CZH_MainURL];
            CZHLog(@"支付- asset code 要相同%@",url);
        }break;
        case Interface_For_settingsWallet:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/settings",CZH_MainURL];
            CZHLog(@"数字钱包设定%@",url);
        }break;
        case Interface_For_closeAseetUrl:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/close-asset",CZH_MainURL];
            CZHLog(@"取消信任资产%@",url);
        }break;
        case Interface_For_trustAseetUrl:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/trust-asset",CZH_MainURL];
            CZHLog(@"信任资产%@",url);
        }break;
#pragma mark 智慧谷 -- asset
        case Interface_For_AcquisitionSystemAssets:{
            url=[NSString stringWithFormat:@"%@/v1/asset/top",CZH_MainURL];
            CZHLog(@"获取系统资产%@",url);
        }break;
        case Interface_For_GeneratetheWallet:{
            url=[NSString stringWithFormat:@"%@/v1/wallet/create",CZH_MainURL];
            CZHLog(@"生成钱包%@",url);
        }break;
            
            
#pragma mark 之前项目（先不删）
            /*
        case Interface_For_SecurityCode:{
            url=[NSString stringWithFormat:@"%@/sms",CZH_MainURL];
            CZHLog(@"获取验证码%@",url);
        }break;
        case Interface_For_Register:{
            url=[NSString stringWithFormat:@"%@/user",CZH_MainURL];
            CZHLog(@"注册%@",url);
        }break;
        case Interface_For_UserInfo:{
            url=[NSString stringWithFormat:@"%@/user",CZH_MainURL];
            CZHLog(@"获取用户信息%@",url);
        }break;
        case Interface_For_option:{
            url=[NSString stringWithFormat:@"%@/user",CZH_MainURL];
            CZHLog(@"获取用户配置信息%@",url);
        }break;
        case Interface_For_report:{
            url=[NSString stringWithFormat:@"%@/report",CZH_MainURL];
            CZHLog(@"获取举报列表%@",url);
        }break;
        case Interface_For_workers:{
            url=[NSString stringWithFormat:@"%@/workers",CZH_MainURL];
            CZHLog(@"获取职业列表%@",url);
        }break;
        case Interface_For_pair:{
            url=[NSString stringWithFormat:@"%@/pair",CZH_MainURL];
            CZHLog(@"配对/取消配对%@",url);
        }break;
        case Interface_For_follow:{
            url=[NSString stringWithFormat:@"%@/follow",CZH_MainURL];
            CZHLog(@"喜欢／不喜欢%@",url);
        }break;
        case Interface_For_getToken:{
            url=[NSString stringWithFormat:@"%@/token",CZH_MainURL];
            CZHLog(@"获取七牛云token%@",url);
        }break;
        case Interface_For_UpdataVideo:{
            url=[NSString stringWithFormat:@"%@/video",CZH_MainURL];
            CZHLog(@"上传视频%@",url);
        }break;
        case Interface_For_topics:{
            url=[NSString stringWithFormat:@"%@/topics",CZH_MainURL];
            CZHLog(@"获取话题%@",url);
        }break;
        case Interface_For_timing:{
            url=[NSString stringWithFormat:@"%@/timing",CZH_MainURL];
            CZHLog(@"定时删除时间%@",url);
        }break;
        case Interface_For_categories:{
            url=[NSString stringWithFormat:@"%@/categories",CZH_MainURL];
            CZHLog(@"获取所有分类%@",url);
        }break;
        case Interface_For_contact:{
            url=[NSString stringWithFormat:@"%@/contact",CZH_MainURL];
            CZHLog(@"判断给定手机号是否注册%@",url);
        }break;
        case Interface_For_nearby:{
            url=[NSString stringWithFormat:@"%@/nearby",CZH_MainURL];
            CZHLog(@"获取用户附近视频%@",url);
        }break;
        case Interface_For_message:{
            url=[NSString stringWithFormat:@"%@/message",CZH_MainURL];
            CZHLog(@"推送消息接口%@",url);
        }break;
        case Interface_For_Unpair:{
            url=[NSString stringWithFormat:@"%@/unpair",CZH_MainURL];
            CZHLog(@"取消配对%@",url);
        }break;
        case Interface_For_is_pair:{
            url=[NSString stringWithFormat:@"%@/is_pair",CZH_MainURL];
            CZHLog(@"是否配对%@",url);
        }break;
            */
        default:
            break;
    }
    return url;
}

    /*
+ (NSString *)returnURL:(Interface_Type)type andID:(NSString *)ID
{

    NSString *url;
    switch (type) {
        case Interface_For_SecurityCode:{
            url=[NSString stringWithFormat:@"%@/sms",CZH_MainURL];
            CZHLog(@"获取验证码%@",url);
        }break;
        case Interface_For_Register:{
            url=[NSString stringWithFormat:@"%@/user",CZH_MainURL];
            CZHLog(@"注册%@",url);
        }break;
        case Interface_For_UserInfo:{
            url=[NSString stringWithFormat:@"%@/user/%@",CZH_MainURL,ID];
            CZHLog(@"获取用户信息%@",url);
        }break;
        case Interface_For_option:{
            url=[NSString stringWithFormat:@"%@/user/%@/option",CZH_MainURL,ID];
            CZHLog(@"获取用户配置信息%@",url);
        }break;
        case Interface_For_videos:{
            url=[NSString stringWithFormat:@"%@/user/%@/videos",CZH_MainURL,ID];
            CZHLog(@"获取历史视频%@",url);
        }break;
        case Interface_For_video:{
            url=[NSString stringWithFormat:@"%@/video/%@",CZH_MainURL,ID];
            CZHLog(@"获取视频信息%@",url);
        }break;
        case Interface_For_latest:{
            url=[NSString stringWithFormat:@"%@/user/%@/video/latest",CZH_MainURL,ID];
            CZHLog(@"获取用户最新视频%@",url);
        }break;
        case Interface_For_pairs:{
            url=[NSString stringWithFormat:@"%@/user/%@/pairs",CZH_MainURL,ID];
            CZHLog(@"获取用户所有配对%@",url);
        }break;
        case Interface_For_messages:{
            url=[NSString stringWithFormat:@"%@/user/%@/messages",CZH_MainURL,ID];
            CZHLog(@"用户系统消息%@",url);
        }break;
        case Interface_For_messageDelete:{
            url=[NSString stringWithFormat:@"%@/message/%@/delete",CZH_MainURL,ID];
            CZHLog(@"删除系统消息%@",url);
        }break;
        case Interface_For_is_read:{
            url=[NSString stringWithFormat:@"%@/read/%@",CZH_MainURL,ID];
            CZHLog(@"是否已读系统消息%@",url);
        }break;
        default:
            break;
    }
    return url;
}
*/
@end
