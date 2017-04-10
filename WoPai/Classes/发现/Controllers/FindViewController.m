//
//  FindViewController.m
//  WoPai
//
//  Created by xiang on 2017/4/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "FindViewController.h"
#import "SingleCollectionViewCell.h"
#import "ASFSharedViewTransition.h"
#import "ProductDetailViewController.h"

#define kItemHeight  330

@interface FindViewController () <UICollectionViewDataSource, UICollectionViewDelegate, ASFSharedViewTransitionDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation FindViewController

static NSString * const reuseIdentifier = @"SingleCollectionViewCell";

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    
    // Add Transition
    [ASFSharedViewTransition addTransitionWithFromViewControllerClass:[FindViewController class]
                                                ToViewControllerClass:[ProductDetailViewController class]
                                             WithNavigationController:(UINavigationController *)self.navigationController
                                                         WithDuration:0.3f];
    
    UICollectionViewFlowLayout *mLayout = [[UICollectionViewFlowLayout alloc] init];
    //计算每一个cell的大小
    mLayout.itemSize = CGSizeMake(kScreenWidth/2 - 0.3, kItemHeight);
    //最小行间距
    mLayout.minimumLineSpacing = 0.5;
    //最小列间距
    mLayout.minimumInteritemSpacing = 0;
    //设定全局的区内边距
    mLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64 - 49) collectionViewLayout:mLayout];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:self.collectionView];
    
    UINib *nib = [UINib nibWithNibName:@"SingleCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SingleCollectionViewCell *cell = (SingleCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductDetailViewController *detail = [[ProductDetailViewController alloc] init];
    detail.hidesBottomBarWhenPushed = YES;
    detail.topImg = [UIImage imageNamed:@"timg.jpeg"];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - ASFSharedViewTransitionDataSource
- (UIView *)sharedView {
    return [_collectionView cellForItemAtIndexPath:[[_collectionView indexPathsForSelectedItems] firstObject]];
}

@end


























