//
//  AttentionListViewController.h
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/27.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "BaseViewController.h"
#import "AttentionCell.h"

@interface AttentionListViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *attentionTableView;
    
    NSMutableArray *aryData;
    
    
}

@end
