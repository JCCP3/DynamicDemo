//
//  User.h
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/24.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic ,strong)NSString *userID;
@property (nonatomic ,strong)NSString *userName;
@property (nonatomic ,strong)NSString *userHeadImage;
@property (nonatomic ,strong)NSString *userDynamicCount; //动态个数
@property (nonatomic ,strong)NSString *userAttentionCount;
@property (nonatomic ,strong)NSString *userFansCount;
@property (nonatomic ,strong)NSString *userAvatar;

@end
