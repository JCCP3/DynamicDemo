//
//  BaseNavController.h
//  NavigationBarDemo
//
//  Created by JC_CP3 on 15/7/21.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BackGestureOffsetXToBack 80//>80 show pre vc

@interface BaseNavController : UINavigationController<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL enableBackGesture;

@end
