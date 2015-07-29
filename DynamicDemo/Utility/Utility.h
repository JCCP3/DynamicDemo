//
//  Utility.h
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (BOOL)isBlankString:(NSString *)string;

+ (NSString *)changeDateToDaysAgo:(NSString *)date;

+ (CGFloat)heightForLabel:(NSString *)content constrsize:(CGFloat)width withLabelFont:(CGFloat)labelFont;

+ (CGFloat)widthForLabel:(NSString *)content constrsize:(CGFloat)height widthLabelFont:(CGFloat)labelFont;

+ (UIColor *) colorWithHexString: (NSString *)color;

+ (UIImage *)createScoreImage:(NSInteger)rating;

//简单版本计算文本大小
+ (CGSize)simpleSizeWithStr:(NSString *)str font:(UIFont *)font;

@end
