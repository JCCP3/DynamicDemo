//
//  DynamicViewController.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "DynamicViewController.h"
#import "DynamicCell.h"
#import "Utility.h"
#import "AttentionListViewController.h"

@interface DynamicViewController (){
    
    UITableView *dynamicTableView;
    NSMutableArray *aryData;
    NSMutableArray *aryHeightData;
    UIImageView *userHeaderImageView;
    UILabel *userNameLabel;
    UILabel *userAttentionLabel;
    UILabel *userFansLabel;
    UILabel *leftLabel;
    UILabel *rightLabel;
    UIButton *editBtn;
    UIView *topView;
    UIView *tableHeaderView;
    UIButton *attentionBtn;
    UIButton *fansBtn;
    
    User *user;
}

@end

@implementation DynamicViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* 适配头部导航条 */
    [self adaptHeaderViewWithHeight:64.f bgTag:CustomNavigationBarColorWhite navTitle:@"动态" segmentArray:@[@"动态",@"热门",@"我的"]];
    [self adaptHeaderViewWithLeftImage:nil leftTitle:nil rightImage:nil rightTitle:nil];
    [self adaptHeaderViewWithLeftAliveSetting:NO leftTitleAndImageAlive:NO rightAlive:NO];
    
    dynamicTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64.f+44.f, DEVICE_AVALIABLE_WIDTH, DEVICE_AVALIABLE_HEIGHT-64-44)];
    dynamicTableView.delegate = self;
    dynamicTableView.dataSource = self;
    dynamicTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:dynamicTableView];
    aryData = [[NSMutableArray alloc] init];
    aryHeightData = [[NSMutableArray alloc] init];
    
    for (int i=0; i<10; i++) {
        
        Dynamic *dynamic = [[Dynamic alloc] init];
        int categoryID = i%3;
        dynamic.dynamicTransmitPersons = @"张三、李四";
        dynamic.dynamicCategoryID = [NSString stringWithFormat:@"%d",categoryID+1];
        dynamic.dynamicTransmitCategoryID = @"2";
        dynamic.dynamicUserID = [NSString stringWithFormat:@"%d",i];
        dynamic.dynamicUserName = [NSString stringWithFormat:@"张三%d号",i+1];
        dynamic.dynamicTitle = @"我是张三";
        dynamic.dynamicContent = @"我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王我是隔壁老王";
        dynamic.dynamicCommentNum = @"22";
        dynamic.dynamicTransmitNum = @"1002";
        dynamic.dynamicPublishDate = @"2015-07-10 12:00:00";
        if (i<5) {
           dynamic.isMySelf = YES;
        } else {
            dynamic.isMySelf = NO;
            if (i<7) {
                dynamic.isAttention = YES;
            }else{
                dynamic.isAttention = NO;
            }
        }
        
        Book *book = [[Book alloc] init];
        book.bookName = @"武大郎大战西门庆";
        book.bookWordNum = @"100字";
        book.bookCategory = @"言情";
        book.bookAuthor = @"张三丰";
        book.bookScore = [NSString stringWithFormat:@"%d",i];
        dynamic.dynamicAppointBook = book;
        [aryData addObject:dynamic];
    }

    //计算每行高度
    [self getTableViewHeight];
    [dynamicTableView reloadData];
}


- (void)layoutTableHeaderView
{
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, 130)];
    [topView setBackgroundColor:[UIColor whiteColor]];
    tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, 150.f)];
    [tableHeaderView setBackgroundColor:[Utility colorWithHexString:@"#f7f7f7"]];
    [tableHeaderView addSubview:topView];
    userHeaderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 90, 90)];
    userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 20, DEVICE_AVALIABLE_WIDTH-15.f-userNameLabel.frame.origin.x, 21.f)];
    userNameLabel.text = user.userName;
    userAttentionLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 65, 30, 21)];
    CGFloat attentionWidth = [Utility widthForLabel:user.userAttentionCount constrsize:21.f widthLabelFont:17.f];
    [userAttentionLabel setFrame:CGRectMake(userAttentionLabel.frame.origin.x, userAttentionLabel.frame.origin.y, attentionWidth, 21.f)];
    userAttentionLabel.text = user.userAttentionCount;
    userFansLabel = [[UILabel alloc] initWithFrame:CGRectMake(175, 65, 36, 21)];
    CGFloat fansWidth = [Utility widthForLabel:user.userFansCount constrsize:21.f widthLabelFont:17.f];
    [userFansLabel setFrame:CGRectMake(userAttentionLabel.frame.origin.x+userAttentionLabel.bounds.size.width+20.f, userFansLabel.frame.origin.y, fansWidth, 21.f)];
    userFansLabel.text = user.userFansCount;
    leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(125, 89, 30, 21)];
    leftLabel.text = @"关注";
    leftLabel.font = [UIFont systemFontOfSize:13.f];
    leftLabel.textColor = [UIColor lightGrayColor];
    rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(175, 89, 30, 21)];
    [rightLabel setFrame:CGRectMake(userFansLabel.frame.origin.x, rightLabel.frame.origin.y, rightLabel.bounds.size.width, rightLabel.bounds.size.height)];
    rightLabel.text = @"粉丝";
    rightLabel.font = [UIFont systemFontOfSize:13.f];
    rightLabel.textColor = [UIColor lightGrayColor];
    attentionBtn = [[UIButton alloc] initWithFrame:CGRectMake(userAttentionLabel.frame.origin.x, userAttentionLabel.frame.origin.y, MAX(userAttentionLabel.bounds.size.width, 30), leftLabel.frame.origin.y+leftLabel.bounds.size.height-userAttentionLabel.frame.origin.y)];
    [attentionBtn addTarget:self action:@selector(onClickShowAttentionUserList) forControlEvents:UIControlEventTouchUpInside];
    fansBtn = [[UIButton alloc] initWithFrame:CGRectMake(userFansLabel.frame.origin.x, userFansLabel.frame.origin.y, MAX(userFansLabel.bounds.size.width, 30), rightLabel.frame.origin.y+rightLabel.bounds.size.height-userFansLabel.frame.origin.y)];
    [fansBtn addTarget:self action:@selector(onClickShowUserFansList) forControlEvents:UIControlEventTouchUpInside];
    editBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICE_AVALIABLE_WIDTH-15-70, 45, 70, 35)];
    editBtn.layer.cornerRadius = 5.f;
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    editBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [editBtn setBackgroundColor:[UIColor orangeColor]];
    
    [topView addSubview:userNameLabel];
    [topView addSubview:userAttentionLabel];
    [topView addSubview:userFansLabel];
    [topView addSubview:userHeaderImageView];
    [topView addSubview:leftLabel];
    [topView addSubview:rightLabel];
    [topView addSubview:editBtn];
    [topView addSubview:attentionBtn];
    [topView addSubview:fansBtn];
    dynamicTableView.tableHeaderView = tableHeaderView;
    
}

