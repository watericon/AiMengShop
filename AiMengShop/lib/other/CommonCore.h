//
//  CommonCore.h
//

#import <Foundation/Foundation.h>
#import "SysConfig.h"

@interface CommonCore : NSObject

//获取GUID
+ (NSString *)GUID;

//获取logininvitecode
+ (NSString *)queryloginvitecode;

/**
 *  查询当前登陆用户id
 *
 *  @return 
 */
+ (NSString *)queryLoginUserId;

/**
 *  查询当前登陆用户手机
 *
 *  @return
 */
+ (NSString *)queryLoginUserPhone; 

/**
 *  查询挡圈登陆用户的toten
 *
 *  @return
 */
+ (NSString *)queryLOginUsertoken;

/**
 *  当前用户角色id。
 *
 *  @return
 */
+ (NSString *)queryLoginprivId;

/**
 *  当前部门id
 */
+ (NSString *)queryLoginUserdept_id;

/**
 *  当前道馆背景图
 */
+ (NSString *)queryavatar_big;

///**
// *  当前status
// */
//+ (NSString *)querystatus;
/**
 *  当前道馆id
 */
+ (NSString *)querystore_id;
/**
 *  当前道馆名字
 */
+ (NSString *)querystore_name;

+(NSString*)queryloginstatus;

+(NSString*)queryloginutype;

+(NSString *)querySelctStoredID;

+(NSString *)loginSex;

+(NSString *)queryloginPWD;

@end



