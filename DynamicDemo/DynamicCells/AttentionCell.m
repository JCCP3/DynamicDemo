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
    
    if(self){
        
        userHeaderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15.f, 15.f, 20, 20)];
        userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(userHeaderImageView.frame.origin.x+userHeaderImageView.bounds.size.width+15, userHeaderImageView.frame.origin.y, DEVICE_AVALIABLE_WIDTH-15-(userHeaderImageView.frame.origin.x+userHeaderImageView.bounds.size.width+15), 21.f)];
        userDetailInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(userNameLabel.frame.origin.x, userNameLabel.frame.origin.y+userNameLabel.bounds.size.height+10, userNameLabel.bounds.size.width, userNameLabel.bounds.size.height)];
        userDetailInfoLabel.textColor = [UIColor lightGrayColor];
        userDetailInfoLabel.font = [UIFont systemFontOfSize:15.f];
        
        [self.contentView addSubview:userHeaderImageView];
        [self.contentView addSubview:userNameLabel];
        [self.contentView addSubview:userDetailInfoLabel];
        
    }
    
    return self;
}

- (void)loadAttentionCellData:(User *)user
{
    
    userNameLabel.text = user.userName;
    
    userDetailInfoLabel.text = [NSString stringWithFormat:@"动态%@ | 关注%@ | 粉丝%@",user.userDynamicCount,user.userAttentionCount,user.userFansCount];
}

@end
