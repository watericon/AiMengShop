//
//  IWBossCarTool.m
//  BossChe
//
//  Created by Macintosh HD on 15/9/25.
//  Copyright © 2015年 MJ. All rights reserved.
//

#import "IWBossCarTool.h"
#import "IWNewFeatureViewController.h"
#import "IWTabBarViewController.h"

@implementation IWBossCarTool
+(void)ChooseController{
    
    NSString *key=@"CFBundleVersion";
 
    // Override point for customization after application launch.
    [UIApplication sharedApplication].keyWindow.backgroundColor = [UIColor whiteColor];
    //取出沙盒中存储的上次使用的软件的版本号
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *lastVersion=[defaults stringForKey:key];
    
    IWLog(@"key=上次%@",lastVersion);
    //获得当前软件的版本号
    NSString *currentVersion= [NSBundle mainBundle].infoDictionary[key];
    
       IWLog(@"key=当前%@",currentVersion);
    if ([currentVersion  isEqualToString:lastVersion]) {
        //显示状态栏
        [UIApplication sharedApplication].statusBarHidden=NO;
       [UIApplication sharedApplication].keyWindow.rootViewController=[[IWTabBarViewController alloc] init];
        
    
        
    }else{
        
        [UIApplication sharedApplication].keyWindow.rootViewController=[[IWNewFeatureViewController alloc] init];
        //存储新版本
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }
    
    
    
    
    
    
}
@end
