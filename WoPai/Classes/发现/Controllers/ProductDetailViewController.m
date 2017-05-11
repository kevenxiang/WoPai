//
//  ProductDetailViewController.m
//  WoPai
//
//  Created by xiang on 2017/4/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ASFSharedViewTransition.h"

#define IMAGESCROVIEWHIGHT 300.0 //轮播图高度

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, IMAGESCROVIEWHIGHT)];
    self.topImgView.image = self.topImg;
    self.topImgView.userInteractionEnabled = YES;
    [self.view addSubview:self.topImgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ASFSharedViewTransitionDataSource
- (UIView *)sharedView {
    return _topImgView;
}

@end
