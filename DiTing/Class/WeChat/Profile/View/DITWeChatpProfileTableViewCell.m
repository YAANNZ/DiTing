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

- (void)setAccountData:(DITWeChatAccount *)accountData
{
    _accountData = accountData;
}


@end
