//
//  RkyMyControl.m
//  EasyJieApp
//
//  Created by ftt on 15/8/31.
//  Copyright (c) 2015年 easyjie. All rights reserved.
//

#import "RkyMyControl.h"

@implementation RkyMyControl

+(UIButton*)createButtonWithimageName:(NSString*)imageName bgImageName:(NSString*)bgImageName title:(NSString*)title color:(UIColor *)color {
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (bgImageName) {
        [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
        button.contentMode=UIViewContentModeScaleToFill;
        
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateDisabled];
        [button setTitleColor:color forState:UIControlStateNormal];
        
    }
    return button;
}

/*
 options:NSStringDrawingTruncatesLastVisibleLine| NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading//采用换行模式
 */



+(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font andwidth:(CGFloat)width
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 800)//限制最大的宽度和高度
                                       options: NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName: font}//传人的字体字典
                                       context:nil];
    return rect.size;
}


+(UILabel*)createLabelWithFont:(float)font Text:(NSString*)text Color:(UIColor *)color
{
    //[[UILabel appearance]setTextColor:[UIColor redColor]];
    
    UILabel*label=[[UILabel alloc]init];
    //设置字体大小
    label.font=[UIFont systemFontOfSize:font];
    label.textColor=color;
    
    //设置对齐方式
    label.textAlignment=NSTextAlignmentLeft;
    //设置行数
    label.numberOfLines=0;
    //设置折行方式  NSLineBreakByCharWrapping NSLineBreakByWordWrapping
    label.lineBreakMode=NSLineBreakByWordWrapping;
    //设置阴影的颜色
    // label.shadowColor=[UIColor yellowColor];
    //设置阴影的偏移
    // label.shadowOffset=CGSizeMake(2, 2);
    
    //设置文字
    if (text) {
        label.text=text;
    }
    return label;
    
}

@end
