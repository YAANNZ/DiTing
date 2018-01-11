//
//  DITWeChatpProfileTableViewCell.h
//  DiTing
//
//  Created by ZHUYN on 2018/1/11.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DITWeChatAccount.h"

@interface DITWeChatpProfileTableViewCell : UITableViewCell

@property (nonatomic, strong) DITWeChatAccount *accountData;

+ (DITWeChatpProfileTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
