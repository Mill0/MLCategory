//
//  UIImage+Utils.h
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

+ (NSData *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)size scale:(CGFloat)scale;

/// 两张图片合成为一张图片
- (UIImage *)addImage:(UIImage *)toImage withToImageRect:(CGRect)toImageRect withRatio:(CGFloat)ratio ;

- (UIImage *)scaleToSize;
@end
