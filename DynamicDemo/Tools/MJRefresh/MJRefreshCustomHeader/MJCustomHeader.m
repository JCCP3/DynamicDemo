//
//  MJCustomHeader.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/30.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "MJCustomHeader.h"
#import "SvGifView.h"

@implementation MJCustomHeader

#pragma mark － 重写基类方法
- (void)prepare
{
    [super prepare];
    
    self.lastUpdatedTimeLabel.hidden = YES; //不显示更新时间
    [self.stateLabel setHidden:YES]; //隐藏状态
    
    
    //添加gif图片
    NSString *gifString = [[NSBundle mainBundle] pathForResource:@"refresh_loading@2x" ofType:@"gif"];
    SvGifView *gifView = [[SvGifView alloc] initWithCenter:CGPointMake(10, 10) fileURL:[NSURL fileURLWithPath:gifString]];
    [self addSubview:gifView];
}

#pragma mark - 重新布局
//- (void)placeSubviews
//{
////    self.arrowView
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
