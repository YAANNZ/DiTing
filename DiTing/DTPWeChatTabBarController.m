//
//  DTPWeChatTabBarController.m
//  DiTing
//
//  Created by ZHUYN on 2017/8/15.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DTPWeChatTabBarController.h"

@interface DTPWeChatTabBarController ()

@end

@implementation DTPWeChatTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *profileVC = [[UIViewController alloc] init];
    profileVC.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:profileVC];
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
