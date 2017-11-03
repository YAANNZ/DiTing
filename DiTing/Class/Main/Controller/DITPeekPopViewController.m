//
//  DITPeekPopViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/11/2.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITPeekPopViewController.h"
#import "DITPeekPopPresentationViewController.h"

@interface DITPeekPopViewController () <UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate>


@property (nonatomic, strong) NSMutableArray *dataAry;

@end

@implementation DITPeekPopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"DITPeekPopCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataAry[indexPath.row];
    
    //注册3D Touch
    /**
     从iOS9开始，我们可以通过这个类来判断运行程序对应的设备是否支持3D Touch功能。
     UIForceTouchCapabilityUnknown = 0,     //未知
     UIForceTouchCapabilityUnavailable = 1, //不可用
     UIForceTouchCapabilityAvailable = 2    //可用
     */
    if ([self respondsToSelector:@selector(traitCollection)])
    {
        
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)])
        {
            
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
            {
                
                [self registerForPreviewingWithDelegate:(id)self sourceView:cell];
            }
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - UIViewControllerPreviewingDelegate
- (nullable UIViewController *)previewingContext:(id )previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0)
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)[previewingContext sourceView]];
    NSString *str = [NSString stringWithFormat:@"通过点击%@进来的",self.dataAry[indexPath.row]];

    //创建要预览的控制器
    DITPeekPopPresentationViewController *presentationVC = [[DITPeekPopPresentationViewController alloc] init];
    presentationVC.dataAry = self.dataAry;
    presentationVC.index = indexPath.row;
    presentationVC.strInfo = str;
    presentationVC.replaceBlock = ^{
        [self.tableView reloadData];
    };
    
    //指定当前上下文视图Rect
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    [previewingContext setSourceRect:rect];
    return presentationVC;
}

- (void)previewingContext:(id )previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0)
{
    [self showViewController:viewControllerToCommit sender:self];
}


- (NSMutableArray *)dataAry
{
    if (!_dataAry)
    {
        _dataAry = [NSMutableArray array];
        for (int i = 0; i < 10; i++)
        {
            [_dataAry addObject:[NSString stringWithFormat:@"row[%d]",i]];
        }
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
