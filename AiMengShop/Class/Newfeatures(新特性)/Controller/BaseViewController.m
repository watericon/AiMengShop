//
//  BaseViewController.m
//  BossChe
//
//  Created by Macintosh HD on 16/3/17.
//  Copyright © 2016年 MJ. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()<UIAlertViewDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"f0f0f1"];
    
    [self setNavigatianBackgrounColor];
    //
    //    //隐藏底部黑色线条
    //    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    //    self.navigationController.navigationBar.clipsToBounds = YES;
}

/**
 *  设置 导航栏标题
 *
 *  @param title
 */
- (void)setNavigationBarTitle:(NSString *)title
{
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    [customLab setTextColor:[UIColor colorWithHexString:@"#898989"]];
    customLab.textAlignment = NSTextAlignmentCenter;
    [customLab setText:title];
    //    customLab.font = [UIFont boldSystemFontOfSize:18.0];
    self.navigationItem.titleView = customLab;
    
    //    self.navigationItem.title=title;
}
-(void)setNavbackbtn{
    
    UIButton *backbtn=[[UIButton alloc] initWithFrame:CGRectMake(10, 20, 60, 44)];
    [self.view addSubview:backbtn];
    [backbtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backbtn.contentMode=UIViewContentModeScaleAspectFit;
    [backbtn addTarget:self action:@selector(NavbackClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)NavigationSetting
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage=[UIImage new];
    self.navigationController.navigationBar.translucent=YES;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
}
//自定义导航条的返回按钮
- (void)NavBackSet
{
    UIBarButtonItem *backitem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(NavbackClick)];
    self.navigationItem.leftBarButtonItem=backitem;
    backitem.title=@"";
    backitem.tintColor=[UIColor whiteColor];
    
}

/**
 *  右边的完成按钮
 */
-(void)Navrightbtnsettitle:(NSString *)righttitle{
    UIBarButtonItem *backitem=[[UIBarButtonItem alloc] initWithTitle:righttitle style:UIBarButtonItemStylePlain target:self action:@selector(rightbtnClick)];
    [backitem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem=backitem;
}

-(void)setNavgationleftbuttonItem{
    
    
    UIBarButtonItem *leftbuttonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(NavbackClick)];
    
    
    
    self.navigationItem.leftBarButtonItem=leftbuttonItem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor blackColor];
    
    [leftbuttonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIFont fontWithName:@"HelveticaNeue" size:18.0], NSFontAttributeName,
                                            [UIColor blackColor], NSForegroundColorAttributeName,
                                            nil]
                                  forState:UIControlStateNormal];
}

- (void)NavbackClick
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)setNavigatianBackgrounColor{
    self.navigationController.navigationBar.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    NSDictionary *dic = @{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"898989"],NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    self.navigationController.navigationBar.titleTextAttributes =dic;
}

-(void)rightbtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)setOtherNavigatianBackgrounColor{
    
    self.navigationController.navigationBar.barTintColor = IWColor(59 , 165, 251);
    self.navigationController.navigationBar.tintColor = IWColor(59 , 165, 251);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    
}

#pragma mark -- 隐藏多余的Cell
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

//判断用户是否开启定位并做出提醒
-(void)checkUserLocation
{
    //    if ([CLLocationManager locationServicesEnabled] &&
    //        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways
    //         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {
    //            //定位功能可用，开始定位
    //            _locationManger = [[CLLocationManager alloc] init];
    //            //  _locationManger.delegate =self;
    //            [_locationManger startUpdatingLocation];
    //        }
    //    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
    //        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"请开启定位" message:@"1.点击进入设置；2.点击进入隐私；3.点击开启定位服务,找到果泥多，选择始终" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
    //        [alert show];
    //
    //    }

//    UIImageView *tmpImageV=[UIImageView new];
//    [tmpImageV sd]

//    ZYBannerView  *BANNER=[[ZYBannerView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:BANNER];

}

#pragma mark - Loading


