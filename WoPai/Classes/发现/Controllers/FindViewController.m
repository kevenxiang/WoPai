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
#import "Http.h"
#import "PublishProductCtr.h"

#define kItemHeight  330

@interface FindViewController () <UICollectionViewDataSource, UICollectionViewDelegate, ASFSharedViewTransitionDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation FindViewController

static NSString * const reuseIdentifier = @"SingleCollectionViewCell";

#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
//    [[Http instance] userLoginWithPhone:@"13675047619" pwd:@"123" completion:^(ErrorModel *error, UserModel *user) {
//        
//    }];
    
//    [[Http instance] userRegisterWithPhone:@"18953185085" pwd:@"234" completion:^(ErrorModel *error, UserModel *user) {
//        
//    }];
    
//    [[Http instance] userLoginWithPhone:@"18953185085" pwd:@"234" completion:^(ErrorModel *error, UserModel *user) {
//        
//    }];
    
//    [[Http instance] productListWithName:@"" page:1 item:10 completion:^(ErrorModel *error, NSArray *list) {
//        
//    }];
    
   

    
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-mm-dd hh:mm:ss"];
    NSString *dateStr = [format stringFromDate:date];
    
    Product *tProduct = [[Product alloc] init];
    tProduct.name = @"笔记本";
    tProduct.descStr = @"高性能";
    tProduct.price = 4500.00f;
    tProduct.detail = @"真的很厉害的笔记本";
    tProduct.remark = @"很好";
    tProduct.pic = @"图片_1,图片_2,图片_3";
    tProduct.sales = @"现在购买，立减200元";
    tProduct.weight = @"5kg";
    tProduct.variety = @"13寸，15寸";
//    tProduct.publishTime = dateStr;
    tProduct.publishTime = @"0";
    tProduct.browseTimes = 0;
    tProduct.userId = 1;
    
//    [[Http instance] productAddWithProduct:tProduct completion:^(ErrorModel *error, NSString *message) {
//        
//    }];
    
//    [[Http instance] productAddPicWithProduct:tProduct completion:^(ErrorModel *error, NSString *message) {
//        
//    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我拍";
    
    kWEAKSELF;
    [self setRightBarButtonWithTitle:@"发布" titleColor:kRGBCOLOR(235, 72, 139) withBlock:^(NSInteger tag) {
        PublishProductCtr *publicCtr = [[PublishProductCtr alloc] init];
        publicCtr.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:publicCtr animated:YES];
    }];
    
    // Add Transition
    [ASFSharedViewTransition addTransitionWithFromViewControllerClass:[FindViewController class]
                                                ToViewControllerClass:[ProductDetailViewController class]
                                             WithNavigationController:(UINavigationController *)self.navigationController
                                                         WithDuration:0.3f];
    
    [self initUI];
    
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

#pragma mark - gettings and settings
- (void)initUI {
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

@end


























