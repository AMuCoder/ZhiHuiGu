//
//  ZHGFriendsViewController.m
//  ZhiHuiGu
//
//  Created by 阿木 on 2018/9/20.
//  Copyright © 2018年 阿木. All rights reserved.
//

#import "ZHGFriendsViewController.h"
#import "ZHGClickBtnView.h"
#import "UIButton+CZHClickBtnBlock.h"

@interface ZHGFriendsViewController ()
//@property (nonatomic, strong) CZHAFNetWorKingAssistant *afnetWorKingAssistant;
@end

@implementation ZHGFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"朋友";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
//    ZHGClickBtnView *clickBtnView = [[ZHGClickBtnView alloc] initWithFrame:CGRectMake(0, 50, Main_Screen_Width, 200)];

     ZHGClickBtnView *clickBtnView = [[ZHGClickBtnView alloc] init];
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
//    NSString *url = @"http://api.map.baidu.com/telematics/v3/weather?location";
    NSDictionary *parameters = @{
                                 @"email": @"czh588@126.com",
                                 @"gender": @"string",
                                 @"head_img": @"string",
                                 @"id": @0,
                                 @"nick": @"amu2018"
                                 };
    NSString *url = [NSString stringWithFormat:@"%@/%@",CZH_MainURL,@"/v1/user/edit"];
    [CzhNetworking czhPOST:url parameters:parameters czhNetworkingSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        NSLog(@"resultObject---------------------------%@", resultObject);
        NSDictionary *dict = resultObject;
        NSLog(@"%@",dict[@"message"]);
        NSLog(@"%@",dict[@"status"]);
    } czhNetworkingError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        NSLog(@"afn***************************%@", errorMessage);
    }];
}

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
@end
