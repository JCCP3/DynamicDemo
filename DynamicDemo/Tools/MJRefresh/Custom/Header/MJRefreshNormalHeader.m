//
//  MJRefreshNormalHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshNormalHeader.h"
#import "SvGifView.h"

@interface MJRefreshNormalHeader()
{
    __weak UIImageView *_arrowView;
}

@property (weak, nonatomic) SvGifView *gifView;
@property (weak, nonatomic) UIImageView *completeImageView;

@end

@implementation MJRefreshNormalHeader
#pragma mark - 懒加载子控件
- (UIImageView *)arrowView
{
    if (!_arrowView) {
        UIImage *image = [UIImage imageNamed:@"refresh_arrow"];
        if (!image) {
            image = [UIImage imageNamed:@"refresh_arrow"];
        }
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:_arrowView = arrowView];
    }
    return _arrowView;
}


//完成ImageView
- (UIImageView *)completeImageView{
    
    if(!_completeImageView){
        UIImageView *completeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.arrowView.frame), CGRectGetMinY(self.arrowView.frame), 15, 15)];
        completeImageView.center = self.arrowView.center;
        [completeImageView setImage:[UIImage imageNamed:@"refresh_finish"]];
        [self addSubview:_completeImageView = completeImageView];
    }
    
    return _completeImageView;
}

- (SvGifView *)gifView{
    
    if (!_gifView) {
        NSURL *gifURL = [[NSBundle mainBundle] URLForResource:@"refresh_loading@2x" withExtension:@"gif"];
        SvGifView *gifView = [[SvGifView alloc] initWithCenter:self.arrowView.center fileURL:gifURL];
        [self addSubview:_gifView = gifView];
    }
    return _gifView;
}


#pragma makr - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
    [self.stateLabel setHidden:YES];
    [self.lastUpdatedTimeLabel setHidden:YES];

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
    
    // 圈圈
    self.gifView.frame = CGRectMake(CGRectGetMinX(self.arrowView.frame), CGRectGetMinY(self.arrowView.frame)+CGRectGetHeight(self.arrowView.bounds)/2, CGRectGetWidth(_gifView.bounds), CGRectGetHeight(_gifView.bounds));
    
    // 已完成图片
    self.completeImageView.frame = CGRectMake(CGRectGetMinX(self.arrowView.frame), CGRectGetMinY(self.arrowView.frame)+CGRectGetHeight(self.arrowView.bounds)/2, CGRectGetWidth(_completeImageView.bounds), CGRectGetHeight(_completeImageView.bounds));
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateIdle) {
        if (oldState == MJRefreshStateRefreshing) {
            self.arrowView.transform = CGAffineTransformIdentity;
            
            [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
               
                [self.gifView stopGif];
                self.completeImageView.hidden = NO;
                self.completeImageView.layer.opacity = 0;
                
            } completion:^(BOOL finished) {
                // 如果执行完动画发现不是idle状态，就直接返回，进入其他状态
                if (self.state != MJRefreshStateIdle) return;
                
                self.completeImageView.hidden = YES;
                [self.gifView stopGif];
                self.arrowView.hidden = NO; //箭头
                [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
                    self.arrowView.transform = CGAffineTransformIdentity;
                }];
            }];

            
        } else {
            
            /* 第一次进入程序 */
            self.completeImageView.hidden = YES;
            [self.gifView stopGif];
            self.arrowView.hidden = NO; //箭头
            [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
                self.arrowView.transform = CGAffineTransformIdentity;
            }];
        }
    } else if (state == MJRefreshStatePulling) {
        
        [self.gifView stopGif];
        
        self.completeImageView.hidden = YES;
        self.completeImageView.layer.opacity = 1;
        
        self.arrowView.hidden = NO;
        [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
            self.arrowView.transform = CGAffineTransformMakeRotation(0.000001 - M_PI);
        }];
        
    } else if (state == MJRefreshStateRefreshing) {
    
        self.completeImageView.hidden = YES;
        self.completeImageView.layer.opacity = 1;
        
        self.gifView.alpha = 1;
        [self.gifView startGif];
        self.arrowView.hidden = YES;
    }
}
@end
