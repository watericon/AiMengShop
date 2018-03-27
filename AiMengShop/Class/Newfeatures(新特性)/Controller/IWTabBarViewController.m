//
//  IWTabBarViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWTabBarViewController.h"
#import "IWCheckNetwork.h"
#import "AiMengShop-Swift.h"

//#import "IWHomeViewController.h"
//#import "IWShopViewController.h"
//#import "IWMineController.h"
//#import "IWGainController.h"
//#import "IWNearbyController.h"
#import "BaseNavigationController.h"

//#import "ZWGainController.h"//赚吧重构
//#import "ZWGroupshoppingController.h"
//#import "ViewController.h"
#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])
@interface IWTabBarViewController () <UITabBarControllerDelegate>{

NSInteger _currentIndex;

}
@property(nonatomic,strong)IWHomeViewController *homeVC;
@property(nonatomic,strong)IWZhuanTiViewController *zhuantiVC;
@property(nonatomic,strong)IWCartViewController *cartVC;
@property(nonatomic,strong)IWMineViewController *mineVC;


@end

@implementation IWTabBarViewController

-(void)loadView{
    [super loadView];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //    [AFAppDotNetAPIClient shareRecNetWork];
    //    [self.navigationController setNavigationBarHidden:YES animated:YES];

//    [self isJailBreak];

    BOOL BREAK=[self isJailBreak];

    if (BREAK ==NO) {

 [IWCheckNetwork isExistenceNetwork];
    }

    self.tabBarController.delegate = self;
    self.delegate = self;
    
    [self createViewControllers];
    
    
}



const char* jailbreak_tool_pathes[] = {
    "/Applications/Cydia.app",
    "/Library/MobileSubstrate/MobileSubstrate.dylib",
    "/bin/bash",
    "/usr/sbin/sshd",
    "/etc/apt"
};

- (BOOL)isJailBreak
{
    for (int i=0; i<ARRAY_SIZE(jailbreak_tool_pathes); i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_tool_pathes[i]]]) {
            NSLog(@"这台苹果手机已经越狱");


            return YES;
        }
    }
    NSLog(@"这台苹果手机没有越狱");
    return NO;
}





-(void)createViewControllers{



    
    UITabBarController *tabBars = [[UITabBarController alloc]init];
    tabBars.delegate= self;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#898989"],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"#63bb48"],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];



     _homeVC=[[IWHomeViewController alloc] init];
    [self initController:_homeVC andname:@"Pshouye" anded:@"Pshouyexuanzhong" thirdName:@"首页"];
   BaseNavigationController*nc1=[[BaseNavigationController alloc]initWithRootViewController:_homeVC];

    _zhuantiVC=[[IWZhuanTiViewController alloc] init];
    [self initController:_zhuantiVC andname:@"Pzhuanti" anded:@"Pzhuantixuanzhong" thirdName:@"专题"];
    BaseNavigationController*nc2=[[BaseNavigationController alloc]initWithRootViewController:_zhuantiVC];



    _cartVC=[[IWCartViewController alloc] init];
    [self initController:_cartVC andname:@"Pgouwuche" anded:@"Pgouwuchexuanzhong" thirdName:@"购物车"];
    BaseNavigationController*nc3=[[BaseNavigationController alloc]initWithRootViewController:_cartVC];


    _mineVC=[[IWMineViewController alloc] init];
    [self initController:_mineVC andname:@"Pgeren" anded:@"Pgerenxuanzhong" thirdName:@"个人中心"];
    BaseNavigationController*nc4=[[BaseNavigationController alloc]initWithRootViewController:_mineVC];

    
    self.viewControllers=@[nc1,nc2,nc3,nc4];
}
-(void)initController:(UIViewController *)ctrVC andname:(NSString *)wname anded:(NSString *)wnamed thirdName:(NSString *)name{

    UIImage *homeImage = [UIImage imageNamed:wname];
    UIImage *homeImageSel = [UIImage imageNamed:wnamed];
    homeImage = [homeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeImageSel = [homeImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ctrVC.tabBarItem=[[UITabBarItem alloc] initWithTitle:name image:homeImage selectedImage:homeImageSel];

}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
//    IWLog(@"[viewController class]               ====            %@",[viewController.childViewControllers.firstObject class]);
//    if([ViewController class] == [(BaseNavigationController *)viewController.childViewControllers.firstObject class])    //"购物车"
//    {
//        if (!IS_NOT_EMPTY(HWZToken)) {
//            [self presentViewController:[ZWLoginController new] animated:YES completion:^{
//                
//            }];
//            return NO;
//        }else{
//            return YES;
//        }
//    }
    return YES;
}




- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
   

    //点击tabBarItem动画
    if (self.selectedIndex != _currentIndex)[self tabBarButtonClick:[self getTabBarButton]];


}

- (UIControl *)getTabBarButton{
    NSMutableArray *tabBarButtons = [[NSMutableArray alloc]initWithCapacity:0];


    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [tabBarButtons addObject:tabBarButton];
        }
    }
    UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];

    return tabBarButton;
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    /*
     "<UITabBarSwappableImageView: 0x7fd7ebc52760; frame = (32 5.5; 25 25); opaque = NO; userInteractionEnabled = NO; tintColor = UIDeviceWhiteColorSpace 0.572549 1; layer = <CALayer: 0x7fd7ebc52940>>",
     "<UITabBarButtonLabel: 0x7fd7ebc4f360; frame = (29.5 35; 30 12); text = '\U8d2d\U7269\U8f66'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7fd7ebc4e090>>" a
     */
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据需求自定义
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
           animation.keyPath = @"transform.scale";
            // animation.keyPath = @"transform.rotation";
            animation.values = @[@1.3,@1.3,@1.3,@1.3,@1.3];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }

    _currentIndex = self.selectedIndex;
}

//2.图片放大或压缩处理 ，图片放大倍数 0 ~ 2 之间 ，0~1 缩小图片，1~2 放大图片
/**
 *  根据image 返回放大或缩小之后的图片
 *
 *  @param image    原始图片
 *  @param multiple 放大倍数 0 ~ 2 之间
 *
 *  @return 新的image
 */
- (UIImage *) createNewImageWithColor:(UIImage *)image multiple:(CGFloat)multiple
{
    CGFloat newMultiple = multiple;
    if (multiple == 0) {
        newMultiple = 1;
    }
    else if((fabs(multiple) > 0 && fabs(multiple) < 1) || (fabs(multiple)>1 && fabs(multiple)<2))
    {
        newMultiple = multiple;
    }
    else
    {
        newMultiple = 1;
    }
    CGFloat w = image.size.width*newMultiple;
    CGFloat h = image.size.height*newMultiple;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIImage *tempImage = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    UIGraphicsBeginImageContextWithOptions(image.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:0] addClip];
    [image drawInRect:imageFrame];
    tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempImage;
}

@end
