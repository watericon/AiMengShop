//
//  UIImage+MJ.h

//

#import <UIKit/UIKit.h>

@interface UIImage (MJ)
+(UIImage *)imageWithName:(NSString *)name;
/**
 *  返回一张自由拉伸的图片
 *
 *
 */
+(UIImage*)resizedImageWithName:(NSString*)name;
+(UIImage*)resizedImageWithName:(NSString*)name left:(CGFloat)left top:(CGFloat)top;
@end
