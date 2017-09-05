//
//  DITWeChatHomeTableViewCell.m
//  DiTing
//
//  Created by ZHUYN on 2017/8/22.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITWeChatHomeTableViewCell.h"

@interface DITWeChatHomeTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation DITWeChatHomeTableViewCell

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _iconImageView = [UIImageView new];
    _iconImageView.layer.cornerRadius = 5;
    _iconImageView.clipsToBounds = YES;
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:16];
    _nameLabel.textColor = [UIColor blackColor];
    
    _timeLabel = [UILabel new];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor lightGrayColor];
    
    _messageLabel = [UILabel new];
    _messageLabel.font = [UIFont systemFontOfSize:14];
    _messageLabel.textColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:_iconImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_messageLabel];
    
    [self setupMasonry];
}

- (void)setupMasonry
{
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(50);
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImageView.mas_top);
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.height.mas_equalTo(26);
    }];
    
    [_messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_left);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(18);
        make.bottom.mas_equalTo(-13);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(_nameLabel.mas_centerY);
        make.height.mas_equalTo(16);
        make.width.mas_lessThanOrEqualTo(60);
    }];
}

- (void)setHomeModel:(DITWeChatHomeModel *)homeModel
{
    _homeModel = homeModel;
    
    _iconImageView.image = [UIImage imageNamed:homeModel.headImg];
    _nameLabel.text = homeModel.nameStr;
    _messageLabel.text = homeModel.msgStr;
    _timeLabel.text = homeModel.timeStr;
}

@end
