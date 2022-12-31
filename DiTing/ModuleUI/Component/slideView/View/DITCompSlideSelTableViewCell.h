//
//  DITCompSlideSelTableViewCell.h
//  DiTing
//
//  Created by ZHUYN on 2018/2/28.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DITCompSideSelModel.h"

@interface DITCompSlideSelTableViewCell : UITableViewCell

@property (nonatomic, strong) DITCompSideSelModel *compSideSelModel;

+ (DITCompSlideSelTableViewCell *)cellWithTableView:(UITableView *)tableView;

@end
