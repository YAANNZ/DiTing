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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.captureSession startRunning]; // startRunning
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.captureSession stopRunning]; // stopRunning
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

#pragma mark - subviews
- (void)addSubViews
{
    UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tapBtn setTitle:@"Tap" forState:UIControlStateNormal];
    [tapBtn addTarget:self action:@selector(tapBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    tapBtn.layer.cornerRadius = 20;
    tapBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    tapBtn.layer.borderWidth = 1.0;
    [self.view addSubview:tapBtn];
    [tapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(@-150);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
    
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [dismissBtn setTitle:@"Dismiss" forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismissBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    dismissBtn.layer.cornerRadius = 20;
    dismissBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    dismissBtn.layer.borderWidth = 1.0;
    [self.view addSubview:dismissBtn];
    [dismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(@-70);
        make.width.equalTo(@120);
        make.height.equalTo(@40);
    }];
}

- (void)dismissBtnClicked:(UIButton *)dismissBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Capture
- (void)tapBtnClicked:(UIButton *)tapBtn
{
    AVCaptureConnection *stillImageConnection = [self.stillImgOutput        connectionWithMediaType:AVMediaTypeVideo];
    UIDeviceOrientation curDeviceOrientation = [[UIDevice currentDevice] orientation];
    AVCaptureVideoOrientation avcaptureOrientation = [self avOrientationForDeviceOrientation:curDeviceOrientation];
    [stillImageConnection setVideoOrientation:avcaptureOrientation];
    [stillImageConnection setVideoScaleAndCropFactor:1];
    
    __weak typeof(self) weakself = self;
    [self.stillImgOutput captureStillImageAsynchronouslyFromConnection:stillImageConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];

        [weakself.captureSession stopRunning];
        
        // 存储进Caches
        [weakself saveImageData:imageData];
    }];
}

- (void)saveImageData:(NSData *)imageData
{
    BOOL isDirectory = NO;
    if (![[NSFileManager defaultManager] fileExistsAtPath:ImageDirPath isDirectory:&isDirectory])
    {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:ImageDirPath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    NSString *imagePath = [ImageDirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", [self getTimeString]]];
    [imageData writeToFile:imagePath atomically:YES];
    
    // 记录进 plist
    [self saveImageDetailToPlist:imagePath];
}

- (NSString *)getTimeString
{
    NSDateFormatter  *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMddHHmmssSSS"];
    
    return [dateformatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
}

- (void)saveImageDetailToPlist:(NSString *)imagePath
{
    NSString *filename = [[imagePath componentsSeparatedByString:@"/"] lastObject];
    
    NSMutableArray *imgDetailAry = [NSMutableArray arrayWithContentsOfFile:ImagesPlistPath];
    if (!imgDetailAry)
    {
        NSMutableDictionary *imgDetailDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:filename, @"filename", imagePath, @"imagePath", nil];
        imgDetailAry = [NSMutableArray arrayWithObject:imgDetailDict];
        [imgDetailAry writeToFile:ImagesPlistPath atomically:YES];
    }
    else
    {
        NSMutableDictionary *imgDetailDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:filename, @"filename", imagePath, @"imagePath", nil];
        [imgDetailAry addObject:imgDetailDict];
        [imgDetailAry writeToFile:ImagesPlistPath atomically:YES];
    }
    
    ShowMBProgressHUDText(@"照片已存储")
    [self.captureSession startRunning];
    
    self.updateIndexBlock(imgDetailAry);
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
