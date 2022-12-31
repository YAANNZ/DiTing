//
//  DITDataBaseManager.h
//  DiTing
//
//  Created by ZHUYN on 2017/9/21.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DITDataBaseManager : NSObject

+ (DITDataBaseManager *)shareInstanceForWeChat;

// 退出登录务必调用此方法
- (void)closeDBForDisconnect;

@end
