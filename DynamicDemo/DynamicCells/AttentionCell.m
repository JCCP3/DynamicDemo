//
//  AttentionCell.m
//  DynamicDemo
//
//  Created by JC_CP3 on 15/7/27.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "AttentionCell.h"

@implementation AttentionCell{
    
    UIImageView *userHeaderImageView;
    UILabel *userNameLabel;
    UILabel *userDetailInfoLabel;
    
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
    
    if (self) {
        
        userHeaderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15.f, 15.f, 35, 35)];
        [userHeaderImageView setImage:[UIImage imageNamed:@"attentionUser"]];
        userHeaderImageView.layer.cornerRadius = 5.f;
        userHeaderImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:userHeaderImageView];
        
        userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(userHeaderImageView.frame)+10, CGRectGetMinY(userHeaderImageView.frame) - 3, DEVICE_AVALIABLE_WIDTH-15-(CGRectGetMaxX(userHeaderImageView.frame)+10), 21.f)];
        userNameLabel.font = [UIFont systemFontOfSize:15.f];
        userNameLabel.textColor = RGBCOLOR(0, 0, 0);
        [self.contentView addSubview:userNameLabel];
        
        userDetailInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(userNameLabel.frame), CGRectGetMaxY(userNameLabel.frame), CGRectGetWidth(userNameLabel.bounds), CGRectGetHeight(userNameLabel.bounds))];
        userDetailInfoLabel.textColor = RGBCOLOR(128, 128, 128);
        userDetailInfoLabel.font = [UIFont systemFontOfSize:12.f];
        [self.contentView addSubview:userDetailInfoLabel];
        
    }
    
    return self;
}

- (void)loadAttentionCellData:(User *)user
{
    
    userNameLabel.text = user.userName;
    
    userDetailInfoLabel.text = [NSString stringWithFormat:@"动态%@  |  关注%@  |  粉丝%@",user.userDynamicCount,user.userAttentionCount,user.userFansCount];
}

@end
