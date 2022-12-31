//
//  DITWeChatpProfileTableViewCell.m
//  DiTing
//
//  Created by ZHUYN on 2018/1/11.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITWeChatpProfileTableViewCell.h"

static NSString *cellID = @"DITWeChatpProfileTableViewCell";

@interface DITWeChatpProfileTableViewCell()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIImageView *qcodeView;

@end

@implementation DITWeChatpProfileTableViewCell

+ (DITWeChatpProfileTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    DITWeChatpProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[DITWeChatpProfileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    
    self.subtitleLabel = [[UILabel alloc] init];
    self.subtitleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.subtitleLabel];
    
    self.qcodeView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.qcodeView];
    
    [self addMasonry];
}

- (void)addMasonry
{
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(13);
        make.top.offset(12);
        make.bottom.offset(-12);
        make.width.equalTo(@64);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.left.equalTo(self.imgView.mas_right).offset(10);
    }];
    
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-20);
        make.left.equalTo(self.imgView.mas_right).offset(10);
    }];
}

- (void)setAccountData:(DITWeChatAccount *)accountData
{
    _accountData = accountData;
    
    self.imgView.image = [UIImage imageNamed:@"tabbar_meHL"];
    self.titleLabel.text = @"Allen";
    self.subtitleLabel.text = @"crystal_plane";
}


@end
