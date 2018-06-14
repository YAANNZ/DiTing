//
//  NSObject+DITKeyValues.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/14.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "NSObject+DITKeyValues.h"

@implementation NSObject (DITKeyValues)

+ (instancetype)modelWithKeyValues:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivarList[i];
        
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        NSString *key = [propertyName substringFromIndex:1];
        
        NSString *value = dict[key];
        NSString *propertyType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)]; // @"@\"NSString\""
        
        if ([value isKindOfClass:[NSDictionary class]] && ![propertyType containsString:@"NS"])
        {
            // 二级字典转模型
            propertyType = [propertyType substringWithRange:NSMakeRange(2, propertyType.length-3)];
            
            Class modelClass = NSClassFromString(propertyType);
            value = [modelClass modelWithKeyValues:(NSDictionary *)value];
        }
        
        if (value)
        {
            [obj setValue:value forKey:key];
        }
    }
    
    return obj;
}

@end
