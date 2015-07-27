//
//  UIButton+UIButtonImageWithLabel.h
//  NavigationBarDemo
//
//  Created by JC_CP3 on 15/7/20.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (UIButtonImageWithLabel)

//扩展类方法
-(void)setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType;

@end
