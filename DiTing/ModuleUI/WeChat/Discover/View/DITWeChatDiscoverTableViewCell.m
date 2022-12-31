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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
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
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:self.titleLabel];
    
    [self addMasonry];
}

- (void)addMasonry
{
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(11);
        make.bottom.offset(-11);
        make.width.equalTo(@22);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView.mas_right).offset(15);
        make.centerY.equalTo(self.imgView.mas_centerY);
    }];
}

- (void)setDiscoverData:(DITWeChatDiscoverModel *)discoverData
{
    _discoverData = discoverData;
    
    self.imgView.image = [UIImage imageNamed:discoverData.Img];
    self.titleLabel.text = discoverData.title;
}

@end
