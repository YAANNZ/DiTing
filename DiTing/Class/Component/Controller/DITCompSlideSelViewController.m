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
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *panView;

@end

@implementation DITCompSlideSelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.panView = [[UIView alloc] init];
    [self.view addSubview:self.panView];
    [self.panView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.left.bottom.equalTo(@0);
        make.width.equalTo(@45);
    }];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.panView addGestureRecognizer:tapGesture];
    
    // 平移
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.panView addGestureRecognizer:panGesture];
}

- (void)tapGesture:(UITapGestureRecognizer *)tapGesture
{
    CGPoint currentPoint = [tapGesture locationInView:self.panView];
    
    if (currentPoint.y >= self.dataAry.count*35)
    {
        return;
    }
    
    NSUInteger currentIndex = currentPoint.y/35;
    DITCompSideSelModel *sideSelModel = self.dataAry[currentIndex];
    sideSelModel.status = !sideSelModel.status;
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentIndex inSection:0];
//    DITCompSlideSelTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    cell.compSideSelModel = sideSelModel;
    [self.tableView reloadData];
}

static NSUInteger cellIndex = NSUIntegerMax;
- (void)panGesture:(UIPanGestureRecognizer *)panGesture
{
    NSLog(@"%@, %@, %@", NSStringFromCGPoint([panGesture translationInView:self.view]), NSStringFromCGPoint([panGesture velocityInView:self.panView]), NSStringFromCGPoint([panGesture locationInView:self.panView]));
    
    CGPoint currentPoint = [panGesture locationInView:self.panView];
    NSUInteger currentIndex = currentPoint.y/35;
    if (currentIndex == cellIndex)
    {
        return;
    }

    if (currentPoint.y >= self.dataAry.count*35)
    {
        return;
    }
    
    DITCompSideSelModel *sideSelModel = self.dataAry[currentIndex];
    sideSelModel.status = !sideSelModel.status;
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentIndex inSection:0];
//    DITCompSlideSelTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    cell.compSideSelModel = sideSelModel;
    [self.tableView reloadData];
    
    cellIndex = currentPoint.y/35;
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
                                 @"content": @"那时我们有梦"
                                 },
                             @{
                                 @"content": @"关于文学"
                                 },
                             @{
                                 @"content": @"关于爱情"
                                 },
                             @{
                                 @"content": @"关于穿越世界的旅行"
                                 },
                             @{
                                 @"content": @"如今我们深夜饮酒"
                                 },
                             @{
                                 @"content": @"杯子碰到一起"
                                 },
                             @{
                                 @"content": @"都是梦破碎的声音"
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
