//
//  DITCameraViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/6.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITCameraViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface DITCameraViewController ()

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureDeviceInput *videoInput;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImgOutput;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation DITCameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initAVCaptureSession];
    
    [self addSubViews];
}

- (void)initAVCaptureSession
{
    // 创建session
    self.captureSession = [[AVCaptureSession alloc] init];
    
    // 初始化设备
    NSError *error;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 关闭闪光灯
    [device lockForConfiguration:nil];
    [device setFlashMode:AVCaptureFlashModeOff];
    [device unlockForConfiguration];
    
    // 初始化输入
    self.videoInput = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    
    // 初始化输出
    self.stillImgOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [self.stillImgOutput setOutputSettings:outputSettings];
    
    // 配置session
    if ([self.captureSession canAddInput:self.videoInput])
    {
        [self.captureSession addInput:self.videoInput];
    }
    if ([self.captureSession canAddOutput:self.stillImgOutput])
    {
        [self.captureSession addOutput:self.stillImgOutput];
    }
    
    // previewLayer
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.captureSession];
    [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    self.previewLayer.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT);
    [self.view.layer addSublayer:self.previewLayer];
}

- (void)addSubViews
{
    UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tapBtn setTitle:@"Tap" forState:UIControlStateNormal];
    [tapBtn addTarget:self action:@selector(tapBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    tapBtn.layer.cornerRadius = 20;
    tapBtn.layer.borderColor = [UIColor blackColor].CGColor;
    tapBtn.layer.borderWidth = 1.0;
    [self.view addSubview:tapBtn];
    [tapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(@-150);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
}

- (void)tapBtnClicked:(UIButton *)tapBtn
{
    AVCaptureConnection *stillImageConnection = [self.stillImgOutput        connectionWithMediaType:AVMediaTypeVideo];
    UIDeviceOrientation curDeviceOrientation = [[UIDevice currentDevice] orientation];
    AVCaptureVideoOrientation avcaptureOrientation = [self avOrientationForDeviceOrientation:curDeviceOrientation];
    [stillImageConnection setVideoOrientation:avcaptureOrientation];
    [stillImageConnection setVideoScaleAndCropFactor:1];
    
    [self.stillImgOutput captureStillImageAsynchronouslyFromConnection:stillImageConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        NSData *jpegData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
//        self.jpegData = jpegData;
//        self.imgDate = [NSDate date];
        
        
    }];
}

- (AVCaptureVideoOrientation)avOrientationForDeviceOrientation:(UIDeviceOrientation)deviceOrientation
{
    AVCaptureVideoOrientation result = (AVCaptureVideoOrientation)deviceOrientation;
    if ( deviceOrientation == UIDeviceOrientationLandscapeLeft )
        result = AVCaptureVideoOrientationLandscapeRight;
    else if ( deviceOrientation == UIDeviceOrientationLandscapeRight )
        result = AVCaptureVideoOrientationLandscapeLeft;
    return result;
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
