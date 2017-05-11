//
//  Http.m
//  WoPai
//
//  Created by xiang on 2017/5/2.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "Http.h"
#import "LHttpRequest.h"

@implementation Http

+ (Http *)instance {
    static Http *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

#pragma mark - 用户登录
- (void)userLoginWithPhone:(NSString *)phone pwd:(NSString *)pwd completion:(void(^)(ErrorModel *error, UserModel *user))completion {
    
    NSDictionary *dic = @{@"phone": phone,
                          @"password": pwd};
    
    [LHttpRequest postHttpRequest:@"WoPai/login" parameters:dic success:^(NSDictionary *responseDic) {
        NSLog(@"responseDic=======:%@", responseDic);
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 用户注册
- (void)userRegisterWithPhone:(NSString *)phone pwd:(NSString *)pwd completion:(void(^)(ErrorModel *error, UserModel *user))completion {
    
    NSDictionary *dic = @{@"phone": phone,
                          @"password": pwd};
    
    [LHttpRequest postHttpRequest:@"WoPai/register" parameters:dic success:^(NSDictionary *responseDic) {
        NSLog(@"注册=======:%@", responseDic);
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 获取产品列表
- (void)productListWithName:(NSString *)name page:(NSUInteger)page item:(NSUInteger)item completion:(void(^)(ErrorModel *error, NSArray *list))completion {
    
    NSDictionary *dic = @{@"page": [NSNumber numberWithUnsignedInteger:page],
                          @"rows": [NSNumber numberWithUnsignedInteger:item],
                          @"name": name};
    
    [LHttpRequest postHttpRequest:@"WoPai/produceList" parameters:dic success:^(NSDictionary *responseDic) {
        NSLog(@"产品列表=======:%@", responseDic);
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - 添加产品
- (void)productAddWithProduct:(Product *)product completion:(void(^)(ErrorModel *error))completion {
    NSDictionary *dic = [product keyValues];
    
    [LHttpRequest postHttpRequest:@"WoPai/productAdd" parameters:dic success:^(NSDictionary *responseDic) {
        NSLog(@"添加产品=======:%@", responseDic);
    } failure:^(NSError *error) {
        
    }];
}

@end
