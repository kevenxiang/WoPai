//
//  Http.h
//  WoPai
//
//  Created by xiang on 2017/5/2.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorModel.h"
#import "UserModel.h"
#import "Product.h"
#import "NSObject+MJKeyValue.h"

@interface Http : NSObject

+ (Http *)instance;

#pragma mark - 用户登录
- (void)userLoginWithPhone:(NSString *)phone pwd:(NSString *)pwd completion:(void(^)(ErrorModel *error, UserModel *user))completion;

#pragma mark - 用户注册
- (void)userRegisterWithPhone:(NSString *)phone pwd:(NSString *)pwd completion:(void(^)(ErrorModel *error, UserModel *user))completion;

#pragma mark - 获取产品列表
- (void)productListWithName:(NSString *)name page:(NSUInteger)page item:(NSUInteger)item completion:(void(^)(ErrorModel *error, NSArray *list))completion;

#pragma mark - 添加产品
- (void)productAddWithProduct:(Product *)product completion:(void(^)(ErrorModel *error,NSString *message))completion;

#pragma mark - 添加产品图片名称
- (void)productAddPicWithProduct:(Product *)product completion:(void(^)(ErrorModel *error,NSString *message))completion;

@end
