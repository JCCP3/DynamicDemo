//
//  Book.h
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, strong) NSString *bookID;
@property (nonatomic, strong) NSString *bookName;
@property (nonatomic, strong) NSString *bookAuthor;
@property (nonatomic, strong) NSString *bookCategory;
@property (nonatomic, strong) NSString *bookWordNum;//字数
@property (nonatomic, strong) NSString *bookImage; //书本图片
@property (nonatomic, strong) NSString *bookScore; //评分

- (id)initWithDictionary:(NSDictionary *)jsonObject;

@end
