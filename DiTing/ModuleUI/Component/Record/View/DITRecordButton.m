//
//  DITRecordButton.m
//  DiTing
//
//  Created by ZHUYN on 2018/4/8.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITRecordButton.h"

@interface DITRecordButton ()

@property (nonatomic, strong) NSDate *beginDate;

@end

@implementation DITRecordButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.beginDate = [NSDate date];
    [self.delegate recordButtonBeginRecord];
    NSLog(@"touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    BOOL isFinish = NO;
    NSDate *endDate = [NSDate date];
    if([endDate timeIntervalSinceDate:self.beginDate] >= 1)
    {
        isFinish = YES;
    }
    else
    {
        //
        
    }
    
    [self.delegate recordButtonEndRecordWithFinishState:isFinish];
    NSLog(@"touchesEnded");
}

@end
