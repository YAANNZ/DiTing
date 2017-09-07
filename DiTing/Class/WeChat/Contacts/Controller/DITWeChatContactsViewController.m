//
//  DITWeChatContactsViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/8/17.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITWeChatContactsViewController.h"
#import "DITWeChatContactModel.h"

@interface DITWeChatContactsViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSMutableArray *sectionDataArray;
@property (nonatomic, strong) NSMutableArray *sectionTitlesArray;

@end

@implementation DITWeChatContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubviews];
}

- (void)addSubviews
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    
    UISearchBar *bar = self.searchController.searchBar;
    bar.barStyle = UIBarStyleDefault;
    bar.translucent = YES;
    bar.barTintColor = WeChat_Global_mainColor;
    bar.tintColor = DITColor(0, 190, 10, 1);
    
    UIImageView *view = [[[bar.subviews objectAtIndex:0] subviews] firstObject];
    view.layer.borderColor = WeChat_Global_mainColor.CGColor;
    view.layer.borderWidth = 1;
    
    bar.layer.borderColor = [UIColor redColor].CGColor;
    bar.showsBookmarkButton = YES;
    [bar setImage:[UIImage imageNamed:@"VoiceSearchStartBtn"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    bar.delegate = self;
    
    CGRect rect = bar.frame;
    rect.size.height = 44;
    bar.frame = rect;
    
    _tableView.tableHeaderView = bar;
    _tableView.rowHeight = 50;
    _tableView.sectionIndexColor = [UIColor lightGrayColor];
    _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    _tableView.sectionHeaderHeight = 25;
    
    [self genDataWithCount:30];
}

- (void)genDataWithCount:(NSInteger)count
{
    NSArray *xings = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"冯",@"陈",@"楚",@"卫",@"蒋",@"端木",@"韩",@"杨"];
    NSArray *ming1 = @[@"大",@"美",@"帅",@"应",@"超",@"海",@"江",@"湖",@"春",@"夏",@"秋",@"冬",@"上",@"左",@"有",@"纯"];
    NSArray *ming2 = @[@"强",@"好",@"领",@"亮",@"超",@"华",@"奎",@"海",@"工",@"青",@"红",@"潮",@"兵",@"垂",@"刚",@"山"];

    NSMutableArray *allDataAry = [NSMutableArray new];
    for (int i = 0; i < count; i++)
    {
        NSString *name = xings[arc4random_uniform((int)xings.count)];
        NSString *ming = ming1[arc4random_uniform((int)ming1.count)];
        name = [name stringByAppendingString:ming];
        if (arc4random_uniform(10) > 3)
        {
            NSString *ming = ming2[arc4random_uniform((int)ming2.count)];
            name = [name stringByAppendingString:ming];
        }
        
        DITWeChatContactModel *model = [DITWeChatContactModel new];
        model.name = name;
        model.imageName = [NSString stringWithFormat:@"%d",arc4random_uniform(24)];
        [allDataAry addObject:model];
    }
    
    [self setUpSectionArray:allDataAry];
}

- (void)setUpSectionArray:(NSMutableArray *)allDataAry
{
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    NSUInteger AZNumbers = [[collation sectionTitles] count];
    NSMutableArray *dataAry = [[NSMutableArray alloc] init];
    for (NSUInteger index = 0; index < AZNumbers; index++)
    {
        [dataAry addObject:[[NSMutableArray alloc] init]];
    }
    
    for (DITWeChatContactModel *contactModel in allDataAry)
    {
        NSUInteger sectionIndex = [collation sectionForObject:contactModel collationStringSelector:@selector(name)];
        [[dataAry objectAtIndex:sectionIndex] addObject:contactModel];
    }
    
    for (NSUInteger index = 0; index < AZNumbers; index++)
    {
        NSMutableArray *persionsForSection = [dataAry objectAtIndex:index];
        [collation sortedArrayFromArray:persionsForSection collationStringSelector:@selector(name)];
        
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
