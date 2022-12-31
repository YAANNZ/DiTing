//
//  UITextView+DITPlaceholder.h
//  DiTing
//
//  Created by ZHUYN on 2018/6/14.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (DITPlaceholder)

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, weak) UILabel *placeholderLabel;

@end
