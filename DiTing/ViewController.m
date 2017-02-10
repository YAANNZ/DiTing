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

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 20)];
    titleL.text = @"DiTing";
    [self.view addSubview:titleL];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView = tableView;
    tableView.delegate = self;
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *cellItem = self.listAry[indexPath.section][@"items"][indexPath.row];
    
    cell.textLabel.text = cellItem[@"title"];
    
    
    return cell;
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
