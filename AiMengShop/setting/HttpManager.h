//
//  HttpManager.h
//  Community
//
//  Created by chenzhen on 16/3/9.
//  Copyright © 2016年 langruisi All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ZWLoginController.h"

@interface HttpManager : NSObject
//通用post请求
+ (void)post:(NSString *)url params:(id )params  success:(void (^) (id json))sucess failure:(void (^) (NSError *error))failure;

+ (void)get:(NSString *)url params:(id )params  success:(void (^) (id json))sucess failure:(void (^) (NSError *error))failure;

//（带图片数据请求）
+(void)post:(NSString *)url params:(NSDictionary *)params  images:(NSArray *)imageAry imageName:(NSString *)imgName success:(void (^) (id json))sucess failure:(void (^) (NSError *error))failure;

// (带文件数据请求)
+ (void)post:(NSString *)url params:(NSDictionary *)params fileURL:(NSURL *)fileUrl fileName:(NSString *)fileName success:(void (^) (id json))cucess failure:(void (^) (NSError *error))failure;





//+(void)postImage:(NSString *)URLString parameters:(id)parameters imageFile:(UIImage *)file fileKey:(NSString *)fileKey success:(void (^)(NSDictionary *responseObject))success failure:(void (^)(NSError *error))failure;
@end
