//
//  DynamicCell.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/23.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "DynamicCell.h"
#import "Utility.h"


static CGFloat btnWidth = 60;
static CGFloat btnHeight = 20;
static CGFloat imageWidth = 12;
static CGFloat imageHeight = 10;
static CGFloat spaceWidth = 3;
static CGFloat avatarWidth = 35.f;  //头像宽度
static CGFloat borderWidth = 15.f; //边界
static CGFloat avatarNameSpace = 7.f; //头像姓名之间间距
static CGFloat bookImageWidth = 36.f;
static CGFloat bookImageHeight = 45.f;

@implementation DynamicCell{
    
    UIView *showTransmitView;
    
    UIImageView *praiseImageView;
    
    UILabel *transmitInfoLabel;
    
    UIImageView *userAvatarImageView;
    
    UILabel *userNameLabel;
    
    UIImageView *hotImageView; //热门ImageView
    
    UILabel *titleLabel;
    UILabel *contentLabel;
    UILabel *publishDateLabel;
    
    //书本
    UIView *appointBookView;
    
    UIImageView *bookImageView;
    
    UILabel *bookNameLabel;
    UILabel *bookInfoLabel;
    
    UIImageView *bookScoreImageView;
    UIImageView *arrowImageView; //箭头
    
    UIView *commentBottomView;
    
    UIImageView *commentImageView;
    UIImageView *transmitImageView;
    UIImageView *attentionImageView;
    
    UIView *listCommentView;
    UIView *listTransmitView;
    UIView *listAttentionView;
    
    UILabel *commentNumLabel;
    UILabel *transmitNumLabel;
    UILabel *attentionLabel;
    
    UIButton *commentBtn;
    UIButton *transmitBtn;
    UIButton *attentionBtn;
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
      
        showTransmitView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:showTransmitView];
        
        praiseImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [showTransmitView addSubview:praiseImageView];
        
        transmitInfoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        transmitInfoLabel.font = [UIFont systemFontOfSize:15.f];
        transmitInfoLabel.textColor = [UIColor lightGrayColor];
        [showTransmitView addSubview:transmitInfoLabel];

        userAvatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:userAvatarImageView];
        
        publishDateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        publishDateLabel.font = [UIFont systemFontOfSize:12.f];
        publishDateLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:publishDateLabel];
        
        attentionBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:attentionBtn];
        
        hotImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:hotImageView];
        
        userNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        userNameLabel.font = [UIFont systemFontOfSize:12.f];
        userNameLabel.textColor = RGBCOLOR(165, 141, 94);
        [self.contentView addSubview:userNameLabel];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.5f];
        titleLabel.font = [UIFont systemFontOfSize:15.5f];
        [self.contentView addSubview:titleLabel];
        
        contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        contentLabel.font = [UIFont systemFontOfSize:14.f];
        [self.contentView addSubview:contentLabel];
        
        //引用的书本
        appointBookView = [[UIView alloc] initWithFrame:CGRectZero];
        appointBookView.layer.borderWidth = 1;
        appointBookView.layer.borderColor = RGBCOLOR(230, 230, 230).CGColor;
        appointBookView.backgroundColor = RGBCOLOR(240, 240, 240);
        [self.contentView addSubview:appointBookView];
        
        bookImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [appointBookView addSubview:bookImageView];
        
        bookNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        bookNameLabel.font = [UIFont systemFontOfSize:15.f];
        [appointBookView addSubview:bookNameLabel];
        
        bookInfoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        bookInfoLabel.font = [UIFont systemFontOfSize:12.f];
        bookInfoLabel.textColor = [UIColor lightGrayColor];
        [appointBookView addSubview:bookInfoLabel];
        
        arrowImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [appointBookView addSubview:arrowImageView];
        
        bookScoreImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [appointBookView addSubview:bookScoreImageView];
        
        //评论
        commentBottomView= [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:commentBottomView];
        
        listTransmitView = [[UIView alloc] initWithFrame:CGRectZero];
        [commentBottomView addSubview:listTransmitView];
        
        listCommentView = [[UIView alloc] initWithFrame:CGRectZero];
        [commentBottomView addSubview:listCommentView];
        
        listAttentionView = [[UIView alloc] initWithFrame:CGRectZero];
        [commentBottomView addSubview:listAttentionView];
        
        commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [listCommentView addSubview:commentImageView];
        
        transmitImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [listTransmitView addSubview:transmitImageView];
        
        attentionImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [listAttentionView addSubview:attentionImageView];
   
        commentNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        commentNumLabel.font = [UIFont systemFontOfSize:12.f];
        commentNumLabel.textColor = RGBCOLOR(178, 178, 178);
        [listCommentView addSubview:commentNumLabel];
        
        transmitNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        transmitNumLabel.font = [UIFont systemFontOfSize:12.f];
        transmitNumLabel.textColor = RGBCOLOR(178, 178, 178);
        [listTransmitView addSubview:transmitNumLabel];
        
        attentionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        attentionLabel.font = [UIFont systemFontOfSize:12.f];
        attentionLabel.textColor = RGBCOLOR(178, 178, 178);
        [listAttentionView addSubview:attentionLabel];
        
        commentBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [listCommentView addSubview:commentBtn];
        
        transmitBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [listTransmitView addSubview:transmitBtn];
        
        attentionBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [listAttentionView addSubview:attentionBtn];
        
    }
    
    return self;
}

