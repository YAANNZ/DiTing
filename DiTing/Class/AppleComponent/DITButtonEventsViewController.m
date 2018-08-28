//
//  DITButtonEventsViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/8/26.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITButtonEventsViewController.h"

@interface DITButtonEventsViewController ()

@end

@implementation DITButtonEventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}
- (IBAction)touchUp:(UIButton *)sender
{
    NSLog(@"get touch ");
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
