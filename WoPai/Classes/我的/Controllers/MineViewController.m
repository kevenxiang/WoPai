//
//  MineViewController.m
//  WoPai
//
//  Created by xiang on 2017/4/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "MineViewController.h"
#import "HeadImgTitleCell.h"
#import "ItemsCell.h"
#import "AdCell.h"
#import "LoginViewController.h"

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *mTableView;
    //我的购买信息
    NSArray *myBuyInfoImgs;
    NSArray *myBuyInfoTitles;
    
    //我的出货信息
    NSArray *mySellInfoImgs;
    NSArray *mySellInfoTitles;
    
    //业务相关
    NSArray *businessImgs;
    NSArray *businessTitles;
}

@end

@implementation MineViewController

#pragma mark - lifecycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    NSURL *url = [NSURL URLWithString:@"http://192.168.8.103:8080/WoPai/login"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    NSDictionary *parameterDic = @{@"phone": @"13675047619",
//                                   @"password": @"123"};
//    NSData *parameterData = [NSJSONSerialization dataWithJSONObject:parameterDic options:NSJSONWritingPrettyPrinted error:nil];
//    [request setHTTPBody:parameterData];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error) {
//            NSLog(@"post error:%@", error.localizedDescription);
//        } else {
////            NSLog(@"data=======:%@",data);
////            id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"str======:%@", str);
//        }
//    }];
//    
//    [task resume];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
    
    
    LoginViewController *login = [[LoginViewController alloc] init];
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:login];
    [self presentViewController:loginNav animated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 2) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 && indexPath.row == 1) {
        return 120.0f;
    }
    return 90.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {//个人信息
            static NSString *CellID = @"CellID";
            HeadImgTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"HeadImgTitleCell" owner:nil options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            [cell setUserData:nil];
            
            return cell;
        } else if (indexPath.row == 1) {//我的购买信息
            static NSString *ItemsCellID = @"ItemsCellID";
            ItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:ItemsCellID];
            if (cell == nil) {
                cell = [[ItemsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ItemsCellID];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            [cell setDataWithImgs:myBuyInfoImgs titles:myBuyInfoTitles];
            
            return cell;
        }
        
    } else if (indexPath.section == 1) {//我的出货信息
        static NSString *ItemsCellID_1 = @"ItemsCellID_1";
        ItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:ItemsCellID_1];
        if (cell == nil) {
            cell = [[ItemsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ItemsCellID_1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setDataWithImgs:mySellInfoImgs titles:mySellInfoTitles];
        
        return cell;
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {//业务相关
            static NSString *ItemsCellID_2 = @"ItemsCellID_2";
            ItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:ItemsCellID_2];
            if (cell == nil) {
                cell = [[ItemsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ItemsCellID_2];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            [cell setDataWithImgs:businessImgs titles:businessTitles];
            
            return cell;
        } else if (indexPath.row == 1) {//活动信息
            static NSString *AdCellID = @"AdCellID";
            AdCell *cell = [tableView dequeueReusableCellWithIdentifier:AdCellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"AdCell" owner:nil options:nil] lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            return cell;
        }
       
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - gettings and settings
- (void)initUI {
    self.navigationItem.title = @"我的";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    mTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    mTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49);
    mTableView.delegate = self;
    mTableView.dataSource = self;
    mTableView.backgroundColor = [UIColor clearColor];
    mTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:mTableView];
}

- (void)initData {
    //我的购买信息
    myBuyInfoTitles = @[@"待付款", @"待收货", @"待评价", @"退换/售后", @"我的订单"];
    myBuyInfoImgs = @[[UIImage imageNamed:@"待付款"], [UIImage imageNamed:@"待收货"], [UIImage imageNamed:@"待评价"], [UIImage imageNamed:@"22-返修退换"], [UIImage imageNamed:@"我的订单"]];
    
    //我的出货信息
    mySellInfoTitles = @[@"待付款", @"待发货", @"待反馈", @"退换/售后", @"我的发货"];
    mySellInfoImgs = @[[UIImage imageNamed:@"待付款"], [UIImage imageNamed:@"待发货"], [UIImage imageNamed:@"反馈"], [UIImage imageNamed:@"22-返修退换"], [UIImage imageNamed:@"我的发货"]];
    
    //业务相关
    businessTitles = @[@"我的关注", @"我的收藏", @"浏览记录", @"我的活动", @"排行榜"];
    businessImgs = @[[UIImage imageNamed:@"我的关注"], [UIImage imageNamed:@"我的收藏"], [UIImage imageNamed:@"浏览记录"], [UIImage imageNamed:@"我的活动"], [UIImage imageNamed:@"排行榜"]];
    
    [mTableView reloadData];
    
}

@end
