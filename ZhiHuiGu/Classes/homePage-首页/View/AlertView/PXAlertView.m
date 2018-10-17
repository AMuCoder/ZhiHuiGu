//  文件名: PXAlertView.m
//  创建者: CYJ 时间: 2018/10/11.
//  Copyright © 2018年 阿木. All rights reserved..
//  用途：

#import "PXAlertView.h"

@interface PXAlertViewQueue : NSObject

@property (nonatomic) NSMutableArray *alertViews;

+ (PXAlertViewQueue *)sharedInstance;

- (void)add:(PXAlertView *)alertView;
- (void)remove:(PXAlertView *)alertView;

@end

static const CGFloat AlertViewWidth = 270.0;
static const CGFloat AlertViewVerticalElementSpace = 10;
static const CGFloat AlertViewButtonHeight = 44;

@interface PXAlertView ()<UITextFieldDelegate>

@property (nonatomic,strong) UIWindow *mainWindow;
@property (nonatomic,strong) UIWindow *alertWindow;
@property (nonatomic,strong) UIView *backgroundView;
@property (nonatomic,strong) UIView *alertView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UILabel *messageLabel;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *otherButton;
@property (nonatomic,strong) UITapGestureRecognizer *tap;
//收款弹窗
@property(nonatomic,strong) UIImageView *headImage;//头像
@property(nonatomic,strong) UILabel *nameWalletLabel;//钱包名称
@property(nonatomic,strong) UILabel *adressWalletLabel;//钱包地址
@property(nonatomic,strong) UILabel *currencyLabel;//币种
@property(nonatomic,strong) UIImageView *QrcodeImageView;//二维码
@property(nonatomic,strong) UIButton *replacementBtn;
@property(nonatomic,strong) UIButton *setCountBtn;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UIView *nameWalletView;
@property(nonatomic,strong) UIView *QrcodeView;
//设置金额
@property(nonatomic,strong) UILabel *EnterAmountLabel;
@property(nonatomic,strong) UITextField *EnterAmountTextField;

@property (nonatomic, strong) void (^completion)(BOOL cancelled);

@end

@implementation PXAlertView

- (UIWindow *)windowWithLevel:(UIWindowLevel)windowLevel
{
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (window.windowLevel == windowLevel) {
            return window;
        }
    }
    return nil;
}
- (id)initAlertWithWalletNameTitle:(NSString *)nameTitle
                WalletAddressTitle:(NSString *)addressTitle
               WalletCurrencyTitle:(NSString *)currencyTitle
                         HeadImage:(NSString *)qrcodeImage
                       QrcodeImage:(NSString *)headImage
                       cancelTitle:(NSString *)cancelTitle
                        otherTitle:(NSString *)otherTitle
                        completion:(void(^) (BOOL cancelled))completion
{
    self = [super init];
    if (self) {
        _mainWindow = [self windowWithLevel:UIWindowLevelNormal];
        _alertWindow = [self windowWithLevel:UIWindowLevelAlert];
        if (!_alertWindow) {
            _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
            _alertWindow.windowLevel = UIWindowLevelAlert;
        }
        self.frame = _alertWindow.bounds;
        
        _backgroundView = [[UIView alloc] initWithFrame:_alertWindow.bounds];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
        _backgroundView.alpha = 0;
        [self addSubview:_backgroundView];
        
        _alertView = [[UIView alloc] init];
        _alertView.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
        _alertView.backgroundColor = [UIColor clearColor];
        _alertView.layer.cornerRadius = 8.0;
        _alertView.layer.opacity = .95;
        _alertView.clipsToBounds = YES;
        [self addSubview:_alertView];
        
        _nameWalletView = [[UIView alloc] initWithFrame:CGRectMake(0, 25, AlertViewWidth, 83)];
        _nameWalletView.backgroundColor = [UIColor lightGrayColor];
        _nameWalletView.layer.cornerRadius = 5;
        [_alertView addSubview:_nameWalletView];
        
        _nameWalletLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, AlertViewWidth, 20)];
        _nameWalletLabel.text = nameTitle;
        _nameWalletLabel.numberOfLines = 0;
        _nameWalletLabel.textColor = [UIColor blackColor];
        _nameWalletLabel.font = [UIFont boldSystemFontOfSize:15];
        _nameWalletLabel.textAlignment = NSTextAlignmentCenter;
        [_nameWalletView addSubview:_nameWalletLabel];
        //_nameWalletLabel.backgroundColor = [UIColor blueColor];
        
        _adressWalletLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, AlertViewWidth, 20)];
        _adressWalletLabel.text = addressTitle;
        _adressWalletLabel.numberOfLines = 0;
        _adressWalletLabel.font = [UIFont boldSystemFontOfSize:15];
        _adressWalletLabel.textColor = [UIColor blackColor];
        _adressWalletLabel.textAlignment = NSTextAlignmentCenter;
        //_adressWalletLabel.backgroundColor = [UIColor blueColor];
        [_nameWalletView addSubview:_adressWalletLabel];
        
