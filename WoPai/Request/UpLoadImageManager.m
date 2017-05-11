//
//  UpLoadImageManager.m
//  WoPai
//
//  Created by xiang on 2017/5/11.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "UpLoadImageManager.h"

@implementation UpLoadImageManager

+ (UpLoadImageManager *)instance {
    static UpLoadImageManager *sharedInstance = nil;
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

#pragma mark - 根据图片路径上传
- (void)uploadImageToQNWithFilePath:(NSString *)filePath completion:(void(^)(NSString *imgName))completion {
    NSString *token = @"5mc6U9Vcztz7wduILOYzLbXBuXhdgk07B3w9HRmu:6d7EU2KAJbkvnyXx-M45LPt7iOc=:eyJzY29wZSI6IndvcGFpIiwiZGVhZGxpbmUiOjE2NTI0MjY1NTB9";
    
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    QNUploadOption *uploadOption = [[QNUploadOption alloc] initWithMime:@"wopai" progressHandler:^(NSString *key, float percent) {
        NSLog(@"percent == %.2f", percent);
    }
                                                                 params:nil
                                                               checkCrc:NO
                                                     cancellationSignal:nil];
    
    [upManager putFile:filePath key:nil token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        NSLog(@"resp ===== %@", resp);
        
        NSString *imgN = resp[@"hash"];
        if (imgN.length > 0) {
            if (completion) {
                completion(imgN);
            }
        } else {
            if (completion) {
                completion(nil);
            }
        }
        
    } option:uploadOption];
}

#pragma mark - 根据图片数据上传
- (void)uploadImageToQNWithImageData:(NSData *)data completion:(void(^)(NSString *imgName))completion {
    NSString *token = @"5mc6U9Vcztz7wduILOYzLbXBuXhdgk07B3w9HRmu:6d7EU2KAJbkvnyXx-M45LPt7iOc=:eyJzY29wZSI6IndvcGFpIiwiZGVhZGxpbmUiOjE2NTI0MjY1NTB9";
    
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    QNUploadOption *uploadOption = [[QNUploadOption alloc] initWithMime:@"wopai" progressHandler:^(NSString *key, float percent) {
        NSLog(@"percent == %.2f", percent);
    }
                                                                 params:nil
                                                               checkCrc:NO
                                                     cancellationSignal:nil];
    
    [upManager putData:data key:nil token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        NSLog(@"resp ===== %@", resp);
        NSString *imgN = resp[@"hash"];
        if (imgN.length > 0) {
            if (completion) {
                completion(imgN);
            }
        } else {
            if (completion) {
                completion(nil);
            }
        }
    } option:uploadOption];
}

@end
