//
//  UIImage+Colorful.h
//

#import <UIKit/UIKit.h>

@interface UIImage (Colorful)

+ (UIImage *)createImageWithColor:(UIColor *)color;

+ (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)imageWithColor:(UIColor *)color;

@end
