//
//  DITHTTPServerViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/6.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITHTTPServerViewController.h"
#import "HTTPServer.h"
#import "DITCameraViewController.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import "DITHTTPConnection.h"

@interface DITHTTPServerViewController ()

@property (nonatomic, strong) HTTPServer *httpServer;
@property (nonatomic, weak) UILabel *addressLabel;
@property (nonatomic, assign) int port;

@end

@implementation DITHTTPServerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViews];
    
    [self initHTTPServer];
    
}

#pragma mark - subviews
- (void)addSubViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *addressLabel = [[UILabel alloc] init];
    self.addressLabel = addressLabel;
    addressLabel.textColor = [UIColor blueColor];
    addressLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@100);
        make.width.mas_equalTo(MAINSCREEN_WIDTH);
        make.height.mas_equalTo(20);
    }];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setTitle:@"Start" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    startBtn.layer.cornerRadius = 20;
    startBtn.layer.borderColor = [UIColor blackColor].CGColor;
    startBtn.layer.borderWidth = 1.0;
    [self.view addSubview:startBtn];
    [startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@100);
        make.top.equalTo(@200);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
    
    UIButton *stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopBtn setTitle:@"Stop" forState:UIControlStateNormal];
    [stopBtn addTarget:self action:@selector(stopBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [stopBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    stopBtn.layer.cornerRadius = 20;
    stopBtn.layer.borderColor = [UIColor blackColor].CGColor;
    stopBtn.layer.borderWidth = 1.0;
    [self.view addSubview:stopBtn];
    [stopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-100);
        make.top.equalTo(@200);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraBtn setTitle:@"Camera" forState:UIControlStateNormal];
    [cameraBtn addTarget:self action:@selector(cameraBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cameraBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cameraBtn.layer.cornerRadius = 20;
    cameraBtn.layer.borderColor = [UIColor blackColor].CGColor;
    cameraBtn.layer.borderWidth = 1.0;
    [self.view addSubview:cameraBtn];
    [cameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@300);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
    
    UIButton *clearCachesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearCachesBtn setTitle:@"ClearCaches" forState:UIControlStateNormal];
    [clearCachesBtn addTarget:self action:@selector(clearCachesBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [clearCachesBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clearCachesBtn.layer.borderColor = [UIColor blackColor].CGColor;
    clearCachesBtn.layer.borderWidth = 1.0;
    [self.view addSubview:clearCachesBtn];
    [clearCachesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(@-100);
        make.width.equalTo(@120);
        make.height.equalTo(@40);
    }];
}

#pragma mark - cocoaHttpServer
- (void)initHTTPServer
{
    self.httpServer = [[HTTPServer alloc] init];
    [self.httpServer setType:@"_http._tcp."];
    [self.httpServer setConnectionClass:[DITHTTPConnection class]];
    
    [self setHttpServerDocumentRoot];
}

- (void)setHttpServerDocumentRoot
{
    NSString *webPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"web"];
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:webPath withIntermediateDirectories:YES attributes:nil error:&error];
    
    NSString *htmlStr = @"<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><title>CocoaHTTPServer</title></head><body> <h2>Welcome to CocoaHTTPServer</h2> </body></html>";
    NSError *writeToFileError;
    [htmlStr writeToFile:[webPath stringByAppendingPathComponent:@"index.html"] atomically:YES encoding:NSUTF8StringEncoding error:&writeToFileError];
    
    [self.httpServer setDocumentRoot:webPath];
}

- (void)startupServer
{
    NSError *error;
    [self.httpServer start:&error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    else
    {
        self.port = [self.httpServer listeningPort];
        NSLog(@"Server started port:%d", self.port);
        
        [self initIndexHtmlDynamicContents];
    }
}

- (void)stopServer
{
    [self.httpServer stop:YES];
}

- (void)initIndexHtmlDynamicContents
{
    NSString *indexPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"web/index.html"];

    NSMutableArray *imgDetailAry = [NSMutableArray arrayWithContentsOfFile:ImagesPlistPath];
    NSString *htmlStr;
    if (!imgDetailAry)
    {
        htmlStr = @"<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><title>CocoaHTTPServer</title></head><body> <h2>暂无照片</h2> </body></html>";
    }
    else
    {
        NSString *ulString = [NSString string];
        for (int i = 0; i < imgDetailAry.count; i++)
        {
            NSDictionary *imgDict = imgDetailAry[i];
            ulString = [ulString stringByAppendingString:[NSString stringWithFormat:@"<li>%@--</li><a href=\"%@:%d/%d\">download</a>", imgDict[@"filename"], [self getIPAddress], self.port, i]];
        }
        htmlStr = [NSString stringWithFormat:@"<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><title>CocoaHTTPServer</title></head><body> <h2>The Pictures</h2><ul>%@</ul></body></html>", ulString];
    }
    
    NSError *writeToFileError;
    [htmlStr writeToFile:indexPath atomically:YES encoding:NSUTF8StringEncoding error:&writeToFileError];
}

#pragma mark - clickEvents
- (void)startBtnClicked:(UIButton *)startBtn
{
    [self startupServer];
    
    self.addressLabel.text = [NSString stringWithFormat:@"请在浏览器访问地址：%@:%d", [self getIPAddress],self.port];
}

- (void)stopBtnClicked:(UIButton *)stopBtn
{
    [self stopServer];
}

- (void)cameraBtnClicked:(UIButton *)cameraBtn
{
    __weak typeof(self) weakself = self;
    DITCameraViewController *cameraVC = [[DITCameraViewController alloc] init];
    cameraVC.updateIndexBlock = ^(NSMutableArray *imgDetailAry){
        [weakself updateIndexHtmlDynamicContents:imgDetailAry];
    };
    [self presentViewController:cameraVC animated:YES completion:nil];
}

// 动态更新 index.html
- (void)updateIndexHtmlDynamicContents:(NSMutableArray *)imgDetailAry
{
    NSString *htmlStr;
    NSString *ulString = [NSString string];
    NSString *indexPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"web/index.html"];
    for (int i = 0; i < imgDetailAry.count; i++)
    {
        NSDictionary *imgDict = imgDetailAry[i];
        ulString = [ulString stringByAppendingString:[NSString stringWithFormat:@"<li>%@--</li><a href=\"%@:%d/%d\">download</a>", imgDict[@"filename"], [self getIPAddress], self.port, i]];
    }
    htmlStr = [NSString stringWithFormat:@"<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><title>CocoaHTTPServer</title></head><body> <h2>The Pictures</h2><ul>%@</ul></body></html>", ulString];

    NSError *writeToFileError;
    [htmlStr writeToFile:indexPath atomically:YES encoding:NSUTF8StringEncoding error:&writeToFileError];
}

- (void)clearCachesBtnClicked:(UIButton *)clearCachesBtn
{
    NSError *error;
    [[NSFileManager defaultManager] removeItemAtPath:ImagesPlistPath error:&error];
    
    NSError *DirError;
    [[NSFileManager defaultManager] removeItemAtPath:ImageDirPath error:&DirError];
}

// Get IP Address
- (NSString *)getIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
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
