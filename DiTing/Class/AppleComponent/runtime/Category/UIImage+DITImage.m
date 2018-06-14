//
//  UIImage+DITImage.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/13.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "UIImage+DITImage.h"

@implementation UIImage (DITImage)

+ (nullable UIImage *)ditImangeNamed:(NSString *)name
{
    UIImage *image = [UIImage ditImangeNamed:name];
    if (!image)
    {
        NSLog(@"资源图片不存在");
    }
    
    return image;
}

+ (void)load
{
    Method imageNamedMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method ditImageNamedMethod = class_getClassMethod([UIImage class], @selector(ditImangeNamed:));
    method_exchangeImplementations(imageNamedMethod, ditImageNamedMethod);
}

@end
