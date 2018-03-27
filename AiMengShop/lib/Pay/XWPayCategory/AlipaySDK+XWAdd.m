//
//  AlipaySDK+XWAdd.m
//  yyjx
//
//  Created by wazrx on 16/5/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AlipaySDK+XWAdd.h"
#import "Order.h"
#import "DataSigner.h"
#import <objc/runtime.h>

static void * const xwAdd_partnerID_key = "xwAdd_partnerID_key";
static void * const xwAdd_sellerID_key = "xwAdd_sellerID_key";
static void * const xwAdd_partnerPrivKey_key = "xwAdd_partnerPrivKey_key";
static void * const xwAdd_callbackConfig_key = "xwAdd_callbackConfig_key";

@implementation AlipaySDK (XWAdd)

+ (void)xwAdd_registerAlipayWithPartnerID:(NSString*)partnerID sellerID:(NSString*)sellerID partnerPrivKey:(NSString *)partnerPrivKey {
    [self _xwAdd_saveValueWithKey:xwAdd_partnerID_key value:partnerID];
    [self _xwAdd_saveValueWithKey:xwAdd_sellerID_key value:sellerID];
    [self _xwAdd_saveValueWithKey:xwAdd_partnerPrivKey_key value:partnerPrivKey];
}

+ (void)xwAdd_sendPayRequestWithOrderID:(NSString *)orderID
                              orderName:(NSString *)orderName
                              orderDescription:(NSString *)orderDescription
                             orderPrice:(NSString *)orderPrice
                         orderNotifyUrl:(NSString *)orderNotifyUrl
                              appScheme:(NSString *)appScheme
                         callbackConfig:(void (^)(BOOL successed))config {
    if (!config) {
        NSLog(@"设置回调block");
        return;
    }
    /*
    //生成订单信息
    NSString * partnerID = [self _xwAdd_readValueWithKey:xwAdd_partnerID_key];
    NSString * sellerID = [self _xwAdd_readValueWithKey:xwAdd_sellerID_key];
    NSString * partnerPrivKey = [self _xwAdd_readValueWithKey:xwAdd_partnerPrivKey_key];
    
    
    if (!partnerID.length || !sellerID.length || !partnerPrivKey.length) {
        NSLog(@"基础信息不全");
        config(NO);
        return;
    }
    */
    
    
    //重要说明
    //这里只是为了方便直接向商户展示支付宝的整个支付流程；所以Demo中加签过程直接放在客户端完成；
    //真实App里，privateKey等数据严禁放在客户端，加签过程务必要放在服务端完成；
    //防止商户私密数据泄露，造成不必要的资金损失，及面临各种安全风险；
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
  //  NSString *appID = @"2088621470175263";


    //谁在修改此处的参数  手给砍了
     NSString *appID = @"2017032306366446";

        NSString *privateKey = @"MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCRCF+/5Zo81m81f5p8c2UGUPr1wVi/C/o5zywOEzru4Aq6fsjrup1xwwoewlG0Cl4m0nhbJZMr4iT01OEq5z6q07DXgC6Or+lDcdloLEIp1ftVlm+KWd5iyAYLwHVNagNZsfiTWzizTjYgE3s1EqfA/SRpcsu0c0BGT/VSgd189fsWwzqihdcGOWMl2YAn9E4WUsoGzTNtwJ4ieZYATIs7GAuRg/mCwPaNzS1D8B9sDfOBpw14zbmfFdZq332jSq9WEaQLpThEmokjrtoQlkn8+lKAd3MtVYZtCwOQZZycBVfN9NkPuK3fOCGKAkCwJa4ebXkN/FadjsZxOZ7Tah5jAgMBAAECggEAWJKcpz05rN3onOuJFWgD0o+yNFQYNtTBxHxZk177Jtd8tdioLA6UCN3sWEykSSfryBnRlxijgLFjkIJR4TnIc9tErNeDl3CnLKFi/NPKtHISRHrTM9MelYVC6/plqRmNYkHmZVfYkOi69WvwWsFB4gK3Mg8BiPq5zjcWw4S8F4vWmc7iEQVbZtoZA80pfcPjkZr2kXfK9mwdCJHIbVeOYXPcVSG3J2OfbQ5CH0dUf4sjCr2FYI1XHX6TZQGT+M22vrVyzfsgSB3xcEY0ay3peuINNdsGg42CdpcUcRwSfYhX2Vwp7lFrGxwA+DPoBzetS/V7msaB4L5+Eyh93dH2gQKBgQDFIOSdNmP8pTICw8tV6IYyDQdCRCDgBgomSUE1Q57NZBNoEH7VfzQ8Vs5tvscam2gHEdYMnSmMkKbi7uYJlK886GZVe56tvRWKDtOP7tJpAnLiuDSRQK1G4ehi/51NgRWTBiOmdij2ZQRrNt+3hD7x4MUM89T5AoZPmuYvvYMdGQKBgQC8WJdcy9KQQkrEbrSv7zaiKsTnHJaM7ks/EmJHdwmRD3GKhurC1hf3dctuOldnu4R+VYMFRVb2skrR5PEoXMh6llJqh7/WFe9eECa7+Yf7Hv17zsIc1FN5L2D7smW74YGrSY6N3riKa15cfueWWmqEwAT9hg5qm33AdZLtsG9K2wKBgArvzD88qUd3EtM8caeOgwN73Y87oGdNbnq5Tbjay5CxoLIBWEgYCpneZw2HrBw5ywe5YZrJjWiTDe9BOdoGOcKzUhokBaW1+9/w+qPdqCbTT/RsK95zLCnmlrIHZH7MTpodmRS/MX6aFCiunrLbz3Iz+jrBvGskTLdV7LdxWDjhAoGAEwfok2nM5uKr51lATJ6hKJWlu6x50deqJr9Wyt3OS6gB0vt68SDs3wY5/fNLLaIW6yT8ziWJeffd84NskqV9ZFWYEkeRLLKesyRypX+7K7af6kij+IHDxXTyGbyW5vsMPSB7lP4yK1pZ+IKiJ+EO7kbwuiU3g7IebLn0lKvFMw0CgYAd2meYmby2lgwLL8V746asSrCJlKSTTLw/Mo4VTwZfn3AkxuUJTuYTRnpF7UdjkaRayijNgy17lvZLb0h+zMEwY2tJpvzTzuGQkRzTQCDCwmTM543cpZ0iHJzCFj5V194pEL2JFMBPbXrrH6wKMhCNto5Hze8ZMkRS9P/EOb7zug==";

    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    /*
    Order *order = [Order new];
    
    order.app_id = @"2016081901772170";
    
    order.method = @"alipay.trade.app.pay";
    
    order.charset = @"uft-8";
    order.notify_url = orderNotifyUrl;
    
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"1.0";
    
    // NOTE: sign_type设置
    order.sign_type = @"RSA";
    
    // NOTE: 商品数据
    order.biz_content = [BizContent new];
    order.biz_content.body = @"我是测试数据";
    order.biz_content.subject = @"1";
    order.biz_content.out_trade_no = orderID; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = orderPrice; //商品价格
    
    
    // 将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSepec = %@",orderInfo);
    

    //通过私钥将订单信息签名
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderInfoEncoded];
    
    if (!signedString.length) {
        NSLog(@"签名失败");
        config(NO);
        return;
    }
    /*
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                   orderSpec, signedString, @"RSA"];
    NSLog(@"==== %@", orderString);
    
    // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                             orderInfoEncoded, signedString];
    
    [self xwAdd_sendPayWithOrderInfo:orderString appScheme:appScheme callbackConfig:config];*/
    
    
    
    //partner和seller获取失败,提示
    if ([appID length] == 0 ||
        [privateKey length] == 0)
    {
     //   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
  //                                                      message:@"缺少appId或者私钥。"
 //                                                      delegate:self
  //                                            cancelButtonTitle:@"确定"
  //                                            otherButtonTitles:nil];
     //   [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order* order = [Order new];
    
    // NOTE: app_id设置
    order.app_id = appID;
    
    // NOTE: 支付接口名称
    order.method = @"alipay.trade.app.pay";
    
    // NOTE: 回调地址
    order.notify_url = orderNotifyUrl;
    
    // NOTE: 参数编码格式
   // order.charset = @"utf-8";
    order.charset = @"utf-8";
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"2.0";
    
    // NOTE: sign_type设置
    order.sign_type = @"RSA";
    
    // NOTE: 商品数据
    order.biz_content = [BizContent new];
    order.biz_content.body = @"正式订单";
    order.biz_content.subject = @"购买商品";
    order.biz_content.out_trade_no = orderID; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = orderPrice; //商品价格
    
    //将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSpec = %@",orderInfo);
    
    // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
    //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderInfo];
    
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
//        NSString *appScheme = @"alisdkdemo";
        
        // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];

        [self xwAdd_sendPayWithOrderInfo:orderString appScheme:appScheme callbackConfig:config];
    }
    
}

