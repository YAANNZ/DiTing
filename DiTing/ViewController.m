//
//  ViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/2/6.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 20)];
    titleL.text = @"DiTing";
    [self.view addSubview:titleL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
