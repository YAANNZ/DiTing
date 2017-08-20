//
//  DITWeChatContactsViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/8/17.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITWeChatContactsViewController.h"

@interface DITWeChatContactsViewController ()

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation DITWeChatContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tableView];
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
