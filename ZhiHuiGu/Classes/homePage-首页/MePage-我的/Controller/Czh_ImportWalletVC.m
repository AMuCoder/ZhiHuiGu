//  文件名: Czh_ImportWalletVC.m
//  创建者: CYJ 时间: 2018/10/10.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "Czh_ImportWalletVC.h"
#import "RTNavigationBar.h"
#import "Czh_UILabel.h"
#import "CreateWalletPdView.h"
#import "Czh_LoginBtn.h"
#import "Czh_TabBarController.h"


@interface Czh_ImportWalletVC ()<UITextViewDelegate>
@property(nonatomic,strong) CreateWalletPdView *paypdView;
@property(nonatomic,strong) Czh_LoginBtn *ZJCImportBtn;
@property(nonatomic,strong) UITextView *textview;
@property(nonatomic,copy) NSString *payPdStr;//助记词，从本地获取
@property(nonatomic,copy) NSString *mnemonicStr;//助记词，从本地获取
@property(nonatomic,copy) NSString *byMnemonicStr;//用来对比mnemonicStr
@end

@implementation Czh_ImportWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self setupView];
}

-(void)setupView{
    
    _mnemonicStr = [Czh_AccountTool getUserMnemonic];
    _payPdStr    = [Czh_AccountTool getUserPayPWd];
    /**
     ios 11判断
     */
    CGFloat kheight;
    if (@available(iOS 11.0, *)) {
        kheight = 120.f;
    }else{
        kheight = 64;
    }
    
#pragma mark
    UILabel *label = [[Czh_UILabel alloc] initWithFrame:CGRectMake(10, kheight, Main_Screen_Width - 20, 44) labelTextColor:[UIColor blackColor] sizeFloat:20.f textAlignment:NSTextAlignmentCenter];
    label.text = @"请输入记助词";
    [self.view addSubview:label];
#pragma mark
    UITextView *textview = [[UITextView alloc]initWithFrame:CGRectMake(20,CGRectGetMaxY(label.frame) + 10,self.view.CZH_width - 40,150)];
    textview.backgroundColor=[UIColor lightGrayColor];//背景色
    textview.scrollEnabled=NO;//当文字超过视图的边框时是否允许滑动，默认为“YES”
    textview.editable=YES;//是否允许编辑内容，默认为“YES”
    textview.delegate=self;//设置代理方法的实现类
    textview.font=[UIFont fontWithName:@"Arial"size:15.0];//设置字体名字和字体大小;
    textview.returnKeyType=UIReturnKeyDefault;//return键的类型
    textview.keyboardType=UIKeyboardTypeDefault;//键盘类型
    textview.textAlignment=NSTextAlignmentLeft;//文本显示的位置默认为居左
    textview.dataDetectorTypes=UIDataDetectorTypeAll;//显示数据类型的连接模式（如电话号码、网址、地址等）
    textview.textColor= [UIColor whiteColor];
//    textview.text=@"UITextView详解";//设置显示的文本内容
    [self.view addSubview:textview];
    _textview = textview;
 #pragma mark
    CreateWalletPdView *paypdView = [[CreateWalletPdView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(textview.frame) + 10, self.view.frame.size.width - 20, 44) labelText:@"交易密码 :  " placeHolder:@"请输入交易密码"];
    [self.view addSubview:paypdView];
    _paypdView = paypdView;
    
#pragma mark
    Czh_LoginBtn *ZJCImportBtn = [[Czh_LoginBtn alloc] initWithFrame:CGRectMake(20,Main_Screen_Height - 84, Main_Screen_Width - 40, 44)];
    [ZJCImportBtn setTitle:@"导入助记词" forState:UIControlStateNormal];
    ZJCImportBtn.backgroundColor = MAIN_COLOR;
    [self.view addSubview:ZJCImportBtn];
    _ZJCImportBtn = ZJCImportBtn;
    [self.ZJCImportBtn addTarget:self action:@selector(ZJCImportBtnClick) forControlEvents:UIControlEventTouchUpInside];
#pragma mark
    //同意”免责声明及风险披露“
    UIButton *accpetBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMinY(self.ZJCImportBtn.frame) - 30, self.view.CZH_width -50, 20)];
    accpetBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    accpetBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"点击开始导入表示您同意《服务及隐私条款》"];
    NSRange allRange = {11,[str length]-11};
    NSDictionary *attrs = [NSDictionary dictionary];
    attrs = @{
              NSForegroundColorAttributeName:[UIColor orangeColor],
              };
    [str addAttributes:attrs range:allRange];
    [accpetBtn setAttributedTitle:str forState:UIControlStateNormal];
    [accpetBtn sizeToFit];
    [accpetBtn addTarget:self action:@selector(accpetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    accpetBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [self.view addSubview:accpetBtn];
#pragma mark
    UIButton *mnemonicBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.ZJCImportBtn.frame) + 10, self.view.CZH_width - 40, 20)];
    [mnemonicBtn setTitle:@"什么是助记词？" forState:UIControlStateNormal];
    [mnemonicBtn setTitleColor:[UIColor orangeColor]forState:UIControlStateNormal];
    mnemonicBtn.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [mnemonicBtn addTarget:self action:@selector(mnemonicBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mnemonicBtn];
    
}
-(void)accpetBtnClick{
    CZHLog(@"%s",__func__);
}-(void)mnemonicBtnClick{
    CZHLog(@"%s",__func__);
}
-(void)ZJCImportBtnClick{
    if (self.paypdView.textField.text.length == 0) {
         [Czh_WarnWindow HUD:self.view andWarnText:@"支付密码不能为空！" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    }else if(self.textview.text.length == 0){
        [Czh_WarnWindow HUD:self.view andWarnText:@"助记词输入错误！" andXoffset:0 andYoffset:Main_Screen_Width/5*3];
    }else{
        [self presentViewController:[Czh_TabBarController new] animated:YES completion:nil];
    }
    CZHLog(@"%s",__func__);
}

////将要开始编辑
//- (BOOL)textViewShouldBeginEditing:(UITextView*)textView{
//    return YES;
//}
////将要结束编辑
//- (BOOL)textViewShouldEndEditing:(UITextView*)textView{
//    return YES;
//}
//开始编辑
- (void)textViewDidBeginEditing:(UITextView*)textView{
    CZHLog(@"开始编辑--textViewDidBeginEditing--%@",textView.text);
}
//结束编辑
- (void)textViewDidEndEditing:(UITextView*)textView{
    CZHLog(@"结束编辑--textViewDidEndEditing--%@",textView.text);
    
}

//内容发生改变编辑
- (void)textViewDidChange:(UITextView*)textView{
    CZHLog(@"内容发生改变编辑--textViewDidChange--%@",textView.text);
}
//焦点发生改变
- (void)textViewDidChangeSelection:(UITextView *)textView{
    self.byMnemonicStr = textView.text;
    CZHLog(@"焦点发生改变--textViewDidChangeSelection--%@",self.byMnemonicStr);
}

//如果你的textview里不用回车键，可以把回车键当做退出键盘的响应键。
//内容将要发生改变编辑
-(BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text{
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark -- 添加导航栏
-(void)setNav{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController setNavigationBarHidden:YES];
    UINavigationBar *nav = [RTNavigationBar defaultBar];
    nav.barTintColor = [UIColor whiteColor];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"导入钱包"];
    UIButton* left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setFrame:CGRectMake(0, 0, 40, 40)];
    [left setImage:[[UIImage imageNamed:@"common_btn_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
