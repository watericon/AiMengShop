//
//  LRBaseNavigationController.m
//  LRShop
//
//  Created by HCW on 16/7/28.
//  Copyright © 2016年 HCW. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigateionBar];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    //隐藏底部黑色线条
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
//    self.navigationBar.clipsToBounds = YES;
}

#pragma mark - Private Methods

- (void)setupNavigateionBar
{
    UIImage *image = [UIImage imageNamed:@"nav_bg"];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageNamed:@"navigation_clear"]];
    
    self.navigationBar.translucent = NO;
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    
    NSDictionary* dict = @{ NSForegroundColorAttributeName : [UIColor whiteColor],
                            NSFontAttributeName : [UIFont systemFontOfSize:20.0f] };
    self.navigationBar.titleTextAttributes = dict;
}

/**
 *  重写push方法,添加统一的返回按钮
 */
- (void)pushViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count >= 1) {
        UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"back"]
                    forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self
                       action:@selector(backAction)
             forControlEvents:UIControlEventTouchUpInside];
        
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        viewController.navigationItem.leftBarButtonItem =
        [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    [super pushViewController:viewController animated:animated];
}


- (void)backAction
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(nonnull UIGestureRecognizer*)gestureRecognizer
{
    return self.childViewControllers.count > 1;
}

@end
