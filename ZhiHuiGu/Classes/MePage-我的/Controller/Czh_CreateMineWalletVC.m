//  文件名: Czh_CreateMineWalletVC.m
//  创建者: CYJ 时间: 2018/10/15.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_CreateMineWalletVC.h"
#import "RTNavigationBar.h"
#import "Czh_LoginBtn.h"
#import "Czh_RememberParticalVC.h"
#import "Czh_ImportWalletVC.h"

@interface Czh_CreateMineWalletVC ()

@end

@implementation Czh_CreateMineWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setUpBtn];
}
#pragma mark -- 添加导航栏
-(void)setNav{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    UINavigationBar *nav = [RTNavigationBar defaultBar];
    nav.barTintColor = [UIColor whiteColor];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"创建专属您的钱包"];
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"navigationButtonReturn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [left setImageEdgeInsets:UIEdgeInsetsMake(0, /*0*/-23, 0, 0)];
    [left addTarget:self action:@selector(onBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:left];
    [navigationItem setLeftBarButtonItem:leftBtn animated:NO];
    [nav pushNavigationItem:navigationItem animated:NO];
    [self.view addSubview:nav];
    
}
-(void)onBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setUpBtn{
    /**ios 11判断*/
    CGFloat kheight;
    if (@available(iOS 11.0, *)) {
        kheight = 120.f;
    }else{
        kheight = 84;
    }
    /**创建钱包*/
    Czh_LoginBtn *createWalletBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20, kheight, self.view.CZH_width-40, 40)];
    [createWalletBtn setTitle:@"创建钱包" forState:UIControlStateNormal];
    createWalletBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:createWalletBtn];
    [createWalletBtn addTarget:self action:@selector(createWalletBtnClick) forControlEvents:UIControlEventTouchUpInside];
    /**导入钱包*/
    Czh_LoginBtn *importBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(createWalletBtn.frame) + 20, self.view.CZH_width-40, 40)];
    [importBtn setTitle:@"导入钱包" forState:UIControlStateNormal];
    importBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:importBtn];
    [importBtn addTarget:self action:@selector(importBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)createWalletBtnClick{
    CZHLog(@"%s",__func__);
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *useridStr = [userDefaults stringForKey:kUserIDKey];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:useridStr forKey:@"user_id"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_GeneratetheWallet];
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:params WithSuccessBlock:^(id data) {
        CZHLog(@"验证码请求时的数据--------%@",data);
        if ([[NSString stringWithFormat:@"%@",data[@"code"]] isEqualToString:@"200"]) {
            
            NSArray *keypairsArr = [NSArray array];
            //获取keypairs
            keypairsArr = data[@"data"][@"keypairs"];
            //keypairs数组装JSON字符串
            NSString *keypairsArrToJSNStr = [self arrayToJsonString:keypairsArr];
            //单独获取address和seed
            NSDictionary *keypairsDict = [NSDictionary dictionary];
            keypairsDict = keypairsArr.firstObject;
            CZHLog(@"--------------------\n keypairsArrToJSNStr:%@",keypairsArrToJSNStr);
            [userDefaults setObject:data[@"data"][@"mnemonic"]  forKey:kUserMnemonicKey];
            [userDefaults setObject:keypairsDict[@"address"]  forKey:kUserAddressKey];
            [userDefaults setObject:keypairsDict[@"seed"]  forKey:kUserSeedKey];
            [userDefaults setObject:keypairsArr forKey:kUserKeypairsArr];
            [userDefaults setObject:keypairsArrToJSNStr forKey:kUserKeypairsArrToJson];
            [userDefaults synchronize];
            [self keypairsArrToJsonStrData];
        }
        else{
            [Czh_WarnWindow HUD:self.view andWarnText:@"创建钱包失败,请检查网络" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
        }
    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"验证码请求时失败返回的数据--------%@",error);
    } WithShowHudToView:self.view];
}
- (void)importBtnClick{
    CZHLog(@"%s",__func__);
    [self presentViewController:[Czh_ImportWalletVC new] animated:YES completion:nil];
}
#pragma mark -数组转换成json串
- (NSString *)arrayToJsonString:(NSArray *)array{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];;
}
#pragma mark -- keypairs加密结果
- (void)keypairsArrToJsonStrData {
#pragma mark keypairs加密结果
    //16位密匙（支付密码）
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *keypairsArrToJsonStr = [userDefaults objectForKey:kUserKeypairsArrToJson];
    NSString *payPdKeyStr = [userDefaults objectForKey:kUserPayPwdKey];
    NSData *keypairsCodeData = [keypairsArrToJsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSData *keypairsEncodeData = [keypairsCodeData AES128EncryptWithKey:payPdKeyStr];
    CZHLog(@"keypairs加密结果------%@",keypairsEncodeData);
    [userDefaults setObject:keypairsEncodeData  forKey:kUserKeypairsArrToJsonAES128];
#pragma mark seed加密结果
    NSString *seedStr = [userDefaults objectForKey:kUserSeedKey];
    NSData *seedCodeData = [seedStr dataUsingEncoding:NSUTF8StringEncoding];
    NSData *seedEncodeData = [seedCodeData AES128EncryptWithKey:payPdKeyStr];
    CZHLog(@"seed加密结果------%@",seedEncodeData);
    [userDefaults setObject:seedEncodeData  forKey:kUserSeedAES128];
#pragma mark mnemonic加密结果
    NSString *mnemonicStr = [userDefaults objectForKey:kUserMnemonicKey];
    NSData *mnemonicCodeData = [mnemonicStr dataUsingEncoding:NSUTF8StringEncoding];
    NSData *mnemonicEncodeData = [mnemonicCodeData AES128EncryptWithKey:payPdKeyStr];
    CZHLog(@"seed加密结果------%@",mnemonicEncodeData);
    [userDefaults setObject:mnemonicEncodeData  forKey:kUserMnemonicAES128];
    //#pragma mark 解密结果
    //NSData *decodeData = [encodeData AES128DecryptWithKey:payPdKeyStr];
    //NSData *decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    //CZHLog(@"解密结果------%@",decodeStr);
    [userDefaults synchronize];
    [Czh_WarnWindow HUD:self.view andWarnText:@"创建钱包成功" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    [self presentViewController:[Czh_RememberParticalVC new] animated:YES completion:nil];
}

@end
