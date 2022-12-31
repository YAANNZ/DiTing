//
//  DITPeekPopPresentationViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/11/3.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITPeekPopPresentationViewController.h"

@interface DITPeekPopPresentationViewController ()

@end

@implementation DITPeekPopPresentationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.frame = CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, 30);
    contentLabel.text = self.strInfo;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:contentLabel];
}

- (NSArray *)previewActionItems
{
    NSMutableArray *arrItem = [NSMutableArray array];
    
    UIPreviewAction *previewAction0 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"didClickCancel");
    }];
    
    UIPreviewAction *previewAction1 = [UIPreviewAction actionWithTitle:@"替换该元素" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        //把下标为index的元素替换成preview
        [self replaceItem];
        
    }];
    
    [arrItem addObjectsFromArray:@[previewAction0 ,previewAction1]];
    
    return arrItem;
}

- (void)replaceItem
{
    [self.dataAry replaceObjectAtIndex:self.index withObject:@"replacedItem"];
    if (self.replaceBlock) {
        self.replaceBlock();
    }
    
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
