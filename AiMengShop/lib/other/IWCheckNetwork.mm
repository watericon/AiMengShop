//
//  IWCheckNetwork.m
//  BossChe
//
//  Created by Macintosh HD on 15/8/12.
//  Copyright (c) 2015年 MJ. All rights reserved.
//

#import "IWCheckNetwork.h"


@implementation IWCheckNetwork

+(BOOL)isExistenceNetwork
{
    BOOL isExistenceNetwork=TRUE;
    Reachability *r = [Reachability reachabilityWithHostName:@"http://huizong58.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork=FALSE;

            break;
        case ReachableViaWWAN:
            isExistenceNetwork=TRUE;
         
            break;
        case ReachableViaWiFi:
            isExistenceNetwork=TRUE;
           
            break;
    }
    if (isExistenceNetwork==false) {

        UIAlertView *myalert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"网络已断开" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil,nil];
        [myalert show];


    }
    return isExistenceNetwork;
}


@end
