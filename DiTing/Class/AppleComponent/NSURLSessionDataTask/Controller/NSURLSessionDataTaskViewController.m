//
//  NSURLSessionDataTaskViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/5/9.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "NSURLSessionDataTaskViewController.h"
#import "DITProgressView.h"

@interface NSURLSessionDataTaskViewController () <NSURLSessionDataDelegate>

@property (nonatomic, weak) DITProgressView *circleProgressView;
@property (nonatomic, assign) NSInteger totalLenght;
@property (nonatomic, assign) NSInteger currentLenght;
@property (nonatomic, strong) NSOutputStream *outPutStream;
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation NSURLSessionDataTaskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addsubviews];
    
    [self addNetworkReachabilityManager];
}

#pragma mark - UI
- (void)addsubviews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    DITProgressView *circleProgressView = [[DITProgressView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    self.circleProgressView = circleProgressView;
    circleProgressView.progressType = DITProgressCircle;
    [self.view addSubview:circleProgressView];
    
    UIButton *downloadControlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    downloadControlBtn.frame = CGRectMake(25, 25, 50, 50);
    [downloadControlBtn setBackgroundImage:[UIImage imageNamed:@"appleCom_start"] forState:UIControlStateNormal];
    [downloadControlBtn addTarget:self action:@selector(downloadControlBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [circleProgressView addSubview:downloadControlBtn];
}

#pragma mark - 懒加载
 - (NSURLSessionDataTask *)dataTask
{
    if (!_dataTask)
    {
        // 1. 创建会话对象
        NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        
        // 2. 创建任务对象
        _dataTask = [urlSession dataTaskWithURL:[NSURL URLWithString:@"http://127.0.0.1:8080/iOS/icon512.png"]];
    }
    return _dataTask;
}

#pragma mark - NSURLSessionDataDelegate
// 1. 接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    // 获取文件的总大小
    self.totalLenght = response.expectedContentLength;
    
    // 创建输出流
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    filePath = [filePath stringByAppendingPathComponent:@"zzz.pdf"];
    self.outPutStream = [[NSOutputStream alloc] initToFileAtPath:filePath append:YES];
    
    // 打开输出流
    [self.outPutStream open];
    
    // 是否接受服务器的响应
    completionHandler(NSURLSessionResponseAllow);
}

// 2. 接收到服务器返回的数据，会多次调用
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    // write stream
    [self.outPutStream write:data.bytes maxLength:data.length];
    
    // 计算进度
    self.currentLenght += data.length;
    NSInteger progress = self.currentLenght/self.totalLenght;
    self.circleProgressView.progress = progress;
}

// 3. task完成
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    // 关闭输出流
    [self.outPutStream close];
    
    // 检测是否有错误
    if (error)
    {
        // 相应处理
    }
    else
    {
        // 清空指针
        self.outPutStream = nil;
    }
}


#pragma mark - 造成中断需要续传的情况
// 1. 手动暂停 ControlEvents
- (void)downloadControlBtnClicked:(UIButton *)downloadControlBtn
{
    if (self.dataTask.state == NSURLSessionTaskStateRunning)
    {
        [downloadControlBtn setBackgroundImage:[UIImage imageNamed:@"appleCom_start"] forState:UIControlStateNormal];
        
        // 中断下载
        [self.dataTask suspend];
    }
    else
    {
        [downloadControlBtn setBackgroundImage:[UIImage imageNamed:@"appleCom_stop"] forState:UIControlStateNormal];
        
        // 开始下载
        [self.dataTask resume];
    }
}

// 2. 网络变化
- (void)addNetworkReachabilityManager
{
    AFNetworkReachabilityManager *netReachabeManager = [AFNetworkReachabilityManager sharedManager];
    [netReachabeManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == (AFNetworkReachabilityStatusNotReachable | AFNetworkReachabilityStatusUnknown))
        {
            if (self.dataTask.state == NSURLSessionTaskStateRunning)
            {
                [self.dataTask suspend];
            }
        }
        else
        {
            if (self.dataTask.state == NSURLSessionTaskStateSuspended)
            {
                [self.dataTask resume];
            }
        }
    }];
    [netReachabeManager startMonitoring];
}

// 3. 对象销毁
- (void)dealloc
{
    if (self.dataTask.state == NSURLSessionTaskStateRunning)
    {
//        self.currentLenght
        // 存储进度，下次进来点击继续下载
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
