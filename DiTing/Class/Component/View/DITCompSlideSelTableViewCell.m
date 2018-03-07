//
//  DITCompSlideSelTableViewCell.m
//  DiTing
//
//  Created by ZHUYN on 2018/2/28.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITCompSlideSelTableViewCell.h"

static NSString *cellID = @"DITCompSlideSelTableViewCell";

@interface DITCompSlideSelTableViewCell ()

@property (nonatomic, strong) UIImageView *statusImageView;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation DITCompSlideSelTableViewCell

+ (DITCompSlideSelTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    DITCompSlideSelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[DITCompSlideSelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    self.statusImageView = [[UIImageView alloc] init];
    self.statusImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.statusImageView];
    
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
//    [self.statusImageView addGestureRecognizer:tapGesture];

//    // 平移
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
//    [self.statusImageView addGestureRecognizer:panGesture];
    
    self.contentLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.contentLabel];
    
    [self addMasonry];
}

- (void)addMasonry
{
    [self.statusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.offset(5);
        make.bottom.offset(-5);
        make.width.equalTo(@25);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.statusImageView.mas_right).offset(15);
        make.centerY.equalTo(self.statusImageView.mas_centerY);
    }];
}

- (void)setCompSideSelModel:(DITCompSideSelModel *)compSideSelModel
{
    _compSideSelModel = compSideSelModel;
    
    self.contentLabel.text = compSideSelModel.content;
    
    [self layoutSubviews];
}

//- (void)tapGesture:(UITapGestureRecognizer *)tapGesture
//{
//    self.compSideSelModel.status = !self.compSideSelModel.status;
//
//    [self layoutSubviews];
//}

//- (void)panGesture:(UIPanGestureRecognizer *)panGesture
//{
//    self.compSideSelModel.status = !self.compSideSelModel.status;
//
//    [self layoutSubviews];
//}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.compSideSelModel.status == 0)
    {
        self.statusImageView.image = [UIImage imageNamed:@"slide_unsel"];
    }
    else
    {
        self.statusImageView.image = [UIImage imageNamed:@"slide_sel"];
    }
}

@end
