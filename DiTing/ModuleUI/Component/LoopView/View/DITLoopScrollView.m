//
//  DITLoopScrollView.m
//  DiTing
//
//  Created by ZHUYN on 2018/3/13.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITLoopScrollView.h"

@interface DITLoopScrollView ()

@property (nonatomic, strong) UIImageView *imgVF;
@property (nonatomic, strong) UIImageView *imgVS;
@property (nonatomic, strong) UIImageView *imgVT;

@end

@implementation DITLoopScrollView

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
    self.imgVF = [[UIImageView alloc] init];
    self.imgVF.image = [UIImage imageNamed:@"banner1"];
    [self addSubview:self.imgVF];
    
    self.imgVS = [[UIImageView alloc] init];
    self.imgVS.image = [UIImage imageNamed:@"Work_banner"];
    [self addSubview:self.imgVS];
    
    self.imgVT = [[UIImageView alloc] init];
    self.imgVT.image = [UIImage imageNamed:@"banner1"];
    [self addSubview:self.imgVT];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.imgVF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(@0);
        make.width.mas_equalTo(MAINSCREEN_WIDTH);
    }];
}

@end
