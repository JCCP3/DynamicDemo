//
//  UIButton+UIButtonImageWithLabel.m
//  NavigationBarDemo
//
//  Created by JC_CP3 on 15/7/20.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "UIButton+UIButtonImageWithLabel.h"

@implementation UIButton (UIButtonImageWithLabel)

-(void)setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType{
    
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)

//    CGFloat buttonImageViewWidth = CGImageGetWidth(image.CGImage);
//    CGFloat buttonImageViewHeight = CGImageGetWidth(image.CGImage);
    
//    self.backgroundColor = [UIColor blueColor];
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.titleLabel.backgroundColor = [UIColor blackColor];
    
    
//    CGFloat buttonImageViewWidth = 19;
//    CGFloat buttonImageViewHeight = 16;
//    UIFont *buttonTitleFont = [UIFont systemFontOfSize:17.0f];
//    CGSize buttonTitleLabelSize = [title sizeWithFont:buttonTitleFont];
//    
//    //得到对应Button的宽度高度至少
//    CGFloat buttonWidth = buttonImageViewWidth + buttonTitleLabelSize.width;
//    CGFloat buttonHeight = buttonImageViewHeight + buttonTitleLabelSize.height;
//    
//    self.center = CGPointMake(buttonWidth/2, buttonHeight/2);
//    [self setBounds:CGRectMake(0, 0, buttonWidth, buttonHeight)];
//    [self.titleLabel setFont:buttonTitleFont];
    
    
    
//    CGPoint buttonBoundsCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
//    // 找出imageView最终的center
//    CGPoint endImageViewCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetMidY(self.imageView.bounds));
//    // 找出titleLabel最终的center
//    CGPoint endTitleLabelCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetHeight(self.bounds)-CGRectGetMidY(self.titleLabel.bounds));
//    // 取得imageView最初的center
//    CGPoint startImageViewCenter = self.imageView.center;
//    // 取得titleLabel最初的center
//    CGPoint startTitleLabelCenter = self.titleLabel.center;
//    
//    // 设置imageEdgeInsets
//    CGFloat imageEdgeInsetsTop = endImageViewCenter.y - startImageViewCenter.y;
//    CGFloat imageEdgeInsetsLeft = endImageViewCenter.x - startImageViewCenter.x;
//    CGFloat imageEdgeInsetsBottom = -imageEdgeInsetsTop;
//    CGFloat imageEdgeInsetsRight = -imageEdgeInsetsLeft;
//    self.imageEdgeInsets = UIEdgeInsetsMake(imageEdgeInsetsTop, imageEdgeInsetsLeft, imageEdgeInsetsBottom, imageEdgeInsetsRight);
    [self setImage:image forState:stateType];
    
//    // 设置titleEdgeInsets
//    CGFloat titleEdgeInsetsTop = endTitleLabelCenter.y-startTitleLabelCenter.y;
//    CGFloat titleEdgeInsetsLeft = endTitleLabelCenter.x - startTitleLabelCenter.x;
//    CGFloat titleEdgeInsetsBottom = -titleEdgeInsetsTop;
//    CGFloat titleEdgeInsetsRight = -titleEdgeInsetsLeft;
//    self.titleEdgeInsets = UIEdgeInsetsMake(titleEdgeInsetsTop, titleEdgeInsetsLeft, titleEdgeInsetsBottom, titleEdgeInsetsRight);
//    [self.titleLabel setContentMode:UIViewContentModeCenter];
//    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
//    [self.titleLabel setTextColor:[UIColor redColor]];
    [self setTitle:title forState:stateType];
    
}

@end
