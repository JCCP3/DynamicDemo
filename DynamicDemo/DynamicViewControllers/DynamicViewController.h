//
//  DynamicViewController.h
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "BaseViewController.h"
#import "DynamicCell.h"

@interface DynamicViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,DynamicCellDelegate>

@property (nonatomic, assign) BOOL isShowPersonalHomePage; //是否展示别人的个人主页

@end
