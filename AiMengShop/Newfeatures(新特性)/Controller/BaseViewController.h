//
//  BaseViewController.h
//  BossChe
//
//  Created by Macintosh HD on 16/3/17.
//  Copyright © 2016年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IWTabBarViewController.h"
#import "MJRefreshGifHeader.h"


@interface BaseViewController : UIViewController{

// CLLocationManager *_locationManger;


}

@property (nonatomic, copy) NSMutableArray *refreshImages;
@property (nonatomic, copy) NSMutableArray *normalImages;
@property (nonatomic, copy) NSMutableArray *pullingImages;
@property (nonatomic, copy) UIView *mainView;
// 设置 导航栏标题
- (void)setNavigationBarTitle:(NSString *)title;

//tabbar
- (void)NavigationSetting;

//导航返回按钮
- (void)NavBackSet;
//设置导航栏背景颜色

-(void)setNavigatianBackgrounColor;

//设置导航栏背景颜色

-(void)setOtherNavigatianBackgrounColor;
/**
 *  右边按钮
 *
 *  @param righttitle 名字
 */
-(void)Navrightbtnsettitle:(NSString *)righttitle;
//去掉导航栏背景颜色

-(void)removeNavgationColor;

-(void)setNavgationleftbuttonItem;

-(void)checkUserLocation;

-(void)setNavbackbtn;


#pragma mark --隐藏多余的表格
-(void)setExtraCellLineHidden:(UITableView *)tableView;
#pragma mark - Loading
- (void)showLoading:(NSString *)loadingText;
-(void)showLoadText:(NSString*)loadtext;
-(void)showAlertView:(NSString *)alerttext;
- (CGFloat)contentWidthWithStr:(NSString *)string labelHeight:(CGFloat)height andStrFont:(CGFloat)size;
#pragma mark --时间戳转换日期
-(NSString *)UTCchangeDate:(NSString *)utc;
-(NSString *)dataChangeUTC:(NSDate *)date;

- (BOOL)isMobileNumber:(NSString *)mobileNum;

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
//友盟分享
-(void)shareTitle:(NSString *)shareTitle shareUrl:(NSString *)shareUrl shareDesc:(NSString *)shopdesc imgUrl:(id)imgUrl;
//UITableView 刷新
-(void)stoptableVrefreshdata:(UITableView *)TABV Type:(NSString *)type;
//UICollectionView 刷新
-(void)stopcollecTrefreshdata:(UICollectionView *)CollV Type:(NSString *)type;

-(void)gifHeaderConfigWithMJRefreshGifHeader:(MJRefreshGifHeader *)header;

-(void)ContactKefuM:(NSString *)userName andNICK:(NSString *)nick secURL:(NSString *)URL;
-(NSString *)toJsonString:(id)data;
//开启转场动画
-(void)reloadDataImage;
//关闭
-(void)removeImage;
//时间判断
-(int)compareDate:(NSString*)startDate withDate:(NSString*)endDate;
@end