- (void)loadDynamicCellData:(Dynamic *)dynamic
{
    
    CGFloat activeHeight = 0.f;
    
    if ([dynamic.dynamicCategoryID intValue] == 0) {
        
        activeHeight = 21.f+10;
        [showTransmitView setHidden:NO];
        [showTransmitView setFrame:CGRectMake(15, 10, DEVICE_AVALIABLE_WIDTH-30, 21.f)];
        
        [praiseImageView setFrame:CGRectMake(50.f/2, 0, 20, 20)];
        
        [transmitInfoLabel setFrame:CGRectMake(50+15, 0, showTransmitView.bounds.size.width-(50+15), 21.f)];
        if(![Utility isBlankString:dynamic.dynamicTransmitPersons]){
            transmitInfoLabel.text = [NSString stringWithFormat:@"%@ 转发了这条动态",dynamic.dynamicTransmitPersons];
        }
        
    } else {
        [showTransmitView setHidden:YES];
    }
    
    [userAvatarImageView setImage:ImageNamed(@"icon.png")];
    [userAvatarImageView setFrame:CGRectMake(borderWidth, 12+activeHeight, 35, 35)];
    
    //发布时间
    if (![Utility isBlankString:dynamic.dynamicPublishDate]){
        
        CGFloat publishDateWidth = [Utility widthForLabel:[Utility changeDateToDaysAgo:dynamic.dynamicPublishDate] constrsize:21.f widthLabelFont:12.f];
        [publishDateLabel setFrame:CGRectMake(DEVICE_AVALIABLE_WIDTH-borderWidth-publishDateWidth, userAvatarImageView.frame.origin.y, publishDateWidth, 21.f)];
        publishDateLabel.text = [Utility changeDateToDaysAgo:dynamic.dynamicPublishDate];
        
        [userNameLabel setFrame:CGRectMake(borderWidth+avatarWidth+avatarNameSpace, userAvatarImageView.frame.origin.y, DEVICE_AVALIABLE_WIDTH-(borderWidth+avatarWidth+avatarNameSpace)-borderWidth, 21.f)];
        userNameLabel.text = dynamic.dynamicUserName;
    }

    //根据类别判断
    if ([dynamic.dynamicCategoryID intValue] == 1 || ([dynamic.dynamicCategoryID intValue] == 0 && [dynamic.dynamicTransmitCategoryID intValue] == 1)) {
    //标题＋正文 长文章
        [appointBookView setHidden:YES];
        
        [titleLabel setHidden:NO];
        
        [titleLabel setFrame:CGRectMake(CGRectGetMinX(userNameLabel.frame), CGRectGetMaxY(userNameLabel.frame) + 1, DEVICE_AVALIABLE_WIDTH-userNameLabel.frame.origin.x-borderWidth, 21.f)];
        
        [contentLabel setFrame:CGRectMake(CGRectGetMinX(titleLabel.frame), CGRectGetMaxY(titleLabel.frame)-3, CGRectGetWidth(titleLabel.bounds), 21.f)];
        
        if (![Utility isBlankString:dynamic.dynamicTitle]) {
            titleLabel.text = dynamic.dynamicTitle;
        }
        
        if (![Utility isBlankString:dynamic.dynamicContent]) {
            contentLabel.text = dynamic.dynamicContent;
            contentLabel.numberOfLines = 0;
            contentLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
            contentLabel.font = [UIFont systemFontOfSize:14.f];
            contentLabel.textColor = RGBCOLOR(128, 128, 128);
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:contentLabel.bounds.size.width withLabelFont:14.f];
            [contentLabel setFrame:CGRectMake(CGRectGetMinX(contentLabel.frame), CGRectGetMinY(contentLabel.frame), CGRectGetWidth(contentLabel.bounds), MIN(21*3, contentLabelHeight))];
        }
        
        [commentBottomView setFrame:CGRectMake(CGRectGetMinX(userNameLabel.frame), CGRectGetMaxY(contentLabel.frame)+3, CGRectGetWidth(contentLabel.bounds), btnHeight)];

        
    } else if ([dynamic.dynamicCategoryID intValue] == 2 || ([dynamic.dynamicCategoryID intValue] == 0 && [dynamic.dynamicTransmitCategoryID intValue] == 2)) {
    //正文 短文章 (显示5行)
        
        [appointBookView setHidden:YES];
        
        [titleLabel setHidden:YES];
    
        [contentLabel setFrame:CGRectMake(CGRectGetMinX(userNameLabel.frame), CGRectGetMaxY(userNameLabel.frame)+1, DEVICE_AVALIABLE_WIDTH-borderWidth*2-avatarWidth-avatarNameSpace, 21.f)];

        if (![Utility isBlankString:dynamic.dynamicContent]) {
            
            contentLabel.text = dynamic.dynamicContent;
            contentLabel.numberOfLines = 0;
            contentLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
            contentLabel.font = [UIFont systemFontOfSize:14.f];
            contentLabel.textColor = [UIColor blackColor];
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:contentLabel.bounds.size.width withLabelFont:14.f];
            [contentLabel setFrame:CGRectMake(CGRectGetMinX(contentLabel.frame), CGRectGetMinY(contentLabel.frame), CGRectGetWidth(contentLabel.bounds), MIN(14.f*5+14, contentLabelHeight))];

        }
        
        [commentBottomView setFrame:CGRectMake(CGRectGetMinX(userNameLabel.frame), CGRectGetMaxY(contentLabel.frame)+10, CGRectGetWidth(contentLabel.bounds), btnHeight)];
        
        
    } else if ([dynamic.dynamicCategoryID intValue] == 3 || ([dynamic.dynamicCategoryID intValue] == 0 && [dynamic.dynamicTransmitCategoryID intValue] == 3)) {
    //引用书评
        [appointBookView setHidden:NO];
        
        [titleLabel setHidden:YES];
        
        [contentLabel setFrame:CGRectMake(userNameLabel.frame.origin.x, userNameLabel.frame.origin.y+userNameLabel.bounds.size.height+1, DEVICE_AVALIABLE_WIDTH-borderWidth*2-avatarWidth-avatarNameSpace, 21.f)];
     
        if (![Utility isBlankString:dynamic.dynamicContent]) {
            
            contentLabel.text = dynamic.dynamicContent;
            contentLabel.numberOfLines = 0;
            contentLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
            contentLabel.font = [UIFont systemFontOfSize:14.f];
            contentLabel.textColor = [UIColor blackColor];
            CGFloat contentLabelHeight = [Utility heightForLabel:dynamic.dynamicContent constrsize:contentLabel.bounds.size.width withLabelFont:14.f];
            [contentLabel setFrame:CGRectMake(contentLabel.frame.origin.x, contentLabel.frame.origin.y, contentLabel.bounds.size.width, MIN(14.f*2+6, contentLabelHeight))];
        }
        
        //引用的书
        [appointBookView setFrame:CGRectMake(contentLabel.frame.origin.x, contentLabel.frame.origin.y+contentLabel.bounds.size.height + 10, contentLabel.bounds.size.width, 65.f)];
        
        [bookImageView setFrame:CGRectMake(10, 10, bookImageWidth, bookImageHeight)];
        [bookImageView setImage:ImageNamed(@"icon.png")];
        
        [bookNameLabel setFrame:CGRectMake(bookImageView.frame.origin.x+bookImageView.bounds.size.width+4, bookImageView.frame.origin.y+2, appointBookView.bounds.size.width - 35 -(bookImageView.frame.origin.x+bookImageView.bounds.size.width+15.f), 21.f)];
        
        [bookInfoLabel setFrame:CGRectMake(bookNameLabel.frame.origin.x, bookNameLabel.frame.origin.y+bookNameLabel.bounds.size.height, 60, 21.f)];
      
        [bookScoreImageView setFrame:CGRectMake(bookInfoLabel.frame.origin.x+bookInfoLabel.bounds.size.width, bookInfoLabel.frame.origin.y+(bookInfoLabel.bounds.size.height / 2 - 10 / 2), 66, 10)];
        [bookScoreImageView setImage:[Utility createScoreImage:[dynamic.dynamicAppointBook.bookScore intValue]]];
        
        if (dynamic.dynamicAppointBook && ![Utility isBlankString:dynamic.dynamicAppointBook.bookName]) {
            
            bookNameLabel.text = dynamic.dynamicAppointBook.bookName;
            
            bookInfoLabel.text = @"楼主打分:";
        }
        
        [commentBottomView setFrame:CGRectMake(userNameLabel.frame.origin.x, appointBookView.frame.origin.y+appointBookView.bounds.size.height+14.f, contentLabel.bounds.size.width, btnHeight)];
        
    }
    
    /* 底部显示评论的View一样 */
    /* 评论 */
    if (![Utility isBlankString:dynamic.dynamicCommentNum]) {
        commentNumLabel.text = dynamic.dynamicCommentNum;
    } else {
        commentNumLabel.text = @"评论";
    }
    
    [commentImageView setImage:ImageNamed(@"评论.png")];
    
    CGFloat commentNumWidth = [Utility widthForLabel:dynamic.dynamicCommentNum constrsize:21.f widthLabelFont:12.f];
    CGFloat leftOffset = (btnWidth-imageWidth-spaceWidth-commentNumWidth)/2;
    
    [commentImageView setFrame:CGRectMake(leftOffset, btnHeight/2 - imageHeight/2, imageWidth, imageHeight)];
    
    [commentNumLabel setFrame:CGRectMake(CGRectGetMaxX(commentImageView.frame)+spaceWidth, 3, commentNumWidth, 21.f)];
    commentNumLabel.center = CGPointMake(CGRectGetMinX(commentNumLabel.frame)+CGRectGetWidth(commentNumLabel.bounds)/2, CGRectGetMinY(commentImageView.frame)+CGRectGetHeight(commentImageView.bounds)/2);
    
    [commentBtn setFrame:CGRectMake(0, 0, CGRectGetMaxX(commentNumLabel.frame)+leftOffset, 21.f)];
    
    [listCommentView setFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    listCommentView.layer.borderWidth = 1;
    listCommentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    listCommentView.layer.cornerRadius = 10;
    
    /* 转发 */
    if (![Utility isBlankString:dynamic.dynamicTransmitNum]) {
        transmitNumLabel.text = dynamic.dynamicTransmitNum;
    } else {
        transmitNumLabel.text = @"转发";
    }
    
    [transmitImageView setImage:ImageNamed(@"转发.png")];
    
    CGFloat transmitNumWidth = [Utility widthForLabel:dynamic.dynamicTransmitNum constrsize:21.f widthLabelFont:12.f];
    CGFloat leftTansmitOffset = (btnWidth-imageWidth-spaceWidth-transmitNumWidth)/2;
    
    [transmitImageView setFrame:CGRectMake(leftTansmitOffset, btnHeight/2-imageHeight/2, imageWidth, imageHeight)];
    
    [transmitNumLabel setFrame:CGRectMake(CGRectGetMaxX(transmitImageView.frame)+spaceWidth, 3, transmitNumWidth, 21.f)];
    transmitNumLabel.center = CGPointMake(CGRectGetMinX(transmitNumLabel.frame)+CGRectGetWidth(transmitNumLabel.bounds)/2, CGRectGetMinY(transmitImageView.frame)+CGRectGetHeight(transmitImageView.bounds)/2);
    
    [transmitBtn setFrame:CGRectMake(0, 0, CGRectGetMaxX(transmitNumLabel.frame)+leftTansmitOffset, btnHeight)];
    
    [listTransmitView setFrame:CGRectMake(CGRectGetMaxX(listCommentView.frame)+15.f, 0, btnWidth, btnHeight)];
    listTransmitView.layer.borderWidth = 1;
    listTransmitView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    listTransmitView.layer.cornerRadius = 10;
    
    //关注 （或者删除）
    if (dynamic.isMySelf) {
        attentionLabel.text = @"删除";
        attentionLabel.textColor = RGBCOLOR(178, 178, 178);
        [attentionImageView setImage:ImageNamed(@"关注.png")];
        listAttentionView.layer.borderColor = RGBCOLOR(178, 178, 178).CGColor;
    } else {
        if (dynamic.isAttention) {
            
            attentionLabel.text = @"已关注";
            attentionLabel.textColor = RGBCOLOR(167, 10, 10);
            
            [attentionImageView setImage:ImageNamed(@"已关注.png")];
            
            listAttentionView.layer.borderColor = RGBCOLOR(167, 10, 10).CGColor;
            
        } else {
            
            attentionLabel.text = @"关注";
            attentionLabel.textColor = RGBCOLOR(178, 178, 178);
            
            [attentionImageView setImage:ImageNamed(@"关注.png")];
            
            listAttentionView.layer.borderColor = RGBCOLOR(178, 178, 178).CGColor;
        }
    }
    
    
    CGFloat attentionWidth = [Utility widthForLabel:attentionLabel.text constrsize:21.f widthLabelFont:12.f];
    CGFloat leftAttentionOffset = (btnWidth-imageWidth-spaceWidth-attentionWidth)/2;
    
    [attentionImageView setFrame:CGRectMake(leftAttentionOffset, btnHeight/2-imageHeight/2, imageWidth, imageHeight)];
    
    [attentionLabel setFrame:CGRectMake(attentionImageView.frame.origin.x+attentionImageView.bounds.size.width+spaceWidth, 3, attentionWidth, 21.f)];
    attentionLabel.center = CGPointMake(attentionLabel.frame.origin.x+attentionLabel.bounds.size.width/2, attentionImageView.frame.origin.y+attentionImageView.bounds.size.height/2);
    
    [attentionBtn setFrame:CGRectMake(0, 0, attentionLabel.frame.origin.x+attentionLabel.bounds.size.width+leftAttentionOffset, btnHeight)];
    
    [listAttentionView setFrame:CGRectMake(commentBottomView.bounds.size.width-btnWidth, 0, btnWidth, btnHeight)];
    listAttentionView.layer.borderWidth = 1;
    listAttentionView.layer.cornerRadius = 10;
    
}

@end
