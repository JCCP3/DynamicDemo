//
//  Utility.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "Utility.h"

@implementation Utility


+(CGFloat)heightForLabel:(NSString *)content constrsize:(CGFloat)width withLabelFont:(CGFloat)labelFont{
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:labelFont]};
    
    CGRect currentRect = [content boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    
    return currentRect.size.height;
    
}

+(CGFloat)widthForLabel:(NSString *)content constrsize:(CGFloat)height widthLabelFont:(CGFloat)labelFont{
    
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:labelFont]};
    
    CGRect currentRect = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil];
    
    return currentRect.size.width;
    
    
}


//判断string是否为空
+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil)
    {
        return YES;
    }
    if (string == NULL)
    {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
        
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0)
    {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)changeDateToDaysAgo:(NSString *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate * d = [dateFormatter dateFromString:date];
    
    NSTimeInterval late = [d timeIntervalSince1970]*1;
    
    NSString * timeString = nil;
    
    NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    
    NSTimeInterval cha = now - late;
    if (cha/3600 < 1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        int num= [timeString intValue];
        
        if (num <= 1) {
            
            timeString = [NSString stringWithFormat:@"刚刚..."];
            
        }else{
            
            timeString = [NSString stringWithFormat:@"%@分钟前", timeString];
            
        }
        
    }
    
    if (cha/3600 > 1 && cha/86400 < 1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        timeString = [NSString stringWithFormat:@"%@小时前", timeString];
        
    }
    
    if (cha/86400 > 1)
        
    {
        
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        int num = [timeString intValue];
        
        if (num < 2) {
            
            timeString = [NSString stringWithFormat:@"昨天"];
            
        }else if(num == 2){
            
            timeString = [NSString stringWithFormat:@"前天"];
            
        }else if (num > 2 && num <7){
            
            timeString = [NSString stringWithFormat:@"%@天前", timeString];
            
        }else if (num >= 7 && num <= 10) {
            
            timeString = [NSString stringWithFormat:@"1周前"];
            
        }else if(num > 10){
            
            timeString = [NSString stringWithFormat:@"n天前"];
            
        }
        
    }
    //上述好像有个弊端，忘记了，对于最近的时间，可以用下面的判断
    
    NSTimeInterval secondPerDay = 24*60*60;
    
    NSDate * yesterDay = [NSDate dateWithTimeIntervalSinceNow:-secondPerDay];
    
    NSCalendar * calendar = [NSCalendar currentCalendar];
    
    unsigned uintFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents * souretime = [calendar components:uintFlags fromDate:d];
    
    NSDateComponents * yesterday = [calendar components:uintFlags fromDate:yesterDay];
    
    if (souretime.year == yesterday.year && souretime.month == yesterday.month && souretime.day == yesterday.day){
        
        [dateFormatter setDateFormat:@"HH:mm"];
        
        timeString = [NSString stringWithFormat:@" 昨天 %@ ",[dateFormatter stringFromDate:d]];
    }
    
    return timeString;

}

#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

#pragma mark 根据得分
+ (UIImage *)createScoreImage:(NSInteger)rating
{
    CGSize imgSize = CGSizeMake(66, 10);
    UIGraphicsBeginImageContextWithOptions(imgSize, NO, 2.0);
    
    UIImage *redStar = ImageNamed(@"forum_red_star.png");
    UIImage *grayStar = ImageNamed(@"forum_gray_star.png");
    
    NSInteger redStarCount = rating;
    NSInteger grayStarCount = 5 - rating;
    CGFloat space = 14;
    for (int i = 0; i < redStarCount; i++) {
        [redStar drawAtPoint:CGPointMake(i * space, 0)];
    }
    CGFloat positionX = space * redStarCount;
    for (int j = 0; j < grayStarCount; j++) {
        [grayStar drawAtPoint:CGPointMake(positionX + j * space, 0)];
    }
    
    // Read the UIImage object
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end