#pragma mark --
        _QrcodeView = [[UIView alloc] initWithFrame:CGRectMake(0, 105, AlertViewWidth, 264)];
        CZHLog(@"self.alertView.frame.size.height---%f",self.alertView.frame.size.height);
        _QrcodeView.backgroundColor = [UIColor whiteColor];
        [_alertView addSubview:_QrcodeView];
        
        _currencyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, AlertViewWidth, 20)];
        _currencyLabel.text = currencyTitle;
        _currencyLabel.numberOfLines = 0;
        _currencyLabel.textAlignment = NSTextAlignmentCenter;
//        _currencyLabel.backgroundColor = [UIColor blueColor];
        _currencyLabel.font = [UIFont boldSystemFontOfSize:15];
        _currencyLabel.textColor = [UIColor blackColor];
        [_QrcodeView addSubview:_currencyLabel];
        
        _QrcodeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(AlertViewWidth/2 - 80, 30, 160, 160)];
        _QrcodeImageView.image = [UIImage imageNamed:qrcodeImage];
        _QrcodeImageView.backgroundColor = [UIColor grayColor];
        [_QrcodeView addSubview:_QrcodeImageView];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 195, AlertViewWidth, 20)];
        _label.text = @"无需添加好友，扫二维码向我付款";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont boldSystemFontOfSize:14];
        _label.textColor = [UIColor blackColor];
//        _label.backgroundColor = [UIColor blueColor];
        [_QrcodeView addSubview:_label];
        
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(AlertViewWidth/2 - 25, 0, 50, 50)];
        _headImage.image = [UIImage imageNamed:headImage];
        _headImage.backgroundColor = [UIColor orangeColor];
        _headImage.layer.masksToBounds = YES;
        _headImage.layer.cornerRadius = 25;
        [_alertView addSubview:_headImage];
        // Line
        CALayer *lineLayer = [CALayer layer];
        lineLayer.backgroundColor = [[UIColor colorWithWhite:0.90 alpha:0.3] CGColor];
        lineLayer.frame = CGRectMake(0, 325, AlertViewWidth, 0.5);
        [_alertView.layer addSublayer:lineLayer];
        
        // Buttons
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (cancelTitle) {
            [_cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
        } else {
            [_cancelButton setTitle:NSLocalizedString(@"Ok", nil) forState:UIControlStateNormal];
        }
        _cancelButton.backgroundColor = [UIColor whiteColor];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor colorWithWhite:0.25 alpha:1] forState:UIControlStateHighlighted];
        [_cancelButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        [_cancelButton addTarget:self action:@selector(setBackgroundColorForButton:) forControlEvents:UIControlEventTouchDown];
        [_cancelButton addTarget:self action:@selector(clearBackgroundColorForButton:) forControlEvents:UIControlEventTouchDragExit];


        if (otherTitle) {
            _cancelButton.titleLabel.font = [UIFont systemFontOfSize:17];
            _cancelButton.frame = CGRectMake(0, 325.5, AlertViewWidth/2, 44);
            
            _otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_otherButton setTitle:otherTitle forState:UIControlStateNormal];
            _otherButton.backgroundColor = [UIColor orangeColor];
            _otherButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
            [_otherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_otherButton setTitleColor:[UIColor colorWithWhite:0.25 alpha:1] forState:UIControlStateHighlighted];
            [_otherButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
            [_otherButton addTarget:self action:@selector(setBackgroundColorForButton:) forControlEvents:UIControlEventTouchDown];
            [_otherButton addTarget:self action:@selector(clearBackgroundColorForButton:) forControlEvents:UIControlEventTouchDragExit];
            
            _otherButton.frame = CGRectMake(AlertViewWidth/2, 325.5, AlertViewWidth/2, 44);
            [self.alertView addSubview:_otherButton];
            
            CALayer *lineLayer = [CALayer layer];
            lineLayer.backgroundColor = [[UIColor colorWithWhite:0.90 alpha:0.3] CGColor];
            lineLayer.frame = CGRectMake(AlertViewWidth/2-0.25, 325.5, 0.5, 44);
            [_alertView.layer addSublayer:lineLayer];
            
        } else {
            _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
            _cancelButton.frame = CGRectMake(0, 326, AlertViewWidth, AlertViewButtonHeight);
        }
        
        [_alertView addSubview:_cancelButton];
        _alertView.frame = CGRectMake(0, 0, AlertViewWidth, 369);
        if (completion) {
            _completion = completion;
        }
        
        [self setupGestures];
        //[self resizeViews];
        
        _alertView.center = CGPointMake(CGRectGetMidX(_alertWindow.bounds), CGRectGetMidY(_alertWindow.bounds));
    }
    return self;
}

