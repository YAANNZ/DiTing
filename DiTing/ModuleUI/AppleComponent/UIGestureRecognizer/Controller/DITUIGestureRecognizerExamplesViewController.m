//
//  DITUIGestureRecognizerExamplesViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/3/2.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITUIGestureRecognizerExamplesViewController.h"

@interface DITUIGestureRecognizerExamplesViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UILabel *tapLabel;
@property (nonatomic, weak) UILabel *detailLabel;

@end

@implementation DITUIGestureRecognizerExamplesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *tapLabel = [[UILabel alloc] init];
    self.tapLabel = tapLabel;
    tapLabel.textAlignment = NSTextAlignmentCenter;
    tapLabel.backgroundColor = [UIColor brownColor];
    tapLabel.userInteractionEnabled = YES;
    [self.view addSubview:tapLabel];
    
    [self.tapLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@300);
        make.height.equalTo(@100);
        make.top.equalTo(@200);
        make.centerX.equalTo(@0);
    }];
    
    UILabel *detailLabel = [[UILabel alloc] init];
    self.detailLabel = detailLabel;
    detailLabel.textAlignment = NSTextAlignmentCenter;
    detailLabel.numberOfLines = 0;
    [self.view addSubview:detailLabel];
    
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@300);
        make.height.equalTo(@200);
        make.top.equalTo(@350);
        make.centerX.equalTo(@0);
    }];
    
    
    if ([self.gestureRecognizerType isEqualToString:@"UITapGestureRecognizer"]) {
        [self addTapGestureView];
    } else if ([self.gestureRecognizerType isEqualToString:@"UISwipeGestureRecognizer"]) {
        [self addSwipeGestureView];
    } else if ([self.gestureRecognizerType isEqualToString:@"UILongPressGestureRecognizer"]) {
        [self addLongPressGestureView];
    } else if ([self.gestureRecognizerType isEqualToString:@"UIPanGestureRecognizer"]) {
        [self addPanGestureView];
    } else if ([self.gestureRecognizerType isEqualToString:@"UIPinchGestureRecognizer"]) {
        [self addPinchGestureView];
    } else if ([self.gestureRecognizerType isEqualToString:@"UIRotationGestureRecognizer"]) {
        [self addRotationGestureView];
    } else if ([self.gestureRecognizerType isEqualToString:@"UIScreenEdgePanGestureRecognizer"]) {
        [self addScreenEdgePanGestureView];
    }
}

#pragma mark - 轻拍
- (void)addTapGestureView
{
    self.title = @"轻拍";
    self.detailLabel.text = @"双指\n轻拍两下";
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    tapGesture.numberOfTouchesRequired = 2;
    tapGesture.numberOfTapsRequired = 2;
    [self.tapLabel addGestureRecognizer:tapGesture];
}

- (void)tapGesture:(UITapGestureRecognizer *)tapGesture
{
    self.tapLabel.text = @"检测到双指双下轻拍";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tapLabel.text = nil;
    });
}

#pragma mark - 轻扫
- (void)addSwipeGestureView
{
    self.title = @"轻扫";
    self.detailLabel.text = @"双指\n向左轻扫";
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    swipeGesture.numberOfTouchesRequired = 2;
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tapLabel addGestureRecognizer:swipeGesture];
}

- (void)swipeGesture:(UITapGestureRecognizer *)swipeGesture
{
    self.tapLabel.text = @"检测到双指右左轻扫";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tapLabel.text = nil;
    });
}

#pragma mark - 长按
- (void)addLongPressGestureView
{
    self.title = @"长按";
    self.detailLabel.text = @"双指\n先轻拍两次\n长按超过3s\n可移动距离150";
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
    longPressGesture.numberOfTouchesRequired = 2;
    longPressGesture.numberOfTapsRequired = 2;
    longPressGesture.minimumPressDuration = 3;
    longPressGesture.allowableMovement = 150;
    [self.tapLabel addGestureRecognizer:longPressGesture];
}

