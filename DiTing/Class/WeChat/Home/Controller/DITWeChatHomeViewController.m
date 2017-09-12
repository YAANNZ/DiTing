//
//  DITWeChatHomeViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/8/17.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITWeChatHomeViewController.h"
#import "DITWeChatHomeTableViewCell.h"
#import "DITWeChatHomeModel.h"
#import "DITWeChatChatTableViewController.h"
#import "AFNetworking.h"
#define DITWeChatHomeCellID @"DITWeChatHomeCellID"

@interface DITWeChatHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <DITWeChatHomeModel *> *sessionArray;

@end

@implementation DITWeChatHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupSubview];
    
//    [[AFHTTPSessionManager manager] GET:@"http://127.0.0.1:3000" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
}

- (void)setupSubview
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 70;
    [tableView registerClass:[DITWeChatHomeTableViewCell class] forCellReuseIdentifier:DITWeChatHomeCellID];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sessionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DITWeChatHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DITWeChatHomeCellID];
    cell.homeModel = self.sessionArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DITWeChatChatTableViewController *chatVC = [[DITWeChatChatTableViewController alloc] init];
    [self.navigationController pushViewController:chatVC animated:YES];
}


- (NSMutableArray *)sessionArray
{
    if (!_sessionArray)
    {
        _sessionArray = [NSMutableArray array];
        DITWeChatHomeModel *dataModel = [[DITWeChatHomeModel alloc] init];
        dataModel.headImg = @"default_Icon";
        dataModel.nameStr = @"Gavin";
        dataModel.msgStr = @"no zuo no die why you try😊";
        dataModel.timeStr = @"13:05";
        for (int i = 0; i < 8; i++) {
            [_sessionArray addObject:dataModel];
        }
    }
    return _sessionArray;
}


- (void)didReceiveMemoryWarning
{
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