- (id)initAlertWithTitle:(NSString *)title
EnterAmountTextFieldText:(NSString *)fieldText
EnterAmountTextFieldHolder:(NSString *)placeHolder
             cancelTitle:(NSString *)cancelTitle
              otherTitle:(NSString *)otherTitle
              completion:(void(^) (BOOL cancelled))completion
{
    self = [super init];
    if (self) {
        _mainWindow = [self windowWithLevel:UIWindowLevelNormal];
        _alertWindow = [self windowWithLevel:UIWindowLevelAlert];
        if (!_alertWindow) {
            _alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
            _alertWindow.windowLevel = UIWindowLevelAlert;
        }
        self.frame = _alertWindow.bounds;
        
        _backgroundView = [[UIView alloc] initWithFrame:_alertWindow.bounds];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
        _backgroundView.alpha = 0;
        [self addSubview:_backgroundView];
        
        _alertView = [[UIView alloc] init];
        _alertView.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.layer.cornerRadius = 8.0;
        _alertView.layer.opacity = .95;
        _alertView.clipsToBounds = YES;
        [self addSubview:_alertView];
        
        _EnterAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, AlertViewWidth-40, 20)];
        _EnterAmountLabel.text = title;
        _EnterAmountLabel.backgroundColor = [UIColor whiteColor];
        _EnterAmountLabel.textAlignment = NSTextAlignmentLeft;
        _EnterAmountLabel.font = [UIFont boldSystemFontOfSize:18];
        _EnterAmountLabel.textColor = [UIColor blackColor];
        [_alertView addSubview:_EnterAmountLabel];
        
        _EnterAmountTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, AlertViewWidth-40, 44)];
        _EnterAmountTextField.backgroundColor = [UIColor whiteColor];
        _EnterAmountTextField.text = fieldText;
        _EnterAmountTextField.textAlignment = NSTextAlignmentLeft;
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _EnterAmountTextField.clearButtonMode = UITextFieldViewModeAlways;
        _EnterAmountTextField.delegate = self;
        _EnterAmountTextField.textColor = [UIColor blackColor];
        _EnterAmountTextField.placeholder = placeHolder;
        [_alertView addSubview:_EnterAmountTextField];
        // Line
        CALayer *lineLayer = [CALayer layer];
        lineLayer.backgroundColor = [[UIColor colorWithWhite:0.90 alpha:0.3] CGColor];
        lineLayer.frame = CGRectMake(0, 89, AlertViewWidth, 0.5);
        [_alertView.layer addSublayer:lineLayer];
        
        // Buttons
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (cancelTitle) {
            [_cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
        } else {
            [_cancelButton setTitle:NSLocalizedString(@"Ok", nil) forState:UIControlStateNormal];
        }
        _cancelButton.backgroundColor = [UIColor whiteColor];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor colorWithWhite:0.25 alpha:1] forState:UIControlStateHighlighted];
        [_cancelButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        [_cancelButton addTarget:self action:@selector(setBackgroundColorForButton:) forControlEvents:UIControlEventTouchDown];
        [_cancelButton addTarget:self action:@selector(clearBackgroundColorForButton:) forControlEvents:UIControlEventTouchDragExit];
        
        
        if (otherTitle) {
            _cancelButton.titleLabel.font = [UIFont systemFontOfSize:17];
            _cancelButton.frame = CGRectMake(0, 89.5, AlertViewWidth/2, 44);
            
            _otherButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_otherButton setTitle:otherTitle forState:UIControlStateNormal];
            _otherButton.backgroundColor = [UIColor orangeColor];
            _otherButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
            [_otherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_otherButton setTitleColor:[UIColor colorWithWhite:0.25 alpha:1] forState:UIControlStateHighlighted];
            [_otherButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
            [_otherButton addTarget:self action:@selector(setBackgroundColorForButton:) forControlEvents:UIControlEventTouchDown];
            [_otherButton addTarget:self action:@selector(clearBackgroundColorForButton:) forControlEvents:UIControlEventTouchDragExit];
            
            _otherButton.frame = CGRectMake(AlertViewWidth/2, 89.5, AlertViewWidth/2, 44);
            [self.alertView addSubview:_otherButton];
            
            CALayer *lineLayer = [CALayer layer];
            lineLayer.backgroundColor = [[UIColor colorWithWhite:0.90 alpha:0.3] CGColor];
            lineLayer.frame = CGRectMake(AlertViewWidth/2-0.25, 325.5, 0.5, 44);
            [_alertView.layer addSublayer:lineLayer];
            
        } else {
            _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
            _cancelButton.frame = CGRectMake(0, 89.5, AlertViewWidth, AlertViewButtonHeight);
        }
        
        [_alertView addSubview:_cancelButton];
        _alertView.frame = CGRectMake(0, 0, AlertViewWidth, 133.5);
        if (completion) {
            _completion = completion;
        }
        
        [self setupGestures];
        
        _alertView.center = CGPointMake(CGRectGetMidX(_alertWindow.bounds), CGRectGetMidY(_alertWindow.bounds));
    }
    return self;
}


