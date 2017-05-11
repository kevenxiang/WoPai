//
//  PublishProductCtr.m
//  WoPai
//
//  Created by xiang on 2017/5/11.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "PublishProductCtr.h"
#import "ACEExpandableTextCell.h"

@interface PublishModel : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, assign) CGFloat cellHeight;

@end

@implementation PublishModel


@end

@interface PublishProductCtr () <UITableViewDelegate, UITableViewDataSource, ACEExpandableTableViewDelegate>
{
    UITableView *mTableView;
    NSMutableArray *dataAry;
}

@end

@implementation PublishProductCtr

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布拍品";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self initUI];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return dataAry.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PublishModel *model = dataAry[indexPath.row];
        return model.cellHeight;
    }
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        PublishModel *model = dataAry[indexPath.row];
        ACEExpandableTextCell  *cell = [tableView expandableTextCellWithId:@"addProductCellId"];
        cell.title = [NSString stringWithFormat:@"%@:", model.label];
        cell.text = model.value;
        return cell;
    } else if (indexPath.section == 1) {
        static NSString *SelectCellID = @"SelectCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectCellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SelectCellID];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.text = @"添加图片";
        return cell;
    }
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//section的headview随tableview一起滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == mTableView) {
        CGFloat sectionHeaderHeight = 30.0f;
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

#pragma mark - ACEExpandableTableViewDelegate
- (void)tableView:(UITableView *)tableView updatedHeight:(CGFloat)height atIndexPath:(NSIndexPath *)indexPath {
    PublishModel *model = [dataAry objectAtIndex:indexPath.row];
    model.cellHeight = height;
    [dataAry replaceObjectAtIndex:indexPath.row withObject:model];
}

- (void)tableView:(UITableView *)tableView updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath {
    PublishModel *model = [dataAry objectAtIndex:indexPath.row];
    model.value = text;
    [dataAry replaceObjectAtIndex:indexPath.row withObject:model];
}

#pragma mark - gettings and settings
- (void)initUI {
    if (!mTableView) {
        mTableView = [[UITableView alloc] init];
        mTableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64);
        mTableView.backgroundColor = [UIColor clearColor];
        mTableView.delegate = self;
        mTableView.dataSource = self;
        mTableView.tableFooterView = [[UIView alloc] init];
        mTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    [self.view addSubview:mTableView];
}

- (void)initData {
    if (!dataAry) {
        dataAry = [[NSMutableArray alloc] init];
    }
    
    PublishModel *nameModel = [[PublishModel alloc] init];
    nameModel.label = @"商品名称 *";
    nameModel.value = @"";
    nameModel.cellHeight = 44.0f;
    
    PublishModel *descModel = [[PublishModel alloc] init];
    descModel.label = @"简介 *";
    descModel.value = @"";
    descModel.cellHeight = 44.0f;
    
    PublishModel *priceModel = [[PublishModel alloc] init];
    priceModel.label = @"价格 *";
    priceModel.value = @"";
    priceModel.cellHeight = 44.0f;
    
    PublishModel *detailModel = [[PublishModel alloc] init];
    detailModel.label = @"详情介绍";
    detailModel.value = @"";
    detailModel.cellHeight = 44.0f;
    
    PublishModel *saleModel = [[PublishModel alloc] init];
    saleModel.label = @"促销";
    saleModel.value = @"";
    saleModel.cellHeight = 44.0f;
    
    PublishModel *weightModel = [[PublishModel alloc] init];
    weightModel.label = @"重量";
    weightModel.value = @"";
    weightModel.cellHeight = 44.0f;
    
    PublishModel *varietyModel = [[PublishModel alloc] init];
    varietyModel.label = @"种类";
    varietyModel.value = @"";
    varietyModel.cellHeight = 44.0f;
    
    PublishModel *remarkModel = [[PublishModel alloc] init];
    remarkModel.label = @"备注";
    remarkModel.value = @"";
    remarkModel.cellHeight = 44.0f;
    
    [dataAry addObject:nameModel];
    [dataAry addObject:descModel];
    [dataAry addObject:priceModel];
    [dataAry addObject:detailModel];
    [dataAry addObject:saleModel];
    [dataAry addObject:weightModel];
    [dataAry addObject:varietyModel];
    [dataAry addObject:remarkModel];
    
    [mTableView reloadData];
}


@end
