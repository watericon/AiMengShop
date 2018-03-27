//
//  Interface.h
//  AiMengShop
//
//  Created by apple on 2017/6/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#ifndef Interface_h
#define Interface_h
#import "AppDelegate.h"
CG_INLINE CGRect
CGRectMake1(CGFloat x,CGFloat y,CGFloat width,CGFloat height)
{
    //创建appDelegate 在这不会产生类的对象,(不存在引起循环引用的问题)
    AppDelegate *app = [UIApplication sharedApplication].delegate;

    //计算返回
    return CGRectMake(x * app.autoSizeScaleX, y * app.autoSizeScaleY, width * app.autoSizeScaleX, height * app.autoSizeScaleY);


    NSLog(@"width * app.autoSizeScaleX====%f",width * app.autoSizeScaleX);

   NSLog(@"height * app.autoSizeScaleY====%f",height * app.autoSizeScaleY);



}

#endif /* Interface_h */
