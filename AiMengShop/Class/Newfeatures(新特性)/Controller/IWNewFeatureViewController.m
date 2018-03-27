//
//  IWNewFeatureViewController.m
//  BossChe
//
//  Created by Macintosh HD on 15/9/25.
//  Copyright © 2015年 MJ. All rights reserved.
//

#import "IWNewFeatureViewController.h"
#import "IWBossCarTool.h"
#import "IWPageControl.h"
#import "IWTabBarViewController.h"
#define IWNewFeatureViewImageCount 3

@interface IWNewFeatureViewController ()<UIScrollViewDelegate>
@property(nonatomic ,weak)  UIPageControl *pageControl;
@end

@implementation IWNewFeatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollview];
    [self setupPageControl];
}

-(void)setupPageControl{
   pageControl=[[UIPageControl alloc] init];
    pageControl.numberOfPages=IWNewFeatureViewImageCount;
    CGFloat centerX=self.view.frame.size.width*0.5;
    CGFloat centerY=self.view.frame.size.height-30;
    pageControl.userInteractionEnabled=NO;
    pageControl.center=CGPointMake(centerX, centerY);
    pageControl.bounds=CGRectMake(0, 40, 100, 30);
    [self.view addSubview:pageControl];
    self.pageControl=pageControl;
//    self.pageControl.hidden=YES;
    //设置原点的颜色
    //    pageControl.currentPageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageWithName:@"new_feature_pagecontrol_checked_point"]];
    //    pageControl.pageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageWithName:@"new_feature_pagecontrol_point"]];
    pageControl.currentPageIndicatorTintColor=IWColor(255, 255, 255);
    pageControl.pageIndicatorTintColor=[UIColor colorWithHexString:@"#c4c4c4"];
    
    
    
}
-(void)setupScrollview{
    
    
    //添加一个背景
    //    UIImageView *bg=[[UIImageView alloc] init];
    //    bg.image=[UIImage imageWithName:@"new_feature_background"];
    //    bg.frame=self.view.bounds;
    //    [self.view addSubview:bg];
    //self.view.backgroundColor=QFColor(246, 246, 246);
    
    //添加uiscrollview
    UIScrollView *scrollowView=[[UIScrollView alloc] init];
    scrollowView.delegate=self;
    scrollowView.frame=self.view.bounds;
    [self.view addSubview:scrollowView];
    //添加图片
    CGFloat imageW=scrollowView.frame.size.width;
    CGFloat imageH=scrollowView.frame.size.height;
    for (int index=0; index<IWNewFeatureViewImageCount; index++) {
        UIImageView *imageView=[[UIImageView alloc] init];
        NSString *name=[NSString stringWithFormat:@"new_feature_%d",index+1];
        imageView.image=[UIImage imageWithName:name];
        CGFloat imageX=index*imageW;
        imageView.frame=CGRectMake(imageX, 0, imageW, imageH);
        [scrollowView addSubview:imageView];
//        if (index==IWNewFeatureViewImageCount-2) {
//            pageControl.hidden=YES;
//        }
        
        if (index ==IWNewFeatureViewImageCount-1) {
//            pageControl.hidden=YES;
            [self setupImageView:imageView];
            
        }
        
        
    }
    //设置滚动的内容尺寸
    scrollowView.contentSize=CGSizeMake(imageW*IWNewFeatureViewImageCount, 0);
    scrollowView.showsHorizontalScrollIndicator=NO;
    scrollowView.pagingEnabled=YES;
    scrollowView.bounces=NO;
}
/**
 *  添加内容到最后一张图片中去
 *
 *  @param imageView <#imageView description#>
 */
-(void)setupImageView:(UIImageView*)imageView{
    pageControl.hidden=YES;
    //让imageView可以和用户进行交互
    imageView.userInteractionEnabled=YES;
    //添加开始按钮
    UIButton *startButton=[[UIButton alloc] init];

    [startButton setImage:[UIImage imageNamed:@"newstart"] forState:0];
    
//    [startButton setTitle:@"立即体验" forState:UIControlStateNormal];
//    [startButton setTitleColor:[UIColor colorWithHexString:@"#ff8549"] forState:UIControlStateNormal];
//    startButton.layer.cornerRadius=8;
//    startButton.layer.masksToBounds=YES;
//    startButton.layer.borderWidth=1;
//    startButton.layer.borderColor=[UIColor colorWithHexString:@"#ff8549"].CGColor;
//    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
//    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    //设置frame
    CGFloat centerX=imageView.frame.size.width*0.5;
    CGFloat centerY=imageView.frame.size.height*0.6;

    startButton.frame=CGRectMake(self.view.width/2-100, self.view.bottom-80, 200, 50);
  //  [startButton setTitle:@"开始" forState:UIControlStateNormal];
//    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:startButton];
    //添加checkBox
    UIButton *checkbox=[[UIButton alloc] init];
    checkbox.selected=YES;
  //  [checkbox setTitle:@"分享给大家" forState:UIControlStateNormal];
//    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
//    [checkbox setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    //checkbox.bounds=CGRectMake(0, 0, 200, 50);
    CGFloat shareCenterX=centerX;
    CGFloat shareCenterY=imageView.frame.size.height*0.5;
    checkbox.center=CGPointMake(shareCenterX, shareCenterY);
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkbox.titleLabel.font=[UIFont systemFontOfSize:15];
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    //image 右边间距为10
    checkbox.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 10);
    //checkbox.titleEdgeInsets
    //button
    // checkbox.contentEdgeInsets
    
    
    [imageView addSubview:checkbox];
    
    
    
}

-(void)checkboxClick:(UIButton*)checkbox{
    
    checkbox.selected=!checkbox.isSelected;
}
-(void)start{
    
    //显示状态栏
    [UIApplication sharedApplication].statusBarHidden=NO;
    
NSString *loginToken=[NSString stringWithFormat:@"%@",[CommonCore queryLOginUsertoken]];
    
    IWLog(@"loginToken==%lu",(unsigned long)loginToken.length);
    //切换窗口的根控制器
    if (loginToken.length>0) {
        self.view.window.rootViewController=[[IWTabBarViewController alloc] init];
        
    }else{
//          self.view.window.rootViewController=[[ZWLoginController alloc] init];

    }

    
    
    
}


/**
 *  只要scrollView滚动，就会调动
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetX=scrollView.contentOffset.x;
    //求出页码
    double  page=offsetX/scrollView.frame.size.width;
    int pageInt=(int)(page+0.5);
    self.pageControl.currentPage=pageInt;
    if (page==3) {
        pageControl.hidden=YES;
    }else{
       pageControl.hidden=NO;
    }
    
    
}



@end
