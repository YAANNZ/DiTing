//
//  UITextView+DITPlaceholder.m
//  DiTing
//
//  Created by ZHUYN on 2018/6/14.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "UITextView+DITPlaceholder.h"

@implementation UITextView (DITPlaceholder)

- (NSString *)placeholder
{
    return self.placeholderLabel.text;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeholderLabel.text = placeholder;
    
    [self changeLabelFrame];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textsDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (UILabel *)placeholderLabel
{
    UILabel *tempLabel = objc_getAssociatedObject(self, @"placeholderLabel");
    
    if (!tempLabel)
    {
        tempLabel = [[UILabel alloc] init];
        tempLabel.font = self.font;
        tempLabel.textColor = [UIColor grayColor];
        tempLabel.textAlignment = NSTextAlignmentLeft;
        tempLabel.numberOfLines = 0;
        
        [self addSubview:tempLabel];
        
        objc_setAssociatedObject(self, @"placeholderLabel", tempLabel, OBJC_ASSOCIATION_RETAIN);
    }
    
    return tempLabel;
}

- (void)changeLabelFrame
{
    CGSize size = CGSizeMake(self.bounds.size.width - 20, CGFLOAT_MAX);
    
    CGSize labelSize = [self.placeholder boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size;
    
    self.placeholderLabel.frame = CGRectMake(5, 5, labelSize.width, labelSize.height);
}

- (void)textsDidChange:(NSNotification *)notify
{
    self.placeholderLabel.hidden = self.text.length;
}

@end
