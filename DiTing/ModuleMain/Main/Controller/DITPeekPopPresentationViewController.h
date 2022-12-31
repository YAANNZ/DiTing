//
//  DITPeekPopPresentationViewController.h
//  DiTing
//
//  Created by ZHUYN on 2017/11/3.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^DITPeekPopBlock)();

@interface DITPeekPopPresentationViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *dataAry;
@property (nonatomic, copy) NSString *strInfo;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) DITPeekPopBlock replaceBlock;

@end