+ (void)xwAdd_sendPayWithOrderInfo:(NSString *)orderInfo
                         appScheme:(NSString *)appScheme
                    callbackConfig:(void (^)(BOOL successed))config {
    //保存回调block
    objc_setAssociatedObject(self, xwAdd_callbackConfig_key, config, OBJC_ASSOCIATION_COPY_NONATOMIC);
    //发起支付请求
    [[AlipaySDK defaultService] payOrder:orderInfo fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        [self _xwAdd_checkResultWithDict:resultDic];
    }];
    
}

+ (void)xwAdd_handleOpenURL:(NSURL *)url {
    if (![url.host isEqualToString:@"safepay"]) {
        return;
    }
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        [self _xwAdd_checkResultWithDict:resultDic];
    }];
}

#pragma mark - private methods

+ (void)_xwAdd_checkResultWithDict:(NSDictionary *)resultDic{
    void (^config)(BOOL successed) = objc_getAssociatedObject(self, xwAdd_callbackConfig_key);
    if (!config) {
        return;
    }
    config([resultDic[@"resultStatus"] intValue] == 9000);
    config = nil;
    objc_setAssociatedObject(self, xwAdd_callbackConfig_key, nil, OBJC_ASSOCIATION_ASSIGN);
}

+ (void)_xwAdd_saveValueWithKey:(void *)key value:(id)value{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (id)_xwAdd_readValueWithKey:(void *)key{
    return objc_getAssociatedObject(self, key);
}
@end
