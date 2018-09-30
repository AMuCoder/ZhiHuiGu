//
//  ZHGFriendsViewController.m
//  ZhiHuiGu
//
//  Created by CYJ on 2018/9/20.
//  Copyright © 2018年 CYJ. All rights reserved.
//

#import "ZHGFriendsViewController.h"
#import "ZHGClickBtnView.h"
#import "UIButton+CZHClickBtnBlock.h"

@interface ZHGFriendsViewController ()

@end

@implementation ZHGFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"朋友";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    ZHGClickBtnView *clickBtnView = [[ZHGClickBtnView alloc] initWithFrame:CGRectMake(0, 50, Main_Screen_Width, 200)];
    [self.view addSubview:clickBtnView];
    _clickBtnView = clickBtnView;
    // 直接用自定义视图里面的 button 调用刚才封装的方法
    
    [clickBtnView.closeArrow setClickBlock:^(UIButton *button) {
        self.view.backgroundColor = [UIColor blueColor];
        CZHLog(@"--------回调成功！");
        // 需要执行的操作
//        [self dismissViewControllerAnimated:YES completion:nil];
    } andEvent:UIControlEventTouchUpInside];
    
}


@end