- (void)show
{
    [[PXAlertViewQueue sharedInstance] add:self];
}

- (void)_show
{
    [self.alertWindow addSubview:self];
    [self.alertWindow makeKeyAndVisible];
    self.visible = YES;
    [self showBackgroundView];
    [self showAlertAnimation];
}

- (void)showBackgroundView
{
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.mainWindow.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
        [self.mainWindow tintColorDidChange];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundView.alpha = 1;
    }];
}

- (void)hide
{
    [self removeFromSuperview];
}

- (void)dismiss:(id)sender
{
    self.visible = NO;
    if ([[[PXAlertViewQueue sharedInstance] alertViews] count] == 1) {
        [self dismissAlertAnimation];
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            self.mainWindow.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
            [self.mainWindow tintColorDidChange];
        }
        [UIView animateWithDuration:0.2 animations:^{
            self.backgroundView.alpha = 0;
            [self.mainWindow makeKeyAndVisible];
        }];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alertView.alpha = 0;
    } completion:^(BOOL finished) {
        [[PXAlertViewQueue sharedInstance] remove:self];
        [self removeFromSuperview];
    }];
    
    BOOL cancelled;
    if (sender == self.cancelButton || sender == self.tap) {
        cancelled = YES;
    } else {
        cancelled = NO;
    }
    if (self.completion) {
        self.completion(cancelled);
    }
}

- (void)setBackgroundColorForButton:(id)sender
{
    [sender setBackgroundColor:[UIColor colorWithRed:94/255.0 green:196/255.0 blue:221/255.0 alpha:1.0]];
}

- (void)clearBackgroundColorForButton:(id)sender
{
    [sender setBackgroundColor:[UIColor clearColor]];
}

