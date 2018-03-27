//
//  CommonCore.m
//  BossCarEmployer

//

#import "CommonCore.h"

@implementation CommonCore

+ (NSString *)GUID
{
    CFUUIDRef uuidObj=CFUUIDCreate(NULL);
    CFStringRef strguid=CFUUIDCreateString(NULL, uuidObj);
    NSString *guid=(__bridge_transfer NSString *)strguid;
    CFRelease(uuidObj);
    
    guid=[guid lowercaseString];
    return  guid;
}
///查询当前登陆用户id
+ (NSString *)queryLoginUserId
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginUserId]];
}

///查询当前登陆用户手机
+ (NSString *)queryLoginUserPhone
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginUserPhone]];
}

///查询当前登陆用户的toten
+ (NSString *)queryLOginUsertoken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginUsertoken]];
}

/**
 *  当前用户角色id。
 *
 *  @return
 */
+ (NSString *)queryLoginprivId
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginUseruser_privId]];
}
//+(NSString *)querystatus{
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:[SysConfig loginuserstatus]];
//
//
//}
+(NSString *)queryavatar_big{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginuseravatar_big]];
}
+(NSString *)querystore_id{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginstore_id]];

}
+(NSString *)loginSex{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginSex]];
}
+(NSString *)querystore_name{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginstore_name]];
}

+(NSString*)queryloginstatus{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginstatus]];


}

+(NSString *)queryloginutype{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginutype]];

}
+(NSString *)querySelctStoredID{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig selectStoreID]];

}

+(NSString *)queryloginvitecode{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig logininvitecode]];

}
+(NSString *)queryloginPWD{


    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:[SysConfig loginpwd]];

}

//+(NSString *)querylogininvitecode{
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    return [defaults objectForKey:[SysConfig logininvitecode]];
//
//
//}

@end









