//
//  PLUNLineField.m
//  HZH58
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PLUNLineField.h"

@implementation PLUNLineField

-(instancetype)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    if (self) {
        [self setValue:[NSNumber numberWithInt:10] forKey:@"paddingLeft"];

       

    }
    return self;

}


-(void)drawRect:(CGRect)rect{

    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, colorHex(@"e5e5e5").CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame), 1));



}
@end
