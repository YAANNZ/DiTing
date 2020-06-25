//
//  ViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/2/6.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *listAry;

@end

@implementation ViewController

NSString * const cellID = @"cellID";

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:tableView];
}

#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.listAry.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listAry[section][@"items"] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.listAry[section][@"header"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == self.listAry.count - 1)
    {
        return 30;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == self.listAry.count - 1)
    {
        UIButton *footerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [footerBtn setTitle:@"退出" forState:UIControlStateNormal];
        [footerBtn setBackgroundColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0]];
        [footerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [footerBtn addTarget:self action:@selector(footerBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return footerBtn;
    }
    
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *cellItem = self.listAry[indexPath.section][@"items"][indexPath.row];
    cell.textLabel.text = cellItem[@"title"];
    return cell;
}

// 退出
- (void)footerBtnClick
{
    [UIView beginAnimations:@"exitApplication" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:[[UIApplication sharedApplication] keyWindow] cache:NO];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    [[UIApplication sharedApplication] keyWindow].bounds = CGRectMake(0, 0, 0, 0);
    [UIView commitAnimations];
}

- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID compare:@"exitApplication"] == 0)
    {
        exit(0);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *cellItem = self.listAry[indexPath.section][@"items"][indexPath.row];
    if ([cellItem[@"targetVc"] isEqualToString:@"DITWeChatTabBarController"])
    {
//        [UIApplication sharedApplication].kesyWindow.rootViewController = [[NSClassFromString(cellItem[@"targetVc"]) alloc] init];
    }
    else
    {
        if ([cellItem[@"targetVc"] isEqualToString:@"DITCompLoopViewController"])
        {
            return;
        }
        
        
        [self.navigationController pushViewController:[[NSClassFromString(cellItem[@"targetVc"]) alloc] init] animated:YES];
    }
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"banzu://"]];
}


#pragma mark - lazy
- (NSArray *)listAry
{
    if (_listAry == nil)
    {
        _listAry = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mainList.plist" ofType:nil]];
    }
    return _listAry;
}











- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
