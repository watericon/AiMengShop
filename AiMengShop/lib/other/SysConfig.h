//
//  SysConfig.h

//

#import <Foundation/Foundation.h>

@interface SysConfig : NSObject

/**
 *  当前登录用户id
 *
 *  @return 
 */
+ (NSString *)loginUserId;
/**
 *  当前登录用户手机号
 *
 *  @return
 */
+ (NSString *)loginUserPhone;
/**
 *  当前登录用户token
 *
 *  @return 
 */
+ (NSString *)loginUsertoken;


/**
 *  当前登录用户密码
 *
 *  @return
 */
+ (NSString *)loginpwd;

/**
 *  当前登录用户邀请码
 *
 *  @return
 */
+ (NSString *)logininvitecode;



/**
 *  当前用户角色id。
 */
+ (NSString *)loginUseruser_privId;

+(NSString *)loginuseravatar_big;


+(NSString *)loginuserstatus;
+(NSString *)loginSex;
+(NSString *)loginstore_id;
+(NSString *)loginstore_name;

+(NSString *)loginstatus;


+(NSString *)loginutype;


//极光推送ID
+(NSString *)selectStoreID;



@end






















