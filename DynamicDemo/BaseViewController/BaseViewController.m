//
//  BaseViewController.m
//  NavigationBarDemo
//
//  Created by JC_CP3 on 15/7/20.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "BaseViewController.h"
#import "UIButton+UIButtonImageWithLabel.h"
#import "Utility.h"

#define BUTTON_WIDTH 60.f
#define SEGMENT_WIDTH 50.f
#define SEGMENT_HEIGHT 30.f

@interface BaseViewController (){
    
    UIView *headerView;
    UIButton *navLeftBarBtn;
    UIImageView *navLeftBarImageView;
    UILabel *navTitleLabel;
    UIButton *navRightBarBtn;
    UIImageView *navRightBarImageView;
    UIButton *navSecRightBarBtn;
    UIImageView *navSecRightBarImageView;
    UISegmentedControl *segmentedControl;
    
    CGFloat headerViewHeight;
    NSString *navTitleString;
    NSArray *currentSegmentArray;
    CustomNavigationBarColorTag tag;
    UIImage *currentLeftImage;
    NSString *currentLeftTitle;
    NSArray *aryRightTitle;
    NSArray *aryRightImage;
    
    BOOL isLeftAlive;
    BOOL isLeftImageAndTitleAlive;
    BOOL isRightAlive;
    BOOL isRightTwoBtnAlive;
    
    UIColor *navigationBarBackgroundColor;
    UIColor *navigationBarTextColor;
    UIColor *navigationBarSeparatorColor;
    
}

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, 64.f)];
    [self.view addSubview:headerView];
    
    navLeftBarBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [navLeftBarBtn addTarget:self action:@selector(onClickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:navLeftBarBtn];
    
    navRightBarBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [navRightBarBtn addTarget:self action:@selector(onClickRightBtn) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:navRightBarBtn];
    
    navTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:navTitleLabel];
    
    navSecRightBarBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [navSecRightBarBtn addTarget:self action:@selector(onClickSecRightBtn) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:navSecRightBarBtn];
    
    segmentedControl = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    segmentedControl.selectedSegmentIndex = 0; //默认选中第一个
    [segmentedControl addTarget:self action:@selector(onClickSegment:) forControlEvents:UIControlEventValueChanged];
//    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.tintColor = RGBCOLOR(167, 10, 10);
    [headerView addSubview:segmentedControl];
    
    self.shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, DEVICE_AVALIABLE_HEIGHT)];
    self.shadowView.tag = 1000;
    self.shadowView.hidden = YES;
    self.shadowView.alpha = DEVICE_AVALIABLE_WIDTH/1000;
    self.shadowView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.shadowView];
    [self.view bringSubviewToFront:self.shadowView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillLayoutSubviews
{
    [self adaptHeaderViewWithHeight:headerViewHeight bgTag:tag navTitle:navTitleString segmentArray:currentSegmentArray];
    [self adaptHeaderViewWithLeftAliveSetting:isLeftAlive leftTitleAndImageAlive:isLeftImageAndTitleAlive rightAlive:isRightAlive];
    [self adaptHeaderViewWithLeftImage:currentLeftImage leftTitle:currentLeftTitle rightImage:aryRightImage rightTitle:aryRightTitle];
    [self setShadowView];
    
}

//添加阴影遮罩层
- (void)setShadowView{
    [self.shadowView setFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, DEVICE_AVALIABLE_HEIGHT)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark 设置headerView方法
- (void)adaptHeaderViewWithHeight:(CGFloat)height bgTag:(CustomNavigationBarColorTag)bgTag navTitle:(NSString *)title segmentArray:(NSArray *)array
{
    if ([array count]>0) {
        [headerView setFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, height+44.f)];
    } else {
        [headerView setFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, height)];
    }
    
    switch (bgTag) {
        case CustomNavigationBarColorRed:
            navigationBarBackgroundColor = RGBCOLOR(167, 10, 10);
            navigationBarTextColor = [UIColor whiteColor];
            navigationBarSeparatorColor = RGBCOLOR(133, 11, 11);
            break;
            
        case CustomNavigationBarColorWhite:
            navigationBarBackgroundColor = RGBCOLOR(247, 247, 247);
            navigationBarTextColor = RGBCOLOR(51, 51, 51);
            navigationBarSeparatorColor = RGBCOLOR(170, 170, 170);
            break;
            
        case CustomNavigationBarColorLightWhite:
            navigationBarBackgroundColor = RGBCOLOR(250, 250, 250);
            navigationBarTextColor = RGBCOLOR(33, 33, 33);
            navigationBarSeparatorColor = RGBCOLOR(128, 128, 128);
            break;
            
        case CustomNavigationBarColorBlack:
            navigationBarBackgroundColor = RGBCOLOR(30, 30, 30);
            navigationBarTextColor = [UIColor whiteColor];
            break;
    }
    
    [headerView setBackgroundColor:navigationBarBackgroundColor];
    
    navTitleString = title;
    navTitleLabel.textColor = navigationBarTextColor;
    currentSegmentArray = array;
    headerViewHeight = height;
    tag = bgTag;
}

