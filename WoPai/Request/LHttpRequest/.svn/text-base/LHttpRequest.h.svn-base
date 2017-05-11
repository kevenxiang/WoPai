//
//  LHttpRequest.h
//  Afnetwork
//
//  Created by xiang on 16/5/2.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  封装Http请求
 */
@interface LHttpRequest : NSObject

/**
 *  设置url
 *
 *  @param url
 */
+ (void)setUrl:(NSString *)url;
+ (NSString *)url;

/**
 *  Http Get 请求
 *
 *  @param path       请求路径
 *  @param parameters 请求参数
 *  @param success    成功Block
 *  @param failure    失败Block
 */
+ (void)getHttpRequest:(NSString *)path parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure;

/**
 *  Http Post 请求
 *
 *  @param path       请求路径
 *  @param parameters 请求参数
 *  @param success    成功Block
 *  @param failure    失败Block
 */
+ (void)postHttpRequest:(NSString *)path parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure;

/**
 *  Http Post Datas 上传
 *
 *  @param path       请求路径
 *  @param parameters 请求参数
 *  @param data       上传的data
 *  @param name       文件类型：eg:file
 *  @param fileName   文件名：eg:xxxx.jpg
 *  @param mimeType   类型：eg:@"image/jpg"
 *  @param success    成功Block
 *  @param failure    失败Block
 */
+ (void)postHttpRequest:(NSString *)path parameters:(NSDictionary *)parameters data:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure;

+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure;

+ (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure;

@end