- (void)longPressGesture:(UITapGestureRecognizer *)longPressGesture
{
    self.tapLabel.text = @"检测到长按";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tapLabel.text = nil;
    });
}

#pragma mark - 平移
- (void)addPanGestureView
{
    self.title = @"平移";
    self.detailLabel.text = @"指数大于等于2根\n小于等于3根";
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
//    panGesture.minimumNumberOfTouches = 2;
    panGesture.maximumNumberOfTouches = 3;
    panGesture.delegate = self;
    [self.tapLabel addGestureRecognizer:panGesture];
}

- (void)panGesture:(UIPanGestureRecognizer *)panGesture
{
    self.tapLabel.text = @"检测到平移";
//    CGPoint point = [panGesture translationInView:self.tapLabel]; // 偏移量
    
//        panGesture.view.transform = CGAffineTransformMake(1, 0, 0, 1, point.x, point.y);
//        panGesture.view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
    
//    //移动方式:以上次的位置为标准
//    panGesture.view.transform = CGAffineTransformTranslate(panGesture.view.transform, point.x, point.y);
//    //增量置为o
//    [panGesture setTranslation:CGPointZero inView:panGesture.view];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tapLabel.text = nil;
    });
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:self.view];
    CGPoint points = [(UIPanGestureRecognizer *)gestureRecognizer locationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(point));
    NSLog(@"%@", NSStringFromCGPoint(points));
//    [self.tapLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//
//    }]
//    if (<#condition#>)
//    {
//        return YES;
//    }
    
    return NO;
}

#pragma mark - 捏合（缩放）
- (void)addPinchGestureView
{
    self.title = @"捏合（缩放）";
    self.detailLabel.text = @"捏合（缩放）";
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
//    pinchGesture.scale = 2;
    [self.tapLabel addGestureRecognizer:pinchGesture];
}

- (void)pinchGesture:(UIPinchGestureRecognizer *)pinchGesture
{
    self.tapLabel.text = @"检测到捏合（缩放）";
    NSLog(@"%f", pinchGesture.velocity);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tapLabel.text = nil;
    });
}

#pragma mark - 旋转
- (void)addRotationGestureView
{
    self.title = @"旋转";
    self.detailLabel.text = @"旋转";
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGesture:)];
    rotationGesture.rotation = M_PI_2;    // 检测到手势会立刻旋转90再响应
    [self.tapLabel addGestureRecognizer:rotationGesture];
    
}

- (void)rotationGesture:(UIRotationGestureRecognizer *)rotationGesture
{
    self.tapLabel.text = @"检测到旋转";
    NSLog(@"%f", rotationGesture.velocity);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tapLabel.text = nil;
    });
    
//    rotationGesture.view.transform = CGAffineTransformMake(cos(M_PI_4), sin(M_PI_4), -sin(M_PI_4), cos(M_PI_4), 0, 0);
    //捏合手势两种改变方式
    //以原来的位置为标准
//        rotationGesture.view.transform = CGAffineTransformMakeRotation(rotationGesture.rotation);//rotation 是旋转角度
    
    //两个参数,以上位置为标准
    rotationGesture.view.transform = CGAffineTransformRotate(rotationGesture.view.transform, rotationGesture.rotation);
    //消除增量
    rotationGesture.rotation = 0.0;
}

#pragma mark - 屏幕边缘平移
- (void)addScreenEdgePanGestureView
{
    self.title = @"屏幕边缘平移";
    self.detailLabel.text = @"视图需要紧邻屏幕边缘\n从屏幕右侧边缘平移";
    
    [self.tapLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo((MAINSCREEN_WIDTH - 300)/2);
    }];
    
    UIScreenEdgePanGestureRecognizer *screenEdgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePanGesture:)];
    screenEdgePanGesture.edges = UIRectEdgeRight;
    [self.tapLabel addGestureRecognizer:screenEdgePanGesture];
}

- (void)screenEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)screenEdgePanGesture
{
    self.tapLabel.text = @"检测到屏幕边缘平移";
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.tapLabel.text = nil;
    });
    
}
    
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
