//
//  DITWeChatHomeViewController.m
//  DiTing
//
//  Created by ZHUYN on 2017/8/17.
//  Copyright © 2017年 zyn. All rights reserved.
//

#import "DITWeChatHomeViewController.h"
#import "DITWeChatHomeTableViewCell.h"
#import "DITWeChatHomeModel.h"
#import "DITWeChatChatTableViewController.h"
#import "ViewController.h"

#define DITWeChatHomeCellID @"DITWeChatHomeCellID"

@interface DITWeChatHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <DITWeChatHomeModel *> *sessionArray;

// temp
@property (nonatomic, strong) NSArray *namesArray;
@property (nonatomic, strong) NSArray *iconNamesArray;
@property (nonatomic, strong) NSArray *messagesArray;

@end

@implementation DITWeChatHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupSubview];
    
    [self getAllData];
}

- (void)setupSubview
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 70;
    [tableView registerClass:[DITWeChatHomeTableViewCell class] forCellReuseIdentifier:DITWeChatHomeCellID];
    [self.view addSubview:tableView];
    
    self.navigationController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backEvent)];
}

- (void)backEvent
{
    UIApplication.sharedApplication.keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
}

- (void)getAllData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:home_allMsg parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"flag"] integerValue] == 0)
        {
            self.sessionArray = [DITWeChatHomeModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"]];
            [self.tableView reloadData];
        }
        else
        {
            ShowMBProgressHUDText(responseObject[@"msg"])
        }
     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sessionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DITWeChatHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DITWeChatHomeCellID];
    cell.homeModel = self.sessionArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DITWeChatChatTableViewController *chatVC = [[DITWeChatChatTableViewController alloc] init];
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}


- (NSMutableArray *)sessionArray
{
    if (!_sessionArray)
    {
        _sessionArray = [NSMutableArray array];
        
        for (int i = 0; i < 10; i++)
        {
            DITWeChatHomeModel *dataModel = [[DITWeChatHomeModel alloc] init];
            dataModel.imageName = [self randomData:self.iconNamesArray];
            dataModel.name = [self randomData:self.namesArray];
            dataModel.message = [self randomData:self.messagesArray];
            dataModel.time = @"13:05";
            [_sessionArray addObject:dataModel];
        }
    }
    return _sessionArray;
}



- (NSString *)randomData:(NSArray *)dataAry
{
    int randomIndex = arc4random_uniform((int)dataAry.count);
    return dataAry[randomIndex];
}

#pragma mark - 懒加载
- (NSArray *)namesArray
{
    if (!_namesArray) {
        _namesArray = @[@"二龙湖浩哥",
                       @"微风",
                       @"夜在哭泣",
                       @"GSD_iOS",
                       @"hello world",
                       @"大脸猫",
                       @"你似不似傻",
                       @"天天向上",
                       @"不爱掏粪男孩",
                       @"最爱欧巴",
                       @"大长腿思密达",
                       @"别给我晒脸",
                       @"可爱男孩",
                       @"筷子姐妹",
                       @"法海你不懂爱",
                       @"长城长",
                       @"老北京麻辣烫",
                       @"我不搞笑",
                       @"原来我不帅",
                       @"亲亲我的宝贝",
                       @"请叫我吴彦祖",
                       @"帅锅莱昂纳多",
                       @"星星之火"
                       ];
    }
    return _namesArray;
}

- (NSArray *)iconNamesArray
{
    if (!_iconNamesArray) {
        NSMutableArray *temp = [NSMutableArray new];
        for (int i = 0; i < 24; i++) {
            NSString *iconName = [NSString stringWithFormat:@"%d.jpg", i];
            [temp addObject:iconName];
        }
        _iconNamesArray = [temp copy];
    }
    return _iconNamesArray;
}

- (NSArray *)messagesArray
{
    if (!_messagesArray) {
        _messagesArray = @[@"二龙湖浩哥：什么事？🐂🐂🐂🐂",
                          @"微风：麻蛋！！！",
                          @"夜在哭泣：好好地，🐂别瞎胡闹",
                          @"GSD_iOS：SDAutoLayout  下载地址http://www.cocoachina.com/ios/20151223/14778.html",
                          @"hello world：🐂🐂🐂我不懂",
                          @"大脸猫：这。。。。。。酸爽~ http://www.cocoachina.com/ios/20151223/14778.html",
                          @"你似不似傻：呵呵🐎🐎🐎🐎🐎🐎",
                          @"天天向上：辛苦了！",
                          @"不爱掏粪男孩：新年快乐！猴年大吉！摸摸哒 http://www.cocoachina.com/ios/20151223/14778.html",
                          @"最爱欧巴：[呲牙][呲牙][呲牙]",
                          @"大长腿思密达：[图片]",
                          @"别给我晒脸：坑死我了。。。。。",
                          @"可爱男孩：你谁？？？🐎🐎🐎🐎",
                          @"筷子姐妹：和尚。。尼姑。。",
                          @"法海你不懂爱：春晚太难看啦，妈蛋的🐎🐎🐎🐎🐎🐎🐎🐎",
                          @"长城长：好好好~~~",
                          @"老北京麻辣烫：约起 http://www.cocoachina.com/ios/20151223/14778.html",
                          @"我不搞笑：寒假过得真快",
                          @"原来我不帅：有木有人儿？",
                          @"亲亲我的宝贝：你🐎说🐎啥🐎呢",
                          @"请叫我吴彦祖：好搞笑🐎🐎🐎，下次还来",
                          @"帅锅莱昂纳多：我不理解 http://www.cocoachina.com/ios/20151223/14778.html",
                          @"星星之火：脱掉，脱掉，统统脱掉🐎"
                          ];
    }
    return _messagesArray;
}







- (void)didReceiveMemoryWarning
{
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
