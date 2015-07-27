//
//  AttentionListViewController.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/27.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "AttentionListViewController.h"

@interface AttentionListViewController ()

@end

@implementation AttentionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 适配头部导航条 */
    [self adaptHeaderViewWithHeight:64.f bgTag:CustomNavigationBarColorRed navTitle:@"动态" segmentArray:@[@"动态",@"热门",@"我的"]];
    [self adaptHeaderViewWithLeftImage:ImageNamed(@"nav_back") leftTitle:nil rightImage:nil rightTitle:nil];
    [self adaptHeaderViewWithLeftAliveSetting:YES leftTitleAndImageAlive:NO rightAlive:NO];
    
    aryData = [[NSMutableArray alloc] init];
    attentionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64.f, DEVICE_AVALIABLE_WIDTH, DEVICE_AVALIABLE_HEIGHT-64.f)];
    attentionTableView.delegate = self;
    attentionTableView.dataSource = self;
    attentionTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:attentionTableView];
    
    
    for (int i = 0; i<10 ; i++) {
        User *user = [[User alloc] init];
        user.userName = [NSString stringWithFormat:@"苍老湿%d号",i];
        user.userAttentionCount = @"12";
        user.userFansCount = @"120000";
        user.userDynamicCount = @"100";
        [aryData addObject:user];
    }
    
    [attentionTableView reloadData];
    
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
#pragma mark UITableViewDelegate & dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [aryData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"";
    
    AttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[AttentionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell loadAttentionCellData:[aryData objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 77;
}

#pragma LeftAction
- (void)onClickLeftBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
