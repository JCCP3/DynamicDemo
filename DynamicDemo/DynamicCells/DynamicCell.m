//
//  DynamicCell.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "DynamicCell.h"
#import "Utility.h"
#define BTN_WIDTH 70
#define BTN_HEIGHT 25
#define IMAGEWIDTH 15
#define IMAGEHEIGHT 12.5
#define SPACEWIDTH 3

@implementation DynamicCell{
    
    UIView *dynamicShowTransmitView;
    UIImageView *dynamicPraiseImageView;
    UILabel *dynamicTransmitInfoLabel;
    UIImageView *dynamicUserAvatarImageView;
    UILabel *dynamicUserNameLabel;
    UIButton *dynamicAttentionBtn; //关注Btn
    UIImageView *dynamicHotImageView; //热门ImageView
    UILabel *dynamicTitleLabel;
    UILabel *dynamicContentLabel;
    UILabel *dynamicPublishDateLabel;
    //书本
    UIView *dynamicAppointBookView;
    UIImageView *dynamicBookImageView;
    UILabel *dynamicBookNameLabel;
    UILabel *dynamicBookInfoLabel;
    UIImageView *dynamicBookScoreImageView;
    UIImageView *dynamicArrowImageView; //箭头
    
    UIView *commentBottomView;
    UIImageView *dynamicCommentImageView;
    UIView *dynamicListCommentView;
    UIView *dynamicListTransmitView;
    UIImageView *dynamicTransmitImageView;
    UILabel *dynamicCommentNumLabel;
    UILabel *dynamicTransmitNumLabel;
    UIButton *dynamicCommentBtn;
    UIButton *dynamicTransmitBtn;
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        dynamicShowTransmitView = [[UIView alloc] initWithFrame:CGRectZero];
        dynamicPraiseImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        dynamicTransmitInfoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicTransmitInfoLabel.font = [UIFont systemFontOfSize:15.f];
        dynamicTransmitInfoLabel.textColor = [UIColor lightGrayColor];
        [dynamicShowTransmitView addSubview:dynamicPraiseImageView];
        [dynamicShowTransmitView addSubview:dynamicTransmitInfoLabel];
        
        dynamicUserAvatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        dynamicPublishDateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicPublishDateLabel.font = [UIFont systemFontOfSize:14.f];
        dynamicPublishDateLabel.textColor = [UIColor lightGrayColor];
        dynamicAttentionBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        dynamicHotImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        dynamicUserNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicUserNameLabel.textColor = [UIColor orangeColor];
        dynamicTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicTitleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:21];
        dynamicContentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //引用的书本
        dynamicAppointBookView = [[UIView alloc] initWithFrame:CGRectZero];
        dynamicAppointBookView.layer.borderWidth = 1;
        dynamicAppointBookView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        dynamicAppointBookView.backgroundColor = [Utility colorWithHexString:@"#f7f7f7"];
        
        dynamicBookImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        dynamicBookNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicBookNameLabel.font = [UIFont systemFontOfSize:19.f];
        dynamicBookInfoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicBookInfoLabel.font = [UIFont systemFontOfSize:13.f];
        dynamicBookInfoLabel.textColor = [UIColor lightGrayColor];
        dynamicArrowImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        dynamicBookScoreImageView = [[UIImageView alloc] initWithFrame:CGRectZero];

        [dynamicAppointBookView addSubview:dynamicBookImageView];
        [dynamicAppointBookView addSubview:dynamicBookNameLabel];
        [dynamicAppointBookView addSubview:dynamicBookInfoLabel];
        [dynamicAppointBookView addSubview:dynamicArrowImageView];
        [dynamicAppointBookView addSubview:dynamicBookScoreImageView];
        
        //评论
        commentBottomView= [[UIView alloc] initWithFrame:CGRectZero];
        dynamicCommentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        dynamicCommentNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicCommentNumLabel.font = [UIFont systemFontOfSize:15.f];
        dynamicCommentNumLabel.textColor = [UIColor lightGrayColor];
        dynamicTransmitImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        dynamicTransmitNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        dynamicTransmitNumLabel.font = [UIFont systemFontOfSize:15.f];
        dynamicTransmitNumLabel.textColor = [UIColor lightGrayColor];
        dynamicCommentBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        dynamicTransmitBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        dynamicListTransmitView = [[UIView alloc] initWithFrame:CGRectZero];
        dynamicListCommentView = [[UIView alloc] initWithFrame:CGRectZero];
        [commentBottomView addSubview:dynamicListCommentView];
        [commentBottomView addSubview:dynamicListTransmitView];
        [dynamicListCommentView addSubview:dynamicCommentImageView];
        [dynamicListCommentView addSubview:dynamicCommentNumLabel];
        [dynamicListCommentView addSubview:dynamicCommentBtn];
        [dynamicListTransmitView addSubview:dynamicTransmitImageView];
        [dynamicListTransmitView addSubview:dynamicTransmitNumLabel];
        [dynamicListTransmitView addSubview:dynamicTransmitBtn];
        
        [self.contentView addSubview:dynamicShowTransmitView];
        [self.contentView addSubview:dynamicUserAvatarImageView];
        [self.contentView addSubview:dynamicPublishDateLabel];
        [self.contentView addSubview:dynamicUserNameLabel];
        [self.contentView addSubview:dynamicAttentionBtn];
        [self.contentView addSubview:dynamicHotImageView];
        [self.contentView addSubview:dynamicTitleLabel];
        [self.contentView addSubview:dynamicContentLabel];
        [self.contentView addSubview:dynamicAppointBookView];
        [self.contentView addSubview:commentBottomView];
        
    }
    
    return self;
    
}

