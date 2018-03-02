//
//  DITUIGestureRecognizerExamplesViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/3/2.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITUIGestureRecognizerExamplesViewController.h"

@interface DITUIGestureRecognizerExamplesViewController ()

@end

@implementation DITUIGestureRecognizerExamplesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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

- (void)addTapGestureView
{
    self.title = @"轻拍";
    
//    UILabel *tapLabel = [[UILabel alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
}

- (void)addSwipeGestureView
{
    self.title = @"轻扫";
}

- (void)addLongPressGestureView
{
    self.title = @"长按";
}
- (void)addPanGestureView
{
    self.title = @"平移";
}

- (void)addPinchGestureView
{
    self.title = @"捏合（缩放）";
}

- (void)addRotationGestureView
{
    self.title = @"旋转";
}

- (void)addScreenEdgePanGestureView
{
    self.title = @"屏幕边缘平移";
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
