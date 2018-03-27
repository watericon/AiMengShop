//
//  UIImage+MJ.m

//

#import "UIImage+MJ.h"

@implementation UIImage (MJ)

+(UIImage *)imageWithName:(NSString *)name{
//    if (iOS7) {
//        NSString *newName=[name stringByAppendingString:@"_os7"];
//        UIImage *image=[UIImage imageNamed:newName];
//        if (image==nil) {
//            image=[UIImage imageNamed:name];
//        }
//        return image;
//    }

    return [UIImage imageNamed:name];

}
+(UIImage*)resizedImageWithName:(NSString*)name{
//
//    UIImage *image=[self imageWithName:name];
//    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    return [self resizedImageWithName:name left:0.5 top:0.5];

}

+(UIImage*)resizedImageWithName:(NSString*)name left:(CGFloat)left top:(CGFloat)top
{
    
    UIImage *image=[self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
    
}










@end
