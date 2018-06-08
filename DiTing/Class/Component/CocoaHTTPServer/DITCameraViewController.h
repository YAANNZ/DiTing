//
//  DITCameraViewController.h
//  DiTing
//
//  Created by ZHUYN on 2018/6/6.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DITCameraVCBlock) (NSMutableArray *imgDetailAry);

@interface DITCameraViewController : UIViewController

@property (nonatomic, copy) DITCameraVCBlock updateIndexBlock;

@end
