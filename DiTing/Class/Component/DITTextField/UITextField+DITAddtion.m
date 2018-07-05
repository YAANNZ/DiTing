//
//  UITextField+DITAddtion.m
//  DiTing
//
//  Created by ZHUYN on 2018/7/5.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "UITextField+DITAddtion.h"

@implementation UITextField (DITAddtion)

- (NSString *)defaultText
{
    NSString *defaultText = objc_getAssociatedObject(self, @"defaultText");
    return defaultText;
}

- (void)setDefaultText:(NSString *)defaultText
{
    objc_setAssociatedObject(self, @"defaultText", defaultText, OBJC_ASSOCIATION_COPY);
    
    UILabel *selectLabel = [[UILabel alloc] init];
    selectLabel.text = defaultText;
    selectLabel.backgroundColor = [UIColor colorWithRed:197/255.0 green:198/255.0 blue:202/255.0 alpha:1.0];
    selectLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:selectLabel];
    objc_setAssociatedObject(self, @"selectLabel", selectLabel, OBJC_ASSOCIATION_RETAIN);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenDefaultText:) name:UITextFieldTextDidBeginEditingNotification object:nil];
}

- (UILabel *)selectLabel
{
    UILabel *selectLabel = objc_getAssociatedObject(self, @"selectLabel");
    return selectLabel;
}

- (void)hiddenDefaultText:(NSNotification *)notification
{
    if (self.isEditing && !self.selectLabel.hidden)
    {
        NSLog(@"%@", self.defaultText);
        [self.selectLabel setHidden:YES];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.selectLabel sizeToFit];
    self.selectLabel.width += 6;
    self.selectLabel.height += 6;
    self.selectLabel.layer.cornerRadius = 5;
    self.selectLabel.clipsToBounds = YES;
    self.selectLabel.x = (self.width-self.selectLabel.width)/2;
    self.selectLabel.y = (self.height-self.selectLabel.height)/2;
    NSLog(@"%@", NSStringFromCGRect(self.selectLabel.frame));
}

@end
