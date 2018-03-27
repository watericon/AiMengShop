//
//  RkyMyControl.h
//  EasyJieApp
//  文字自适应
//  Created by ftt on 15/8/31.
//  Copyright (c) 2015年 easyjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RkyMyControl : NSObject
+(UIButton*)createButtonWithimageName:(NSString*)imageName bgImageName:(NSString*)bgImageName title:(NSString*)title color:(UIColor *)color;

+(UILabel*)createLabelWithFont:(float)font Text:(NSString*)text Color:(UIColor *)color;

+(CGSize)sizeWithString:(NSString *)string font:(UIFont *)font andwidth:(CGFloat)width;

@end
