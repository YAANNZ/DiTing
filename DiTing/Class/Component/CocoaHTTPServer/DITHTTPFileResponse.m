//
//  DITHTTPFileResponse.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/6.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITHTTPFileResponse.h"

@implementation DITHTTPFileResponse

- (NSDictionary *)httpHeaders
{
    return @{
             @"Content-Type": @"application/octet-stream",
             @"Content-Disposition": @"attachment"
             };
}

@end
