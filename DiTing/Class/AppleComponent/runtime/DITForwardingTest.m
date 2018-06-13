//
//  DITForwardingTest.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/13.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITForwardingTest.h"

@implementation DITForwardingTest

- (void)justTestForwarding:(NSString *)testStr
{
    NSLog(@"备用接收者收到justTestForwarding:消息转发，参数：%@", testStr);
}

@end