- (void)loadDynamicCellData:(Dynamic *)dynamic
{
    
    CGFloat activeHeight = 0.f;
    if ([dynamic.dynamicCategoryID intValue] == 0) {
        activeHeight = 21.f+10;
        [dynamicShowTransmitView setHidden:NO];
        [dynamicShowTransmitView setFrame:CGRectMake(15, 10, DEVICE_AVALIABLE_WIDTH-30, 21.f)];
        [dynamicPraiseImageView setFrame:CGRectMake(50.f/2, 0, 20, 20)];
        [dynamicTransmitInfoLabel setFrame:CGRectMake(50+15, 0, dynamicShowTransmitView.bounds.size.width-(50+15), 21.f)];
        
        if(![Utility isBlankString:dynamic.dynamicTransmitPersons]){
            dynamicTransmitInfoLabel.text = [NSString stringWithFormat:@"%@ 转发了这条动态",dynamic.dynamicTransmitPersons];
        }
    } else {
        [dynamicShowTransmitView setHidden:YES];
    }
    
    [dynamicUserAvatarImageView setImage:ImageNamed(@"icon.png")];
    [dynamicUserAvatarImageView setFrame:CGRectMake(15, 15+activeHeight, 50, 50)];
    
    if (![Utility isBlankString:dynamic.dynamicPublishDate]){
        CGFloat publishDateWidth = [Utility widthForLabel:[Utility changeDateToDaysAgo:dynamic.dynamicPublishDate] constrsize:21.f widthLabelFont:14.f];
        [dynamicPublishDateLabel setFrame:CGRectMake(DEVICE_AVALIABLE_WIDTH-15-publishDateWidth, 15+activeHeight, publishDateWidth, 21.f)];
        [dynamicUserNameLabel setFrame:CGRectMake(15+50+15, dynamicUserAvatarImageView.frame.origin.y, DEVICE_AVALIABLE_WIDTH-(15+50+15)-15-publishDateWidth, 21.f)];
        dynamicUserNameLabel.text = dynamic.dynamicUserName;
        dynamicPublishDateLabel.text = [Utility changeDateToDaysAgo:dynamic.dynamicPublishDate];
    }

    //根据类别判断
    if ([dynamic.dynamicCategoryID intValue] == 1 || ([dynamic.dynamicCategoryID intValue] == 0 && [dynamic.dynamicTransmitCategoryID intValue] == 1)) {
        
        [dynamicAppointBookView setHidden:YES];
        [dynamicTitleLabel setHidden:NO];
        //标题＋正文 长文章
        [dynamicTitleLabel setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicUserNameLabel.frame.origin.y+dynamicUserNameLabel.bounds.size.height+10, DEVICE_AVALIABLE_WIDTH-30-50-15, 21.f)];
        [dynamicContentLabel setFrame:CGRectMake(dynamicTitleLabel.frame.origin.x, dynamicTitleLabel.frame.origin.y+dynamicTitleLabel.bounds.size.height+5, DEVICE_AVALIABLE_WIDTH-30-50-15, 21.f)];
        if (![Utility isBlankString:dynamic.dynamicTitle]) {
            dynamicTitleLabel.text = dynamic.dynamicTitle;
        }
        if (![Utility isBlankString:dynamic.dynamicContent]) {
            dynamicContentLabel.text = dynamic.dynamicContent;
            dynamicContentLabel.numberOfLines = 0;
            dynamicContentLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:dynamicContentLabel.bounds.size.width withLabelFont:17.f];
            [dynamicContentLabel setFrame:CGRectMake(dynamicContentLabel.frame.origin.x, dynamicContentLabel.frame.origin.y, dynamicContentLabel.bounds.size.width, MIN(21*3, contentLabelHeight))];
        }
        
        [commentBottomView setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicContentLabel.frame.origin.y+dynamicContentLabel.bounds.size.height+15.f, dynamicContentLabel.bounds.size.width, BTN_HEIGHT)];
        
        /* 评论 */
        if (![Utility isBlankString:dynamic.dynamicCommentNum]) {
            dynamicCommentNumLabel.text = dynamic.dynamicCommentNum;
        } else {
            dynamicCommentNumLabel.text = @"评论";
        }
        [dynamicCommentImageView setImage:ImageNamed(@"评论.png")];
        
        CGFloat commentNumWidth = [Utility widthForLabel:dynamic.dynamicCommentNum constrsize:21.f widthLabelFont:15.f];
        CGFloat leftOffset = (BTN_WIDTH-IMAGEWIDTH-SPACEWIDTH-commentNumWidth)/2;
        [dynamicCommentImageView setFrame:CGRectMake(leftOffset, BTN_HEIGHT/2 - IMAGEHEIGHT/2, IMAGEWIDTH, IMAGEHEIGHT)];
        [dynamicCommentNumLabel setFrame:CGRectMake(dynamicCommentImageView.frame.origin.x+dynamicCommentImageView.bounds.size.width+SPACEWIDTH, 3, commentNumWidth, 21.f)];
        dynamicCommentNumLabel.center = CGPointMake(dynamicCommentNumLabel.frame.origin.x+dynamicCommentNumLabel.bounds.size.width/2, dynamicCommentImageView.frame.origin.y+dynamicCommentImageView.bounds.size.height/2);
        [dynamicCommentBtn setFrame:CGRectMake(0, 0, dynamicCommentNumLabel.frame.origin.x+dynamicCommentNumLabel.bounds.size.width+leftOffset, 21.f)];
        [dynamicListCommentView setFrame:CGRectMake(0, 0, BTN_WIDTH, BTN_HEIGHT)];
        dynamicListCommentView.layer.borderWidth = 1;
        dynamicListCommentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        dynamicListCommentView.layer.cornerRadius = 12.f;

        
        /* 转发 */
        if (![Utility isBlankString:dynamic.dynamicTransmitNum]) {
            dynamicTransmitNumLabel.text = dynamic.dynamicTransmitNum;
        } else {
            dynamicTransmitNumLabel.text = @"转发";
        }
        
        [dynamicTransmitImageView setImage:ImageNamed(@"转发.png")];
        CGFloat transmitNumWidth = [Utility widthForLabel:dynamic.dynamicTransmitNum constrsize:21.f widthLabelFont:15.f];
        CGFloat leftTansmitOffset = (BTN_WIDTH-IMAGEWIDTH-SPACEWIDTH-transmitNumWidth)/2;
        [dynamicTransmitImageView setFrame:CGRectMake(leftTansmitOffset, BTN_HEIGHT/2-IMAGEHEIGHT/2, IMAGEWIDTH, IMAGEHEIGHT)];
        [dynamicTransmitNumLabel setFrame:CGRectMake(dynamicTransmitImageView.frame.origin.x+dynamicTransmitImageView.bounds.size.width+SPACEWIDTH, 3, transmitNumWidth, 21.f)];
        dynamicTransmitNumLabel.center = CGPointMake(dynamicTransmitNumLabel.frame.origin.x+dynamicTransmitNumLabel.bounds.size.width/2, dynamicTransmitImageView.frame.origin.y+dynamicTransmitImageView.bounds.size.height/2);
       [dynamicTransmitBtn setFrame:CGRectMake(0, 0, dynamicTransmitNumLabel.frame.origin.x+dynamicTransmitNumLabel.bounds.size.width+leftTansmitOffset, BTN_HEIGHT)];
        [dynamicListTransmitView setFrame:CGRectMake(dynamicListCommentView.frame.origin.x+dynamicListCommentView.bounds.size.width+15.f, 0, BTN_WIDTH, BTN_HEIGHT)];
        dynamicListTransmitView.layer.borderWidth = 1;
        dynamicListTransmitView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        dynamicListTransmitView.layer.cornerRadius = 12.f;
        
    } else if ([dynamic.dynamicCategoryID intValue] == 2 || ([dynamic.dynamicCategoryID intValue] == 0 && [dynamic.dynamicTransmitCategoryID intValue] == 2)) {
        
        [dynamicAppointBookView setHidden:YES];
        [dynamicTitleLabel setHidden:YES];
        
        //正文 短文章
//        [dynamicTitleLabel setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicUserNameLabel.frame.origin.y+dynamicUserNameLabel.bounds.size.height+10, DEVICE_AVALIABLE_WIDTH-30-50-15, 21.f)];
        [dynamicContentLabel setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicUserNameLabel.frame.origin.y+dynamicUserNameLabel.bounds.size.height+5, DEVICE_AVALIABLE_WIDTH-30-50-15, 21.f)];
