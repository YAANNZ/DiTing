//
//  DITWeChatDiscoverTableViewCell.h
//  DiTing
//
//  Created by ZHUYN on 2018/1/10.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DITWeChatDiscoverModel.h"

@interface DITWeChatDiscoverTableViewCell : UITableViewCell

@property (nonatomic, strong) DITWeChatDiscoverModel *discoverData;

+ (DITWeChatDiscoverTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
