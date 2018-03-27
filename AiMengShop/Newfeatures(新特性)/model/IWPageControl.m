//
//  IWPageControl.m
//  BossChe
//
//  Created by Macintosh HD on 15/9/25.
//  Copyright © 2015年 MJ. All rights reserved.
//

#import "IWPageControl.h"

@implementation IWPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setNumberOfPages:(NSInteger)numberOfPages{
    
    _numberOfPages=numberOfPages;
    
}

@end
