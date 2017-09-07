//
//  DITWeChatContactsTableViewCell.m
//  DiTing
//
//  Created by ZHUYN on 2017/9/7.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITWeChatContactsTableViewCell.h"

@implementation DITWeChatContactsTableViewCell
{
    UIImageView *_iconImageView;
    UILabel *_nameLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 这行代是为了解决tableview开启了字母序列索引之后cell会向左缩进一段距离的问题
//        self.contentView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        
        [self setupView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.size.width = 375;
    [super setFrame:frame];
}

- (void)setupView
{
    _iconImageView = [UIImageView new];
    [self.contentView addSubview:_iconImageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.textColor = [UIColor darkGrayColor];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_nameLabel];
    
    
    CGFloat margin = 8;
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(margin);
        make.width.height.mas_equalTo(35);
        make.centerY.mas_equalTo(0);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(margin);
        make.centerY.equalTo(_iconImageView.mas_centerY);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(-margin);
    }];
}

- (void)setModel:(DITWeChatContactModel *)model
{
    _model = model;
    
    _nameLabel.text = [NSString stringWithFormat:@"%@",model.name];
    _iconImageView.image = [UIImage imageNamed:model.imageName];
}
@end
