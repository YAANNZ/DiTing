//
//  DITUIGestureRecognizerViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/3/2.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITUIGestureRecognizerViewController.h"

#import "DITUIGestureRecognizerExamplesViewController.h"

@interface DITUIGestureRecognizerViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataAry;

@end

@implementation DITUIGestureRecognizerViewController

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
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"DITUIGestureRecognizerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.dataAry[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DITUIGestureRecognizerExamplesViewController *examplesVC = [[DITUIGestureRecognizerExamplesViewController alloc] init];
    examplesVC.gestureRecognizerType = self.dataAry[indexPath.row];
    [self.navigationController pushViewController:examplesVC animated:YES];
}

- (NSArray *)dataAry
{
    if (!_dataAry)
    {
        _dataAry = @[@"UITapGestureRecognizer", @"UISwipeGestureRecognizer", @"UILongPressGestureRecognizer", @"UIPanGestureRecognizer", @"UIPinchGestureRecognizer", @"UIRotationGestureRecognizer", @"UIScreenEdgePanGestureRecognizer"];
    }
    return _dataAry;
}

- (void)dealloc
{}

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
