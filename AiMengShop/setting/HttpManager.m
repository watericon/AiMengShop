//
//  HttpManager.m
//  Community
//
//  Created by chenzhen on 16/3/9.
//  Copyright © 2016年 langruisi All rights reserved.
//

#import "HttpManager.h"
#import "AFNetworking.h"
@implementation HttpManager


+(void)post:(NSString *)url params:(id)params success:(void (^)(id))sucess failure:(void (^)(NSError *))failure{

    IWLog(@"请求参数            ====                \n%@",params);
    // 创建请求管理者
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    session.requestSerializer.timeoutInterval = 10;
    [session.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", nil]];

    [session POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        IWLog(@"请求参数            ====                \n%@",responseObject);
        if ([CODE isEqualToString:@"1009"]) {
//            ZWLoginController *ZWVC=[ZWLoginController new];
//            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ZWVC animated:YES completion:^{
//            }];
        }
        if (sucess)
        {
            sucess(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        IWLog(@"数据请求失败   ====   failure");
        if(failure)
        {
            failure(error);
        }


    }];


}


+(void)get:(NSString *)url params:(id)params success:(void (^)(id))sucess failure:(void (^)(NSError *))failure{



    // 创建请求管理者
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //加上下面2句responseObject 数据格式为data 不加为字典
    //    session.responseSerializer =  [AFHTTPResponseSerializer serializer];
    //    session.requestSerializer=[AFHTTPRequestSerializer serializer];
    session.requestSerializer.timeoutInterval = 15;
    [session.responseSerializer setAcceptableContentTypes: [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", nil]];
    //[SVProgressHUD reveal];

    [session POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {


        if ([responseObject[@"code"] isEqualToNumber:@(10001)]) {

        }

        if (sucess) {
            sucess(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        if(failure)
        {
            failure(error);
        }
        
        
    }];



}


+(void)post:(NSString *)url params:(NSDictionary *)params images:(NSArray *)imageAry imageName:(NSString *)imgName success:(void (^)(id))sucess failure:(void (^)(NSError *))failure{

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer =  [AFHTTPResponseSerializer serializer];

    session.requestSerializer.timeoutInterval = 60;
    //    [[TipTool sharedManager] showLoadingView:@"上传图片中..."];

    [session POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        if (imageAry.count>0) {

            for (int i=0; i<imageAry.count; i++) {

                //时间戳命名
                NSTimeInterval time = [NSDate date].timeIntervalSince1970 * 1000;

                NSString *name = [NSString stringWithFormat:@"%f.jpg",time];
                //                DLog(@"-----%@ ---%@",name,imageAry[i]);
                [formData appendPartWithFileData:imageAry[i] name:imgName fileName:name mimeType:@"image/jpeg"];
                
            }
        }

    } progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        if (sucess)
        {
            sucess(dic);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        if(failure)
        {
            failure(error);
        }

    }];



}

+(void)postImage:(NSString *)URLString parameters:(id)parameters imageFile:(UIImage *)file fileKey:(NSString *)fileKey success:(void (^)( NSDictionary*))success failure:(void (^)(NSError *))failure{

    //创建请求管理者
    AFHTTPSessionManager *mgr=[AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    NSString *userId=[NSString stringWithFormat:@"%@",userAccount];
    //    if (![userId isEqualToString:@"(null)"]){
    //
    //        [mgr.requestSerializer setValue:userId forHTTPHeaderField:@"Cookie"];
    //
    //    }
    [mgr.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    mgr.requestSerializer.timeoutInterval = 12;
    [mgr.requestSerializer didChangeValueForKey:@"timeoutInterval"];

   // mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

[mgr POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    NSData *imageData = UIImageJPEGRepresentation(file, 0.005);
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss:SSS";

    NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];

    [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"%@",fileKey] fileName:fileName mimeType:@"image/png"];


} progress:^(NSProgress * _Nonnull uploadProgress) {

} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    if (success) {
        //            [SVProgressHUD dismiss];
        NSDictionary  *json=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //            NSMutableArray *array=[json objectForKey:@"files"];
        //            NSDictionary *dic=[array objectAtIndex:0];
        //            NSLog(@"%@",json);

        success(json);
    }


} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

    if (![[AFNetworkReachabilityManager sharedManager] isReachable]) {

    }else
    {

    }

    if (failure) {

        failure(error);
    }


}];




}




@end
