//
//  ErrorModel.h
//  WoPai
//
//  Created by xiang on 2017/5/2.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorModel : NSObject

@property (nonatomic, assign) NSInteger errCode;
@property (nonatomic, copy) NSString *errMessage;

@end