- (void)showLoading:(NSString *)loadingText
{



    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.label.text =loadingText;
    [HUD showAnimated:YES];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        HUD.hidden=YES;
    });

}

-(void)showLoadText:(NSString *)loadtext{
    
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:hud];
    hud.mode = MBProgressHUDModeText;
    hud.label.text =loadtext;
   [hud showAnimated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        hud.hidden=YES;
    });
}

-(void)showAlertView:(NSString *)alerttext{
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"提示" message:alerttext delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    
    
    
}

- (CGFloat)contentWidthWithStr:(NSString *)string labelHeight:(CGFloat)height andStrFont:(CGFloat)size {
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    
    return rect.size.width;
}

-(NSString *)UTCchangeDate:(NSString *)utc{
    
    NSTimeInterval time = [utc doubleValue];
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM"];
    NSString *staartstr=[dateformatter stringFromDate:date];
    
    return staartstr;
}

-(NSString *)dataChangeUTC:( NSDate*)date{
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
    
}

// 正则判断手机号码地址格式
- (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    
    //   NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    
    NSString *MOBILE = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobileNum];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
    
    
}

-(void)shareTitle:(NSString *)shareTitle shareUrl:(NSString *)shareUrl shareDesc:(NSString *)shopdesc imgUrl:(id)imgUrl{
    

    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象
        NSString* thumbURL =shareUrl;
        //  NSString *thumbImageUrl=[NSString stringWithFormat:@"%@",imgUrl];
        NSString *thumbImageUrl=imgUrl;
        IWLog(@"thumbImageUrl==%@",thumbImageUrl);
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:shareTitle descr:shopdesc thumImage:thumbImageUrl];
        //设置网页地址
        shareObject.webpageUrl =thumbURL;
        
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        
        IWLog(@"messageObject.shareObject==%@",shareObject);
        
        
        if (platformType==UMSocialPlatformType_WechatSession) {
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession  messageObject:messageObject currentViewController:self completion:^(id result, NSError *error) {
                if(error){
                    UMSocialLogInfo(@"************Share fail with error %@*********",error);
                }else{
                    if ([result isKindOfClass:[UMSocialShareResponse class]]) {
                        UMSocialShareResponse *resp = result;
                        //分享结果消息
                        UMSocialLogInfo(@"response message is %@",resp.message);
                        //第三方原始返回的数据
                        UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                        
                    }else{
                        
                        UMSocialLogInfo(@"response data is %@",result);
                    }
                }
            }];
            
        }else if (platformType==UMSocialPlatformType_WechatTimeLine){
            
            
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:self completion:^(id result, NSError *error) {
                
            }];
        }else if (platformType ==UMSocialPlatformType_WechatFavorite){
            
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatFavorite messageObject:messageObject currentViewController:self completion:^(id result, NSError *error) {
                
            }];
            
        }
        
    }];

}



-(void)stoptableVrefreshdata:(UITableView *)tableV Type:(NSString *)type{
    
    if ([type isEqualToString:@"1"]) {
        
        [tableV.mj_header endRefreshing];

       [tableV.mj_footer endRefreshing];


    }else{
        
        [tableV.mj_header endRefreshing];
        [tableV.mj_footer endRefreshingWithNoMoreData];
    }

    
}

-(void)stopcollecTrefreshdata:(UICollectionView *)CollV Type:(NSString *)type{
    
    if ([type isEqualToString:@"1"]) {
        
        [CollV.mj_header endRefreshing];
        [CollV.mj_footer endRefreshing];
        
    }else{
        
        [CollV.mj_header endRefreshing];
   [CollV.mj_footer endRefreshingWithNoMoreData];
    }

}


#pragma mark - Getter

