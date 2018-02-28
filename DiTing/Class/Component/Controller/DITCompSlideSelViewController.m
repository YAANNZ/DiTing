//
//  DITCompSlideSelViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/2/25.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITCompSlideSelViewController.h"
#import "DITCompSlideSelTableViewCell.h"

@interface DITCompSlideSelViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataAry;

@end

@implementation DITCompSlideSelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataAry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DITCompSlideSelTableViewCell *cell = [DITCompSlideSelTableViewCell cellWithTableView:tableView];
    cell.compSideSelModel = self.dataAry[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSMutableArray *)dataAry
{
    if (!_dataAry)
    {
        NSArray *tempAry = @[
                             @{
                                 @"content": @"那时我们有梦",
                                 @"status": @"0"
                                 },
                             @{
                                 @"content": @"关于文学",
                                 @"status": @"0"
                                 },
                             @{
                                 @"content": @"关于爱情",
                                 @"status": @"0"
                                 },
                             @{
                                 @"content": @"关于穿越世界的旅行",
                                 @"status": @"0"
                                 },
                             @{
                                 @"content": @"如今我们深夜饮酒",
                                 @"status": @"0"
                                 },
                             @{
                                 @"content": @"杯子碰到一起",
                                 @"status": @"0"
                                 },
                             @{
                                 @"content": @"都是梦破碎的声音",
                                 @"status": @"0"
                                 },
                             ];
        
        _dataAry = [DITCompSideSelModel mj_objectArrayWithKeyValuesArray:tempAry];
    }
    return _dataAry;
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
