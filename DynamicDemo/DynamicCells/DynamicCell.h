//
//  DynamicCell.h
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dynamic.h"

@protocol DynamicCellDelegate <NSObject>

- (void)dynamicCellOnClickComment:(Dynamic *)dynamic;

- (void)dynamicCellOnClickTransmit:(Dynamic *)dynamic;

- (void)dynamicCellOnClickAttention:(Dynamic *)dynamic;

@end

@interface DynamicCell : UITableViewCell

@property (nonatomic, assign) int segmentControlState;
@property (nonatomic, assign) BOOL isShowPersonalHomePage;
@property (nonatomic, assign)id<DynamicCellDelegate> delegate;

- (void)loadDynamicCellData:(Dynamic *)dynamic;

@end