- (void)getTableViewHeight
{
    
    for (int i=0; i<[aryData count]; i++) {
        
        CGFloat cellHeight = 0.f;
        
        Dynamic *dynamic = [aryData objectAtIndex:i];
        
        if([dynamic.dynamicCategoryID intValue] == 0){
            cellHeight += 10;
            cellHeight += 21.f;
        }
        
        cellHeight += 12.f; //距离上方12
        
        cellHeight += 21.f; //姓名
        
        //根据类别判断
        if ([dynamic.dynamicCategoryID intValue] == 1 || (([dynamic.dynamicCategoryID intValue] == 0) && [dynamic.dynamicTransmitCategoryID intValue] == 1)) {
            
            cellHeight += 1.f; //姓名与内容之间的距离
            
            //标题＋正文 长文章
            cellHeight += 21.f;//标题
            
            cellHeight -= 3.f; //标题与content之间的距离
            
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:DEVICE_AVALIABLE_WIDTH-15-35-7-15 withLabelFont:14.f];
            
            cellHeight += MIN(21*3, contentLabelHeight); //content内容
            cellHeight += 3.f;// content和评论之间距离
            cellHeight += 20;//评论View
            cellHeight += 12.f;//距离底部距离
            
        } else if ([dynamic.dynamicCategoryID intValue] == 2 || (([dynamic.dynamicCategoryID intValue] == 0) && [dynamic.dynamicTransmitCategoryID intValue] == 2)) {
            
            cellHeight += 1.f; //姓名与内容之间的距离
            
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:DEVICE_AVALIABLE_WIDTH-30-35-7 withLabelFont:14.f];
            
            cellHeight += MIN(14.f*5+14, contentLabelHeight); //content内容
            cellHeight += 10.f;// content和评论之间距离
            cellHeight += 20;//评论View
            cellHeight += 12.f;//距离底部距离
            
        } else if ([dynamic.dynamicCategoryID intValue] == 3 || (([dynamic.dynamicCategoryID intValue] == 0) && [dynamic.dynamicTransmitCategoryID intValue] == 3)) {
            
            cellHeight += 1.f; //姓名与内容之间的距离
            
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:DEVICE_AVALIABLE_WIDTH-30-35-7 withLabelFont:14.f];
    
            cellHeight += MIN(14.f*2+6, contentLabelHeight); //content内容
            cellHeight += 10.f;// content 和引用之间距离
            cellHeight += 65.f; //引用高度
            cellHeight += 14.f;//引用高度与评论View的距离
            cellHeight += 20;//评论View
            cellHeight += 12.f;//距离底部距离
            
        }
        
        NSString *currentCellHeight = [NSString stringWithFormat:@"%f",cellHeight];
        [aryHeightData addObject:currentCellHeight];
        
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

//计算每行高度

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

#pragma mark UITableViewDataSource & UITableViewDelegate
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
    
    static NSString *cellIdentifier = @"DynamicCell";
    DynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[DynamicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell loadDynamicCellData:[aryData objectAtIndex:indexPath.row]];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *heightString = [aryHeightData objectAtIndex:indexPath.row];
    
    return [heightString floatValue];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark Segoment_Action
-(void)onClickSegment:(id)sender{
    
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    
    if (segmentControl.selectedSegmentIndex == 0) {
        //动态
        dynamicTableView.tableHeaderView = nil;
    } else if (segmentControl.selectedSegmentIndex == 1) {
        //热门
        dynamicTableView.tableHeaderView = nil;
    }else if (segmentControl.selectedSegmentIndex == 2) {
        //我的
        user = [[User alloc] init];
        user.userName = @"苍老师";
        user.userAttentionCount = @"12";
        user.userFansCount = @"120000";
        [self layoutTableHeaderView];
    }
    
}

#pragma mark 关注 粉丝Action
- (void)onClickShowAttentionUserList
{
    AttentionListViewController *viewController = [[AttentionListViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)onClickShowUserFansList
{
    AttentionListViewController *viewController = [[AttentionListViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
