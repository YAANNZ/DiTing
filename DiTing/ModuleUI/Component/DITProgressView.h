//
//  DITProgressView.h
//  DiTing
//
//  Created by ZHUYN on 2018/5/23.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DITProgressType) {
    DITProgressLine,
    DITProgressCircle,
    DITProgressWave,
    DITProgressInstall
};

@interface DITProgressView : UIView

@property (nonatomic, assign) DITProgressType progressType;
@property (nonatomic, assign) NSInteger progress;

@end
