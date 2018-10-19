//
//  Czh_FriendsViewController.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/20.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "Czh_FriendsViewController.h"
#import "Czh_ClickBtnView.h"
#import "UIButton+CZHClickBtnBlock.h"

@interface Czh_FriendsViewController ()
//@property (nonatomic, strong) CZHAFNetWorKingAssistant *afnetWorKingAssistant;
@end

@implementation Czh_FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"朋友";
    
    
//    Czh_ClickBtnView *clickBtnView = [[Czh_ClickBtnView alloc] initWithFrame:CGRectMake(0, 50, Main_Screen_Width, 200)];

     Czh_ClickBtnView *clickBtnView = [[Czh_ClickBtnView alloc] init];
    [self.view addSubview:clickBtnView];
    _clickBtnView = clickBtnView;
    _clickBtnView.sd_layout
    .leftSpaceToView(self.view, 40)
    .topSpaceToView(self.view, 50)
    .widthIs(Main_Screen_Width-80)
    .heightIs(40);
         /**/
    // 直接用自定义视图里面的 button 调用刚才封装的方法
    
    [clickBtnView.closeArrow setClickBlock:^(UIButton *button) {
        self.view.backgroundColor = [UIColor blueColor];
        CZHLog(@"--------回调成功！");
        // 需要执行的操作
//        [self dismissViewControllerAnimated:YES completion:nil];
    } andEvent:UIControlEventTouchUpInside];
    
    
    //http://api.map.baidu.com/telematics/v3/weather?location=嘉兴&output=json&ak=5slgyqGDENN7Sy7pw29IUvrZ
    //NSString *url = @"http://api.map.baidu.com/telematics/v3/weather?location";
    
    NSMutableDictionary *parametersDic = [NSMutableDictionary dictionary];
    [parametersDic setObject:@"chant0000" forKey:@"nick"];
    [parametersDic setObject:@"1881613652" forKey:@"tel"];
    [parametersDic setObject:@"qwe123456" forKey:@"pwd"];
    [parametersDic setObject:@"443443" forKey:@"verify_code"];
    NSString *url = [Czh_NetWorkURL returnURL:Interface_For_userRegister];
//    [CzhNetworking czhPOST:url parameters:parametersDic czhNetworkingSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
//        NSLog(@"resultObject---------------------------%@", resultObject);
//    } czhNetworkingError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
//        NSLog(@"afn***************************%@", errorMessage);
//    }];
    
    [Czh_HttpRequest requestWithMethod:POST WithPath:url WithToken:nil WithParams:parametersDic WithSuccessBlock:^(id data) {
        CZHLog(@"%@",data);
    } WithFailurBlock:^(NSString *error) {
        CZHLog(@"%@",error);
        [Czh_WarnWindow HUD:[UIApplication sharedApplication].keyWindow andWarnText:error andXoffset:0 andYoffset:Main_Screen_Width/2];
    } WithShowHudToView:self.view];
    /*
    {
        code = 200;
        data =     {
            Created = "2018-10-06 04:37:37";
            Email = "";
            Gender = "";
            HeadImg =         {
                String = "";
                Valid = 0;
            };
            Id = 27;
            Nick = chant0000;
            PayPwd = "";
            Pwd = aaf4236fa13d1bfacf1642951083a5eac688b26776d628c271c55cd98a18ba3d;
            Tel = 1881613652;
            Updated = "2018-10-06 04:37:37";
        };
        message = success;
    }
     */

}
/*
//json格式字符串转字典：
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

*/
@end
