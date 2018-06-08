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
    NSMutableDictionary *headersDict = [NSMutableDictionary dictionary];
    [headersDict setValue:@"application/octet-stream" forKey:@"Content-Type"];
    [headersDict setValue:[NSString stringWithFormat:@"attachment; filename=%@", self.filename] forKey:@"Content-Disposition"];
    
    return headersDict;
}

@end
