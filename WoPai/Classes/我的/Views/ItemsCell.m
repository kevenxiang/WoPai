//
//  ItemsCell.m
//  WoPai
//
//  Created by xiang on 2017/4/11.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "ItemsCell.h"
#import "TopImgBottomLabel.h"
#import "FileHeaders.h"

@implementation ItemsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        for (NSInteger i = 0; i < 5; i++) {
            TopImgBottomLabel *tTopImgBottomLabel = [[TopImgBottomLabel alloc] init];
            tTopImgBottomLabel.img = [UIImage imageNamed:@"二维码"];
            tTopImgBottomLabel.title = @"标题";
            tTopImgBottomLabel.tag = i+100;
            [self.contentView addSubview:tTopImgBottomLabel];
            
        }
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (NSInteger i = 0; i < 5; i++) {
        TopImgBottomLabel *tTopImgBottomLabel = (TopImgBottomLabel *)[self.contentView viewWithTag:i+100];
        tTopImgBottomLabel.frame = CGRectMake(i * (kScreenWidth/5.0f), 0, kScreenWidth/5.0f, self.bounds.size.height);
    }
}

- (void)setDataWithImgs:(NSArray *)imgs titles:(NSArray *)titles {
    for (NSInteger i = 0; i < 5; i++) {
         TopImgBottomLabel *tTopImgBottomLabel = (TopImgBottomLabel *)[self.contentView viewWithTag:i+100];
        tTopImgBottomLabel.img = imgs[i];
        tTopImgBottomLabel.title = titles[i];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
