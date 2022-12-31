//
//  DITHTTPConnection.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/6.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITHTTPConnection.h"
#import "DITHTTPFileResponse.h"

@implementation DITHTTPConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
    if (path.length == 1)
    {
        return [super httpResponseForMethod:method URI:path];
    }
    
    NSMutableArray *imgDetailAry = [NSMutableArray arrayWithContentsOfFile:ImagesPlistPath];
    NSDictionary *imgDetailDict = imgDetailAry[[[[path componentsSeparatedByString:@"/"] lastObject] integerValue]];
    
    DITHTTPFileResponse *fileResponse = [[DITHTTPFileResponse alloc] initWithFilePath:imgDetailDict[@"imagePath"] forConnection:self];
    fileResponse.filename = imgDetailDict[@"filename"];
    
    return fileResponse;
}

@end
