//
//  Product.h
//  WoPai
//
//  Created by xiang on 2017/5/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, assign) NSInteger productId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *descStr;
@property (nonatomic, assign) double price;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *remark;
//上传到七牛以后返回的图片名称，每个名称有字符串分隔
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *sales;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *variety;
@property (nonatomic, copy) NSString *publishTime;
@property (nonatomic, assign) NSInteger browseTimes;
@property (nonatomic, assign) NSInteger userId;

@end
