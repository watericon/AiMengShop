//
//  IWWebViewController.h
//  minshengbank
//
//  Created by 王 on 16/5/10.
//  Copyright © 2016年 王. All rights reserved.
//

#import "BaseViewController.h"

@interface IWWebViewController : BaseViewController
@property(nonatomic ,strong)NSString *pathstr;
@property(nonatomic ,strong)NSString *titlestr;
@property(nonatomic,strong)UIWebView *webView;
@end
