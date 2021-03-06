//
//  DITRecordView.m
//  DiTing
//
//  Created by ZHUYN on 2018/3/26.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITRecordView.h"
#import "DITRecordButton.h"

@interface DITRecordView () <DITRecordButtonDelegate>

@property (nonatomic, weak) DITRecordButton *pressBtn;
@property (nonatomic, weak) UIButton *addBtn;

@end

@implementation DITRecordView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews
{
    self.backgroundColor = [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0];
    
    DITRecordButton *pressBtn = [DITRecordButton buttonWithType:UIButtonTypeCustom];
    self.pressBtn = pressBtn;
    self.pressBtn.delegate = self;
    self.pressBtn.layer.cornerRadius = 5;
    self.pressBtn.layer.borderWidth = 1.0;
    self.pressBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.pressBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
    [self.pressBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:pressBtn];
    
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addBtn = addBtn;
    [addBtn setBackgroundImage:[UIImage imageNamed:@"record_add"] forState:UIControlStateNormal];
    [self addSubview:addBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frame = CGRectMake(0, MAINSCREEN_HEIGHT - 50, MAINSCREEN_WIDTH, 300);
    
    self.pressBtn.frame = CGRectMake(SCALE_WIDTH(45), 5, SCALE_WIDTH(240), 40);
    self.addBtn.frame = CGRectMake(MAINSCREEN_WIDTH - 55, 10, 30, 30);
}


#pragma mark - DITRecordButtonDelegate
- (void)recordButtonBeginRecord
{
    
}

- (void)recordButtonEndRecordWithFinishState:(BOOL)isFinish
{
    
}


@end
