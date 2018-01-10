//
//  DITWeChatDiscoverTableViewCell.m
//  DiTing
//
//  Created by ZHUYN on 2018/1/10.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITWeChatDiscoverTableViewCell.h"

static NSString *cellID = @"DITWeChatDiscoverTableViewCell";

@interface DITWeChatDiscoverTableViewCell()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DITWeChatDiscoverTableViewCell

+ (DITWeChatDiscoverTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    DITWeChatDiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[DITWeChatDiscoverTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    return cell;
}

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
    self.imgView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imgView];
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    [self addMasonry];
}

- (void)addMasonry
{
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        
    }];
}

- (void)setDiscoverData:(DITWeChatDiscoverModel *)discoverData
{
    _discoverData = discoverData;
    
    self.imgView.image = [UIImage imageNamed:discoverData.Img];
}

@end
