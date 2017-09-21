//
//  DITDataBaseManager.m
//  DiTing
//
//  Created by ZHUYN on 2017/9/21.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITDataBaseManager.h"
#import "FMDB.h"

@interface DITDataBaseManager()

@property (nonatomic, strong) FMDatabaseQueue *WeChatDbQueue;

@end

@implementation DITDataBaseManager

+ (DITDataBaseManager *)shareInstanceForWeChat
{
    static DITDataBaseManager *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
        [instance weChatDbQueue];
    });
    return instance;
}

- (FMDatabaseQueue *)weChatDbQueue
{
    if (!_WeChatDbQueue)
    {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *documentDirectory = [paths firstObject];
        NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"WeChat.sqlite"];
        _WeChatDbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        
        if (_WeChatDbQueue)
        {
//            [self createAllTableIfNeed];
        }
    }
    return _WeChatDbQueue;
}

- (void)closeDBForDisconnect
{
}

@end