//        if (![Utility isBlankString:dynamic.dynamicTitle]) {
//            dynamicTitleLabel.text = dynamic.dynamicTitle;
//        }
        if (![Utility isBlankString:dynamic.dynamicContent]) {
            dynamicContentLabel.text = dynamic.dynamicContent;
            dynamicContentLabel.numberOfLines = 0;
            dynamicContentLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:dynamicContentLabel.bounds.size.width withLabelFont:17.f];
            [dynamicContentLabel setFrame:CGRectMake(dynamicContentLabel.frame.origin.x, dynamicContentLabel.frame.origin.y, dynamicContentLabel.bounds.size.width, MIN(21*5, contentLabelHeight))];
        }
        
        [commentBottomView setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicContentLabel.frame.origin.y+dynamicContentLabel.bounds.size.height+15.f, dynamicContentLabel.bounds.size.width, BTN_HEIGHT)];
        
        /* 评论 */
        if (![Utility isBlankString:dynamic.dynamicCommentNum]) {
            dynamicCommentNumLabel.text = dynamic.dynamicCommentNum;
        } else {
            dynamicCommentNumLabel.text = @"评论";
        }
        [dynamicCommentImageView setImage:ImageNamed(@"评论.png")];
        
        CGFloat commentNumWidth = [Utility widthForLabel:dynamic.dynamicCommentNum constrsize:21.f widthLabelFont:15.f];
        CGFloat leftOffset = (BTN_WIDTH-IMAGEWIDTH-SPACEWIDTH-commentNumWidth)/2;
        [dynamicCommentImageView setFrame:CGRectMake(leftOffset, BTN_HEIGHT/2 - IMAGEHEIGHT/2, IMAGEWIDTH, IMAGEHEIGHT)];
        [dynamicCommentNumLabel setFrame:CGRectMake(dynamicCommentImageView.frame.origin.x+dynamicCommentImageView.bounds.size.width+SPACEWIDTH, 3, commentNumWidth, 21.f)];
        dynamicCommentNumLabel.center = CGPointMake(dynamicCommentNumLabel.frame.origin.x+dynamicCommentNumLabel.bounds.size.width/2, dynamicCommentImageView.frame.origin.y+dynamicCommentImageView.bounds.size.height/2);
        [dynamicCommentBtn setFrame:CGRectMake(0, 0, dynamicCommentNumLabel.frame.origin.x+dynamicCommentNumLabel.bounds.size.width+leftOffset, 21.f)];
        [dynamicListCommentView setFrame:CGRectMake(0, 0, BTN_WIDTH, BTN_HEIGHT)];
        dynamicListCommentView.layer.borderWidth = 1;
        dynamicListCommentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        dynamicListCommentView.layer.cornerRadius = 12.f;
        
        
        /* 转发 */
        if (![Utility isBlankString:dynamic.dynamicTransmitNum]) {
            dynamicTransmitNumLabel.text = dynamic.dynamicTransmitNum;
        }else{
            dynamicTransmitNumLabel.text = @"转发";
        }
        
        [dynamicTransmitImageView setImage:ImageNamed(@"转发.png")];
        CGFloat transmitNumWidth = [Utility widthForLabel:dynamic.dynamicTransmitNum constrsize:21.f widthLabelFont:15.f];
        CGFloat leftTansmitOffset = (BTN_WIDTH-IMAGEWIDTH-SPACEWIDTH-transmitNumWidth)/2;
        [dynamicTransmitImageView setFrame:CGRectMake(leftTansmitOffset, BTN_HEIGHT/2-IMAGEHEIGHT/2, IMAGEWIDTH, IMAGEHEIGHT)];
        [dynamicTransmitNumLabel setFrame:CGRectMake(dynamicTransmitImageView.frame.origin.x+dynamicTransmitImageView.bounds.size.width+SPACEWIDTH, 3, transmitNumWidth, 21.f)];
        dynamicTransmitNumLabel.center = CGPointMake(dynamicTransmitNumLabel.frame.origin.x+dynamicTransmitNumLabel.bounds.size.width/2, dynamicTransmitImageView.frame.origin.y+dynamicTransmitImageView.bounds.size.height/2);
        [dynamicTransmitBtn setFrame:CGRectMake(0, 0, dynamicTransmitNumLabel.frame.origin.x+dynamicTransmitNumLabel.bounds.size.width+leftTansmitOffset, BTN_HEIGHT)];
        [dynamicListTransmitView setFrame:CGRectMake(dynamicListCommentView.frame.origin.x+dynamicListCommentView.bounds.size.width+15.f, 0, BTN_WIDTH, BTN_HEIGHT)];
        dynamicListTransmitView.layer.borderWidth = 1;
        dynamicListTransmitView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        dynamicListTransmitView.layer.cornerRadius = 12.f;

        
    } else if ([dynamic.dynamicCategoryID intValue] == 3 || ([dynamic.dynamicCategoryID intValue] == 0 && [dynamic.dynamicTransmitCategoryID intValue] == 3)) {
        
        [dynamicAppointBookView setHidden:NO];
        [dynamicTitleLabel setHidden:YES];
        //书评
        //评论
        //        [dynamicTitleLabel setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicUserNameLabel.frame.origin.y+dynamicUserNameLabel.bounds.size.height+10, DEVICE_AVALIABLE_WIDTH-30-50-15, 21.f)];
        [dynamicContentLabel setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicUserNameLabel.frame.origin.y+dynamicUserNameLabel.bounds.size.height+5, DEVICE_AVALIABLE_WIDTH-30-50-15, 21.f)];
        //        if (![Utility isBlankString:dynamic.dynamicTitle]) {
        //            dynamicTitleLabel.text = dynamic.dynamicTitle;
        //        }
        if (![Utility isBlankString:dynamic.dynamicContent]) {
            dynamicContentLabel.text = dynamic.dynamicContent;
            dynamicContentLabel.numberOfLines = 0;
            dynamicContentLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:dynamicContentLabel.bounds.size.width withLabelFont:17.f];
            [dynamicContentLabel setFrame:CGRectMake(dynamicContentLabel.frame.origin.x, dynamicContentLabel.frame.origin.y, dynamicContentLabel.bounds.size.width, MIN(42.f, contentLabelHeight))];
        }
        
        //引用的书
        [dynamicAppointBookView setFrame:CGRectMake(dynamicContentLabel.frame.origin.x, dynamicContentLabel.frame.origin.y+dynamicContentLabel.bounds.size.height + 10, dynamicContentLabel.bounds.size.width, 95.f)];
        [dynamicBookImageView setFrame:CGRectMake(15, 15, 55, 75)];
        [dynamicBookNameLabel setFrame:CGRectMake(dynamicBookImageView.frame.origin.x+dynamicBookImageView.bounds.size.width+15.f, dynamicBookImageView.frame.origin.y+5, dynamicAppointBookView.bounds.size.width - 35 -(dynamicBookImageView.frame.origin.x+dynamicBookImageView.bounds.size.width+15.f), 21.f)];
        [dynamicBookInfoLabel setFrame:CGRectMake(dynamicBookNameLabel.frame.origin.x, dynamicBookNameLabel.frame.origin.y+dynamicBookNameLabel.bounds.size.height+10, 60, 21.f)];
      
        [dynamicBookScoreImageView setFrame:CGRectMake(dynamicBookInfoLabel.frame.origin.x+dynamicBookInfoLabel.bounds.size.width, dynamicBookInfoLabel.frame.origin.y+(dynamicBookInfoLabel.bounds.size.height / 2 - 10 / 2), 66, 10)];
        [dynamicBookScoreImageView setImage:[Utility createScoreImage:[dynamic.dynamicAppointBook.bookScore intValue]]];
        
        if (dynamic.dynamicAppointBook && ![Utility isBlankString:dynamic.dynamicAppointBook.bookName]) {
            dynamicBookNameLabel.text = dynamic.dynamicAppointBook.bookName;
//            dynamicBookInfoLabel.text = [NSString stringWithFormat:@"%@ | %@ | %@",dynamic.dynamicAppointBook.bookAuthor,dynamic.dynamicAppointBook.bookCategory,dynamic.dynamicAppointBook.bookWordNum];
            dynamicBookInfoLabel.text = @"楼主打分:";
        }
        
        [commentBottomView setFrame:CGRectMake(dynamicUserNameLabel.frame.origin.x, dynamicAppointBookView.frame.origin.y+dynamicAppointBookView.bounds.size.height+15.f, dynamicContentLabel.bounds.size.width, BTN_HEIGHT)];
        
        /*  评论 */
        if (![Utility isBlankString:dynamic.dynamicCommentNum]) {
            dynamicCommentNumLabel.text = dynamic.dynamicCommentNum;
        } else {
            dynamicCommentNumLabel.text = @"评论";
        }
        [dynamicCommentImageView setImage:ImageNamed(@"评论.png")];
        
        CGFloat commentNumWidth = [Utility widthForLabel:dynamic.dynamicCommentNum constrsize:21.f widthLabelFont:15.f];
        CGFloat leftOffset = (BTN_WIDTH-IMAGEWIDTH-SPACEWIDTH-commentNumWidth)/2;
        [dynamicCommentImageView setFrame:CGRectMake(leftOffset, BTN_HEIGHT/2 - IMAGEHEIGHT/2, IMAGEWIDTH, IMAGEHEIGHT)];
        [dynamicCommentNumLabel setFrame:CGRectMake(dynamicCommentImageView.frame.origin.x+dynamicCommentImageView.bounds.size.width+SPACEWIDTH, 3, commentNumWidth, 21.f)];
        dynamicCommentNumLabel.center = CGPointMake(dynamicCommentNumLabel.frame.origin.x+dynamicCommentNumLabel.bounds.size.width/2, dynamicCommentImageView.frame.origin.y+dynamicCommentImageView.bounds.size.height/2);
        [dynamicCommentBtn setFrame:CGRectMake(0, 0, dynamicCommentNumLabel.frame.origin.x+dynamicCommentNumLabel.bounds.size.width+leftOffset, 21.f)];
        [dynamicListCommentView setFrame:CGRectMake(0, 0, BTN_WIDTH, BTN_HEIGHT)];
        dynamicListCommentView.layer.borderWidth = 1;
        dynamicListCommentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        dynamicListCommentView.layer.cornerRadius = 12.f;
        
        
        /* 转发 */
        if (![Utility isBlankString:dynamic.dynamicTransmitNum]) {
            dynamicTransmitNumLabel.text = dynamic.dynamicTransmitNum;
        } else {
            dynamicTransmitNumLabel.text = @"转发";
        }
        
        [dynamicTransmitImageView setImage:ImageNamed(@"转发.png")];
        CGFloat transmitNumWidth = [Utility widthForLabel:dynamic.dynamicTransmitNum constrsize:21.f widthLabelFont:15.f];
        CGFloat leftTansmitOffset = (BTN_WIDTH-IMAGEWIDTH-SPACEWIDTH-transmitNumWidth)/2;
        [dynamicTransmitImageView setFrame:CGRectMake(leftTansmitOffset, BTN_HEIGHT/2-IMAGEHEIGHT/2, IMAGEWIDTH, IMAGEHEIGHT)];
        [dynamicTransmitNumLabel setFrame:CGRectMake(dynamicTransmitImageView.frame.origin.x+dynamicTransmitImageView.bounds.size.width+SPACEWIDTH, 3, transmitNumWidth, 21.f)];
        dynamicTransmitNumLabel.center = CGPointMake(dynamicTransmitNumLabel.frame.origin.x+dynamicTransmitNumLabel.bounds.size.width/2, dynamicTransmitImageView.frame.origin.y+dynamicTransmitImageView.bounds.size.height/2);
        [dynamicTransmitBtn setFrame:CGRectMake(0, 0, dynamicTransmitNumLabel.frame.origin.x+dynamicTransmitNumLabel.bounds.size.width+leftTansmitOffset, BTN_HEIGHT)];
        [dynamicListTransmitView setFrame:CGRectMake(dynamicListCommentView.frame.origin.x+dynamicListCommentView.bounds.size.width+15.f, 0, BTN_WIDTH, BTN_HEIGHT)];
        dynamicListTransmitView.layer.borderWidth = 1;
        dynamicListTransmitView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        dynamicListTransmitView.layer.cornerRadius = 12.f;
    }
    
    
}

@end
