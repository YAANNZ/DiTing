//
//  DITHTTPServerViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/6.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITHTTPServerViewController.h"
#import "HTTPServer.h"

@interface DITHTTPServerViewController ()

@property (nonatomic, strong) HTTPServer *httpServer;

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
}

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
    [self.httpServer stop];
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
