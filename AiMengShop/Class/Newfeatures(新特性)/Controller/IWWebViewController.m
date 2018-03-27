//
//  IWWebViewController.m
//  minshengbank
//
//  Created by 王 on 16/5/10.
//  Copyright © 2016年 王. All rights reserved.
//

#import "IWWebViewController.h"

@interface IWWebViewController ()<UIWebViewDelegate>

@end

@implementation IWWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.titlestr;
    
    self.navigationController.navigationBar.hidden=YES;
    UIView * navigationView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    [self.view addSubview:navigationView];
    navigationView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Navmianbar"]];
    
    UILabel *fightingtitle=[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2-55, 20, 110, 44)];
    [navigationView addSubview:fightingtitle];
    fightingtitle.text=self.titlestr;
    fightingtitle.textAlignment=NSTextAlignmentCenter;
    fightingtitle.font=[UIFont boldSystemFontOfSize:20];
    fightingtitle.textColor=[UIColor whiteColor];
    
    UIButton *backbtn=[[UIButton alloc] initWithFrame:CGRectMake(10, 27, 30, 30)];
    [navigationView addSubview:backbtn];
    [backbtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backbtn.contentMode=UIViewContentModeScaleAspectFit;
    [backbtn addTarget:self action:@selector(backbtnClick) forControlEvents:UIControlEventTouchUpInside];
  
    [self initWebView];
    
    [self setNavbackbtn];
    
    NSString *js_fit_code = [NSString stringWithFormat:@"var meta = document.createElement('meta');"
                             "meta.name = 'viewport';"
                             "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes';"
                             "document.getElementsByTagName('head')[0].appendChild(meta);"];
                             
    [_webView stringByEvaluatingJavaScriptFromString:js_fit_code];               

    
}

- (void)webViewDidFinishLoad:(UIWebView *)theWebView
{
    [self Navrightbtnsettitle:@"关闭"];
    CGSize contentSize = theWebView.scrollView.contentSize;
    CGSize viewSize = self.view.bounds.size;
    
    float rw = viewSize.width / contentSize.width;
    
    theWebView.scrollView.minimumZoomScale = rw;
    theWebView.scrollView.maximumZoomScale = rw;
    theWebView.scrollView.zoomScale = rw;
}

-(void)backbtnClick{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)viewWillAppear:(BOOL)animated{




}
-(void)initWebView{
    if (_pathstr==nil) {
        _pathstr=@" ";
    }
    
    NSURL *url = [[NSURL alloc]initWithString:_pathstr];

    _webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight)];
    _webView.delegate=self;
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    double delayInSeconds = 8;
//    [self showWaitView:@"正在加载..."];
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds*NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ //8秒后不管是否加载完成，自动消失加载框
////        [self hideWaitView];
//    });
    [self showLoading:@"正在加载..."];
}



//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    if([self.navigationItem.rightBarButtonItems count]==0 && webView.canGoBack){
////        self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"关闭  " style:UIBarButtonItemStylePlain target:self action:@selector(closeAction)];
////        self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
//        [self Navrightbtnsettitle:@"关闭"];
//    }
//    
////    [self hideWaitView];
//}

@end
