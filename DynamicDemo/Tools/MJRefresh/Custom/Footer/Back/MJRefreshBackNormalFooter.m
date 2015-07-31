//
//  MJRefreshBackNormalFooter.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshBackNormalFooter.h"
#import "SvGifView.h"

@interface MJRefreshBackNormalFooter()
{
    __weak UIImageView *_arrowView;
}
@property (weak, nonatomic)SvGifView *gifView;
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@end

@implementation MJRefreshBackNormalFooter
#pragma mark - 懒加载子控件
- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
    self.loadingView = nil;
    [self setNeedsLayout];
}

#pragma makr - 重写父类的方法
- (void)prepare
{
    [super prepare];

//    [self.stateLabel setHidden:YES];
    [self setTitle:MJRefreshAutoFooterIdleText forState:MJRefreshStateIdle];
    [self setTitle:MJRefreshAutoFooterRefreshingText forState:MJRefreshStateRefreshing];
    [self setTitle:MJRefreshAutoFooterNoMoreDataText forState:MJRefreshStateNoMoreData];

    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    // 箭头
    self.arrowView.mj_size = self.arrowView.image.size;
    CGFloat arrowCenterX = self.mj_w * 0.5;
    if (!self.stateLabel.hidden) {
        arrowCenterX -= 100;
    }
    CGFloat arrowCenterY = self.mj_h * 0.5;
    self.arrowView.center = CGPointMake(arrowCenterX, arrowCenterY);
    
    self.loadingView.center = CGPointMake(arrowCenterX, arrowCenterY);
    
    // 圈圈
//    self.gifView.frame = CGRectMake(CGRectGetMinX(self.arrowView.frame), CGRectGetMinY(self.arrowView.frame), CGRectGetWidth(_gifView.bounds), CGRectGetHeight(_gifView.bounds));
//    self.gifView.center = self.arrowView.center;
   
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self.loadingView stopAnimating];
    } else if (state == MJRefreshStateRefreshing) {
        [self.loadingView startAnimating];
    }
}

@end
