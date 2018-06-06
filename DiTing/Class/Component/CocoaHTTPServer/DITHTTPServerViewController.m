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

@interface DITHTTPServerViewController ()

@property (nonatomic, strong) HTTPServer *httpServer;
@property (nonatomic, weak) UILabel *addressLabel;

@end

@implementation DITHTTPServerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViews];
    
    [self initHTTPServer];
    
}

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
}

- (void)startBtnClicked:(UIButton *)startBtn
{
    [self startupServer];
}

- (void)stopBtnClicked:(UIButton *)stopBtn
{
    [self stopServer];
}

- (void)cameraBtnClicked:(UIButton *)cameraBtn
{
    DITCameraViewController *cameraVC = [[DITCameraViewController alloc] init];
    [self presentViewController:cameraVC animated:YES completion:nil];
}

#pragma mark - cocoaHttpServer
- (void)initHTTPServer
{
    self.httpServer = [[HTTPServer alloc] init];
    [self.httpServer setType:@"_http._tcp."];
    NSString *webPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"web"];
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
        NSLog(@"Server started port:%d", [self.httpServer listeningPort]);
    }
}

- (void)stopServer
{
    [self.httpServer stop:YES];
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
