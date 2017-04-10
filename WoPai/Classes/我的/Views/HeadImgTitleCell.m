//
//  HeadImgTitleCell.m
//  WoPai
//
//  Created by xiang on 2017/4/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "HeadImgTitleCell.h"

@interface HeadImgTitleCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImgV;


@end

@implementation HeadImgTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.headImgV.layer.cornerRadius = 10;
    self.headImgV.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
