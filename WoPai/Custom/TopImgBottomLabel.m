//
//  TopImgBottomLabel.m
//  WoPai
//
//  Created by xiang on 2017/4/11.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "TopImgBottomLabel.h"

#define kImgWidth           24
#define kImgHeight          24
#define kTitleLabelHeight   20
#define kSpaceHeight        3

@interface TopImgBottomLabel ()

@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TopImgBottomLabel

- (instancetype)init {
    self = [super init];
    if (self) {
         [self initUI];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat startY = (self.bounds.size.height - kImgHeight - kTitleLabelHeight - kSpaceHeight) / 2;
    self.imgV.frame = CGRectMake((self.bounds.size.width - kImgWidth)/2, startY, kImgWidth, kImgHeight);
    
    self.titleLabel.frame = CGRectMake(0, startY+kImgHeight+kSpaceHeight, self.bounds.size.width, kTitleLabelHeight);
}

- (void)initUI {
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        [self addSubview:_imgV];
    }
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel];
    }
}

- (void)setImg:(UIImage *)img {
    self.imgV.image = img;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

@end
