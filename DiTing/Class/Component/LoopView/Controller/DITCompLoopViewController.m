//
//  DITCompLoopViewController.m
//  DiTing
//
//  Created by ZHUYN on 2018/2/25.
//  Copyright © 2018年 zyn. All rights reserved.
//

#import "DITCompLoopViewController.h"
#import "DITLoopScrollView.h"

@interface DITCompLoopViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, weak) DITLoopScrollView *loopScrollView;

@end

@implementation DITCompLoopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    DITLoopScrollView *loopScrollView = [[DITLoopScrollView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, MAINSCREEN_WIDTH, 210)];
    self.loopScrollView = loopScrollView;
    [self.view addSubview:loopScrollView];

    
    // collectionView 是为了给同事测试UI问题
    UICollectionViewFlowLayout *cvLayout = [UICollectionViewFlowLayout new];
    cvLayout.itemSize = CGSizeMake(MAINSCREEN_WIDTH, 60);
    cvLayout.minimumInteritemSpacing = 0;
    cvLayout.minimumLineSpacing = 0;
    cvLayout.headerReferenceSize = CGSizeMake(MAINSCREEN_WIDTH, 40);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT+210, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT-(NAV_HEIGHT+210)) collectionViewLayout:cvLayout];
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader"];
//    [self.view addSubview:self.collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader" forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor blueColor];
//    if (!headerView.subviews)
//    {
        UILabel *fLabel = [[UILabel alloc] init];
        fLabel.text = @"左边的";
        fLabel.backgroundColor = [UIColor brownColor];
        [headerView addSubview:fLabel];
        
        [fLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(@5);
            make.bottom.equalTo(@-5);
        }];
        
        UILabel *rLabel = [[UILabel alloc] init];
        rLabel.text = @"右边的";
        rLabel.backgroundColor = [UIColor brownColor];
        [headerView addSubview:rLabel];
        
        [rLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@5);
            make.bottom.equalTo(@-5);
            make.right.equalTo(@-5);
        }];
//    }
    return headerView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
//    if (!cell.contentView.subviews)
//    {
        UILabel *fLabel = [[UILabel alloc] init];
    fLabel.backgroundColor = [UIColor redColor];
        fLabel.text = [NSString stringWithFormat:@"%d只", arc4random() % 5];
    fLabel.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:fLabel];
        
        [fLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(@10);
            make.bottom.equalTo(@-10);
            make.right.equalTo(@-10);
        }];
//    }
    return cell;
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
