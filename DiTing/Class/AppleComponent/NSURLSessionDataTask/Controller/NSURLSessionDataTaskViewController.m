//
//  NSURLSessionDataTaskViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/5/9.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "NSURLSessionDataTaskViewController.h"

@interface NSURLSessionDataTaskViewController () <NSURLSessionDataDelegate>

@property (nonatomic, assign) NSInteger totalLenght;
@property (nonatomic, strong) NSOutputStream *outPutStream;

@end

@implementation NSURLSessionDataTaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1. 创建会话对象
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 2. 创建对象
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithURL:[NSURL URLWithString:@""]];
    
    // 3. 启动任务
    [dataTask resume];
}

#pragma mark - NSURLSessionDataDelegate
// 1. 接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    // 获取文件的总大小
    self.totalLenght = response.expectedContentLength;
    
    // 创建输出流
    self.outPutStream = [[NSOutputStream alloc] initToFileAtPath:<#(nonnull NSString *)#> append:YES];
    
    // 打开输出流
    [self.outPutStream open];
    
    // 是否接受服务器的响应
    completionHandler(NSURLSessionResponseAllow);
}

// 2. 接收到服务器返回的数据，会多次调用
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    
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
