//
//  MineViewController.m
//  WoPai
//
//  Created by xiang on 2017/4/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "MineViewController.h"
#import "HeadImgTitleCell.h"

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *mTableView;
}

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    mTableView = [[UITableView alloc] init];
    mTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    mTableView.delegate = self;
    mTableView.dataSource = self;
    mTableView.backgroundColor = [UIColor clearColor];
    mTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:mTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellID = @"CellID";
    HeadImgTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HeadImgTitleCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
