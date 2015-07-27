//
//  Book.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "Book.h"

@implementation Book

- (id)initWithDictionary:(NSDictionary *)jsonObject
{
    if (self = [super init]) {
        if (jsonObject && [jsonObject isKindOfClass:[NSDictionary class]]) {
            [self setValuesForKeysWithDictionary:jsonObject];
        }
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