- (void)adaptHeaderViewWithLeftAliveSetting:(BOOL)leftAlive leftTitleAndImageAlive:(BOOL)leftImageAndTitleAlive rightAlive:(BOOL)rightAlive
{
    isLeftAlive = leftAlive;
    isLeftImageAndTitleAlive = leftImageAndTitleAlive;
    isRightAlive = rightAlive;
}

- (void)adaptHeaderViewWithLeftImage:(UIImage *)leftImage leftTitle:(NSString *)leftTitle rightImage:(NSArray *)imageArray rightTitle:(NSArray *)titleArray
{
    currentLeftImage = leftImage;
    currentLeftTitle = leftTitle;
    aryRightImage = imageArray;
    aryRightTitle = titleArray;
    
    //居中的文字
    [navTitleLabel setFrame:CGRectMake(0, 20.f, DEVICE_AVALIABLE_WIDTH, 44.f)];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    if (![Utility isBlankString:navTitleString]) {
        navTitleLabel.text = navTitleString;
        navTitleLabel.hidden = NO;
    } else {
        navTitleLabel.hidden = YES;
    }
    
    if (isLeftAlive && isRightAlive) {
        //左右按钮均存在
        [navLeftBarBtn setFrame:CGRectMake(0, 20.f, BUTTON_WIDTH, 44.f)];
        
        if (isLeftImageAndTitleAlive) {
            //文字加图片
            [navLeftBarBtn setImage:leftImage withTitle:leftTitle forState:UIControlStateNormal];
        } else {
            //判断显示图片还是文字
            if (![Utility isBlankString:leftTitle]) {
                //显示文字
                [navLeftBarBtn setTitle:leftTitle forState:UIControlStateNormal];
            } else {
                //显示图片
                [navLeftBarBtn setImage:leftImage forState:UIControlStateNormal];
            }
        }
        
        [navSecRightBarBtn setFrame:CGRectMake(DEVICE_AVALIABLE_WIDTH-2*BUTTON_WIDTH, 20.f, BUTTON_WIDTH, 44.f)];
        [navRightBarBtn setFrame:CGRectMake(DEVICE_AVALIABLE_WIDTH-BUTTON_WIDTH, 20.f, BUTTON_WIDTH, 44.f)];
        
        if ([titleArray count] == 2 || [imageArray count] == 2) {
            
            //右边存在两个Btn
            navSecRightBarBtn.hidden = NO;
            navRightBarBtn.hidden = NO;
            
            //右侧button显示文字或者图片
            if (![Utility isBlankString:titleArray[0]]) {
                [navRightBarBtn setTitle:titleArray[0] forState:UIControlStateNormal];
            } else {
                //没有文字则显示图片
                [navRightBarBtn setImage:imageArray[0] forState:UIControlStateNormal];
            }
            
            //第二个Button
            if (![Utility isBlankString:titleArray[1]]) {
                [navSecRightBarBtn setTitle:titleArray[1] forState:UIControlStateNormal];
            } else {
                navSecRightBarBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -40);
                [navSecRightBarBtn setImage:imageArray[1] forState:UIControlStateNormal];
            }
            
        }else{
            
            navSecRightBarBtn.hidden = YES;
            navRightBarBtn.hidden = NO;
            
            //右侧button显示文字或者图片
            if (![Utility isBlankString:titleArray[0]]) {
                [navRightBarBtn setTitle:titleArray[0] forState:UIControlStateNormal];
            } else {
                //没有文字则显示图片
                [navRightBarBtn setImage:imageArray[0] forState:UIControlStateNormal];
            }
        }
        
    } else if (isLeftAlive) {
        
        //只存在左边按钮
        [navLeftBarBtn setFrame:CGRectMake(0, 20.f, BUTTON_WIDTH, 44.f)];
        
        if (isLeftImageAndTitleAlive) {
            //文字加图片
            [navLeftBarBtn setImage:leftImage withTitle:leftTitle forState:UIControlStateNormal];
        } else {
            //判断显示图片还是文字
            if (![Utility isBlankString:leftTitle]) {
                //显示文字
                [navLeftBarBtn setTitle:leftTitle forState:UIControlStateNormal];
            } else {
                //显示图片
                [navLeftBarBtn setImage:leftImage forState:UIControlStateNormal];
            }
        }
        
        navRightBarBtn.hidden = YES;
        navSecRightBarBtn.hidden = YES;
        
    } else if (isRightAlive) {
        
        //只存在右边按钮
        navLeftBarBtn.hidden = YES;
        [navSecRightBarBtn setFrame:CGRectMake(DEVICE_AVALIABLE_WIDTH-2*BUTTON_WIDTH, 20.f, BUTTON_WIDTH, 44.f)];
        [navRightBarBtn setFrame:CGRectMake(DEVICE_AVALIABLE_WIDTH-BUTTON_WIDTH, 20.f, BUTTON_WIDTH, 44.f)];
        
        if ([titleArray count]) {
            //右边存在两个Btn
            navSecRightBarBtn.hidden = NO;
            navRightBarBtn.hidden = NO;
            
            //右侧button显示文字或者图片
            if (![Utility isBlankString:titleArray[0]]) {
                [navRightBarBtn setTitle:titleArray[0] forState:UIControlStateNormal];
            } else {
                //没有文字则显示图片
                [navRightBarBtn setImage:imageArray[0] forState:UIControlStateNormal];
            }
            
            //第二个Button
            if (![Utility isBlankString:titleArray[1]]) {
                [navSecRightBarBtn setTitle:titleArray[1] forState:UIControlStateNormal];
            } else {
                [navSecRightBarBtn setImage:imageArray[1] forState:UIControlStateNormal];
            }
            
        }else{
            navSecRightBarBtn.hidden = YES;
            navRightBarBtn.hidden = NO;
            
            //右侧button显示文字或者图片
            if (![Utility isBlankString:titleArray[0]]) {
                [navRightBarBtn setTitle:titleArray[0] forState:UIControlStateNormal];
            } else {
                //没有文字则显示图片
                [navRightBarBtn setImage:imageArray[0] forState:UIControlStateNormal];
            }
        }
    }
    
    // sengment
    if ([currentSegmentArray count] > 0) {
        segmentedControl.selectedSegmentIndex = 0;
        [headerView setFrame:CGRectMake(0, 0, DEVICE_AVALIABLE_WIDTH, 64.f+44.f)];
        [segmentedControl setHidden:NO];
        
        if(segmentedControl.numberOfSegments != [currentSegmentArray count]){
            for (int i=0; i<[currentSegmentArray count]; i++) {
                
                NSString *title = [currentSegmentArray objectAtIndex:i];
                [segmentedControl insertSegmentWithTitle:title atIndex:i animated:YES];
                [segmentedControl setWidth:SEGMENT_WIDTH forSegmentAtIndex:i];
                
            }
            
        }
        
        [segmentedControl setFrame:CGRectMake((DEVICE_AVALIABLE_WIDTH-([currentSegmentArray count]*SEGMENT_WIDTH))/2, 64+(44-SEGMENT_HEIGHT)/2, ([currentSegmentArray count]*SEGMENT_WIDTH), SEGMENT_HEIGHT)];
        
    } else {
        [segmentedControl setHidden:YES];
    }

}

#pragma mark 按钮触发事件
//点击左边Btn
- (void)onClickLeftBtn
{
    
}

//点击最右边的Btn
- (void)onClickRightBtn
{
    
}

//点击右边第二个Btn
- (void)onClickSecRightBtn
{
    
}

- (void)onClickSegment:(id)sender
{
    
}

@end