#pragma mark - 弹出收款码
+ (PXAlertView *)showAlertWithWalletNameTitle:(NSString *)nameTitle
                           WalletAddressTitle:(NSString *)addressTitle
                          WalletCurrencyTitle:(NSString *)currencyTitle
                                    HeadImage:(NSString *)qrcodeImage
                                  QrcodeImage:(NSString *)headImage
                                  cancelTitle:(NSString *)cancelTitle
                                   otherTitle:(NSString *)otherTitle
                                   completion:(void(^) (BOOL cancelled))completion
{
    PXAlertView *alertView = [[PXAlertView alloc] initAlertWithWalletNameTitle:(NSString *)nameTitle
                                                            WalletAddressTitle:(NSString *)addressTitle
                                                           WalletCurrencyTitle:(NSString *)currencyTitle
                                                                     HeadImage:(NSString *)qrcodeImage
                                                                   QrcodeImage:(NSString *)headImage
                                                                   cancelTitle:(NSString *)cancelTitle
                                                                    otherTitle:(NSString *)otherTitle
                                                                    completion:(void(^) (BOOL cancelled))completion];
    [alertView show];
    return alertView;
}
#pragma mark - 设置金额
+ (PXAlertView *)showAlertWithTitle:(NSString *)title
         EnterAmountTextFieldText:(NSString *)fieldText
         EnterAmountTextFieldHolder:(NSString *)placeHolder
                        cancelTitle:(NSString *)cancelTitle
                         otherTitle:(NSString *)otherTitle
                         completion:(void(^) (BOOL cancelled))completion
{
    PXAlertView *alertView = [[PXAlertView alloc] initAlertWithTitle:(NSString *)title
                                          EnterAmountTextFieldText:(NSString *)fieldText
                                          EnterAmountTextFieldHolder:(NSString *)placeHolder
                                                         cancelTitle:(NSString *)cancelTitle
                                                          otherTitle:(NSString *)otherTitle
                                                          completion:(void(^) (BOOL cancelled))completion];
    [alertView show];
    return alertView;
}
#pragma mark - gestures

- (void)setupGestures
{
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    [self.tap setNumberOfTapsRequired:1];
    [self.backgroundView setUserInteractionEnabled:YES];
    [self.backgroundView setMultipleTouchEnabled:NO];
    [self.backgroundView addGestureRecognizer:self.tap];
}

#pragma mark -

- (CGRect)adjustLabelFrameHeight:(UILabel *)label
{
    CGFloat height;
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGSize size = [label.text sizeWithFont:label.font
                             constrainedToSize:CGSizeMake(label.frame.size.width, FLT_MAX)
                                 lineBreakMode:NSLineBreakByWordWrapping];
        
        height = size.height;
        #pragma clang diagnostic pop
    } else {
        NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
        context.minimumScaleFactor = 1.0;
        CGRect bounds = [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width, FLT_MAX)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:label.font}
                                        context:context];
        height = bounds.size.height;
    }
    
    return CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, height);
}

- (void)resizeViews
{
    CGFloat totalHeight = 0;
    for (UIView *view in [self.alertView subviews]) {
        if ([view class] != [UIButton class]) {
            totalHeight += view.frame.size.height + AlertViewVerticalElementSpace;
        }
    }
    totalHeight += AlertViewButtonHeight;
    totalHeight += AlertViewVerticalElementSpace;
    
    self.alertView.frame = CGRectMake(self.alertView.frame.origin.x,
                                      self.alertView.frame.origin.y,
                                      self.alertView.frame.size.width,
                                      totalHeight);
}

- (void)showAlertAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .3;
    
    [self.alertView.layer addAnimation:animation forKey:@"showAlert"];
}

- (void)dismissAlertAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeRemoved;
    animation.duration = .2;
    
    [self.alertView.layer addAnimation:animation forKey:@"dismissAlert"];
}

@end

@implementation PXAlertViewQueue

+ (instancetype)sharedInstance
{
    static PXAlertViewQueue *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[PXAlertViewQueue alloc] init];
        _sharedInstance.alertViews = [NSMutableArray array];
    });
    
    return _sharedInstance;
}

- (void)add:(PXAlertView *)alertView
{
    [self.alertViews addObject:alertView];
    [alertView _show];
    for (PXAlertView *av in self.alertViews) {
        if (av != alertView) {
            [av hide];
        }
    }
}

- (void)remove:(PXAlertView *)alertView
{
    [self.alertViews removeObject:alertView];
    PXAlertView *last = [self.alertViews lastObject];
    if (last) {
        [last _show];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //取消第一响应者
    [textField resignFirstResponder];
    return YES;
}
@end
