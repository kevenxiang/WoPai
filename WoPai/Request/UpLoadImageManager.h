//
//  UpLoadImageManager.h
//  WoPai
//
//  Created by xiang on 2017/5/11.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QiniuSDK.h>

@interface UpLoadImageManager : NSObject

+ (UpLoadImageManager *)instance;

#pragma mark - 根据图片路径上传
- (void)uploadImageToQNWithFilePath:(NSString *)filePath completion:(void(^)(NSString *imgName))completion;

#pragma mark - 根据图片数据上传
- (void)uploadImageToQNWithImageData:(NSData *)data completion:(void(^)(NSString *imgName))completion;

@end
