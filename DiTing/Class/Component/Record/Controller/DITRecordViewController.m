//
//  DITRecordViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/3/26.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITRecordViewController.h"
#import "DITRecordView.h"

@interface DITRecordViewController ()

@end

@implementation DITRecordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    
    DITRecordView *recordView = [[DITRecordView alloc] init];
    [self.view addSubview:recordView];
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
