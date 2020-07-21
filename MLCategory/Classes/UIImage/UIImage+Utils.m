//
//  UIImage+Utils.m
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (NSData *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)size scale:(CGFloat)scale
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* _newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(_newImage, scale);
}

/// 两张图片合成为一张图片
- (UIImage *)addImage:(UIImage *)toImage withToImageRect:(CGRect)toImageRect withRatio:(CGFloat)ratio{
    CGSize size = CGSizeMake(self.size.width * ratio, self.size.height * ratio);
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    [toImage drawInRect:CGRectMake(toImageRect.origin.x * ratio, toImageRect.origin.y * ratio, toImageRect.size.width * ratio, toImageRect.size.height * ratio)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

- (UIImage *)scaleToSize{
    CGSize size = CGSizeMake(self.size.width * 3, self.size.height * 3);
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}
@end
