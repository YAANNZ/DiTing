//
//  DITRecordButton.h
//  DiTing
//
//  Created by ZHUYN on 2018/4/8.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DITRecordButtonDelegate

- (void)recordButtonBeginRecord;
- (void)recordButtonEndRecordWithFinishState:(BOOL)isFinish;

@end

@interface DITRecordButton : UIButton

@property (nonatomic, weak) id <DITRecordButtonDelegate> delegate;

@end
