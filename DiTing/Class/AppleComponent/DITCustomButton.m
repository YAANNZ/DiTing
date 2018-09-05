//
//  DITCustomButton.m
//  DiTing
//
//  Created by ZHUYN on 2018/9/5.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITCustomButton.h"

@implementation DITCustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%d", [super pointInside:point withEvent:event]);
    return [super pointInside:point withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@", [super hitTest:point withEvent:event]);
    return [super hitTest:point withEvent:event];
}

@end
