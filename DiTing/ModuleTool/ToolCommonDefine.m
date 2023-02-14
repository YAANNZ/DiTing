//
//  ToolCommonDefine.m
//  AFNetworking
//
//  Created by huangjiming on 2020/3/16.
//

#import "ToolCommonDefine.h"

UIColor *UIDynamicColorWithRGBValue(NSInteger rgbLight, NSInteger rgbDark)
{
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor colorWithRed:((CGFloat)((rgbDark & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbDark & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbDark & 0x0000FF))/255.0 alpha:1.0];
            } else {
                return [UIColor colorWithRed:((CGFloat)((rgbLight & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbLight & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbLight & 0x0000FF))/255.0 alpha:1.0];
            }
        }];
    } else {
        return [UIColor colorWithRed:((CGFloat)((rgbLight & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbLight & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbLight & 0x0000FF))/255.0 alpha:1.0];
    }
}

UIColor *UIDynamicColorWithRGBAValue(NSInteger rgbLight, CGFloat alphaLight, NSInteger rgbDark, CGFloat alphaDark)
{
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor colorWithRed:((CGFloat)((rgbDark & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbDark & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbDark & 0x0000FF))/255.0 alpha:alphaDark];
            } else {
                return [UIColor colorWithRed:((CGFloat)((rgbLight & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbLight & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbLight & 0x0000FF))/255.0 alpha:alphaLight];
            }
        }];
    } else {
        return [UIColor colorWithRed:((CGFloat)((rgbLight & 0xFF0000) >> 16))/255.0 green:((CGFloat)((rgbLight & 0x00FF00) >> 8))/255.0 blue:((CGFloat)(rgbLight & 0x0000FF))/255.0 alpha:alphaLight];
    }
}

UIColor *UIDynamicColorWithRGB(CGFloat rLight, CGFloat gLight, CGFloat bLight, CGFloat rDark, CGFloat gDark, CGFloat bDark)
{
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor colorWithRed:rDark/255.0 green:gDark/255.0 blue:bDark/255.0 alpha:1.0];
            } else {
                return [UIColor colorWithRed:rLight/255.0 green:gLight/255.0 blue:bLight/255.0 alpha:1.0];
            }
        }];
    } else {
        return [UIColor colorWithRed:rLight/255.0 green:gLight/255.0 blue:bLight/255.0 alpha:1.0];
    }
}

UIColor *UIDynamicColorWithRGBA(CGFloat rLight, CGFloat gLight, CGFloat bLight, CGFloat alphaLight, CGFloat rDark, CGFloat gDark, CGFloat bDark, CGFloat alphaDark)
{
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor colorWithRed:rDark/255.0 green:gDark/255.0 blue:bDark/255.0 alpha:alphaDark];
            } else {
                return [UIColor colorWithRed:rLight/255.0 green:gLight/255.0 blue:bLight/255.0 alpha:alphaLight];
            }
        }];
    } else {
        return [UIColor colorWithRed:rLight/255.0 green:gLight/255.0 blue:bLight/255.0 alpha:alphaLight];
    }
}