- (NSMutableArray *)normalImages
{
    if (_normalImages == nil) {
        _normalImages = [[NSMutableArray alloc] init];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropDown_1"]];
        [_normalImages addObject:image];
    }
    return _normalImages;
}
//正在刷新状态下的图片
- (NSMutableArray *)refreshImages
{
    if (_refreshImages == nil) {
        _refreshImages = [[NSMutableArray alloc] init];
        
        //                循环添加图片
        for (NSUInteger i = 1; i<=12; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropDown_%ld", i]];
            [_refreshImages addObject:image];
        }
    }
    return _refreshImages;
}

//-(void)gifHeaderConfigWithMJRefreshGifHeader:(MJRefreshGifHeader *)header
//{
//    [header setImages:self.refreshImages forState:MJRefreshStateRefreshing];
//    [header setImages:self.normalImages forState:MJRefreshStateIdle];
//    [header setImages:self.pullingImages forState:MJRefreshStatePulling];
//    header.lastUpdatedTimeLabel.hidden= NO;
//    header.stateLabel.hidden = NO;
//}


-(void)ContactKefuM:(NSString *)userName andNICK:(NSString *)nick secURL:(NSString *)URL{
    
    if (IS_NOT_EMPTY(HWZToken)) {
        
        IWLog(@"得到的userName===%@",userName);
        
//        if (IS_NOT_EMPTY(userName)) {
//            IWEaseMessageViewController *chatController = [[IWEaseMessageViewController alloc] initWithConversationChatter:userName conversationType:EMConversationTypeChat];
//            chatController.shopURL=URL;
//            chatController.shopName=nick;
//            [self.navigationController pushViewController:chatController animated:YES];
//        }else{
//            [self showLoadText:@"聊天账户有误"];
//            
//        }

        //        if (IS_NOT_EMPTY(@"test001")) {
        //            IWEaseMessageViewController *chatController = [[IWEaseMessageViewController alloc] initWithConversationChatter:@"test001" conversationType:EMConversationTypeChat];
        //            chatController.shopName=nick;
        //
        // chatController.shopURL=URL;
        //            [self.navigationController pushViewController:chatController animated:YES];
        //        }else{
        //            [self showLoadText:@"聊天账户有误"];
        //
        //        }
    }else{
        
//        ZWLoginController *zwloginVC=[ZWLoginController new];
//        [self presentViewController:zwloginVC animated:YES completion:^{
//            
//        }];
    }
}


-(NSString *)toJsonString:(id)data{
    
    if(data == nil) return @"";
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil){
        NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                     encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    return @"";
}
//转场动画开启
-(void)reloadDataImage{
    _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _mainView.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    imageView.centerX = _mainView.centerX;
    imageView.centerY = _mainView.centerY;
    [_mainView addSubview:imageView];
    [[UIApplication sharedApplication].keyWindow addSubview:_mainView];
    //创建一个数组，数组中按顺序添加要播放的图片（图片为静态的图片）
    NSMutableArray *imgArray = [NSMutableArray array];
    for (int i=1; i<7; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropDown_%d",i]];
        [imgArray addObject:image];
    }
    //把存有UIImage的数组赋给动画图片数组
    imageView.animationImages = imgArray;
    //设置执行一次完整动画的时长
    imageView.animationDuration = 6*0.15;
    //动画重复次数 （0为重复播放）
    imageView.animationRepeatCount = 0;
    //开始播放动画
    [imageView startAnimating];
    //停止播放动画  - (void)stopAnimating;
    //判断是否正在执行动画  - (BOOL)isAnimating;
}
//转场动画关闭
-(void)removeImage{
    [_mainView removeFromSuperview];
}



-(NSString *)toScaleImageWithWidth:(id)width andHeight:(id)height andScale:(id)scaleNumber
{
    return [NSString stringWithFormat:@"?x-oss-process=image/resize,m_fixed,h_%d,w_%d/quality,Q_%d",(int)height,(int)width,(int)scaleNumber];
}

#pragma mark - 时间判断
-(int)compareDate:(NSString*)startDate withDate:(NSString*)endDate{
    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:startDate];
    dt2 = [df dateFromString:endDate];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}














@end









