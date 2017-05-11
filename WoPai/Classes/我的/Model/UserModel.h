//
//  UserModel.h
//  WoPai
//
//  Created by xiang on 2017/5/2.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, assign) NSUInteger userId;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *quCode;

@end
