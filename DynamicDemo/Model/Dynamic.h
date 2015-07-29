//
//  Dynamic.h
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Dynamic : NSObject

@property (nonatomic, strong) NSString *dynamicCategoryID; //动态类别
@property (nonatomic, strong) NSString *dynamicTransmitCategoryID; //转发的动态的ID
@property (nonatomic, strong) NSString *dynamicUserID;
@property (nonatomic, strong) NSString *dynamicUserName;
@property (nonatomic, assign) BOOL isAttentionDynamicUser; //是否关注发布动态用户
@property (nonatomic, strong) NSString *dynamicUserAvatar;
@property (nonatomic, strong) NSString *dynamicTitle;
@property (nonatomic, strong) NSString *dynamicContent;
@property (nonatomic, strong) NSString *dynamicPublishDate;
@property (nonatomic, strong) NSString *dynamicCommentNum; //评论数量
@property (nonatomic, strong) NSString *dynamicTransmitNum; //转发量
@property (nonatomic, assign) BOOL dynamicIsTransmitAlive; //是否转发
@property (nonatomic, strong) NSString *dynamicTransmitPersons; //我关注的用户转发动态的人
@property (nonatomic, assign) BOOL dynamicIsHot; //是否热门
@property (nonatomic, strong) Book *dynamicAppointBook; //动态书评依赖的书籍
@property (nonatomic, assign) BOOL isMySelf; //是否自己发的动态
@property (nonatomic, assign) BOOL isAttention; //是否已关注

-(void)setDynamicWithDataDic:(NSDictionary *)dic;

@end
