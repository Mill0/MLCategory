//
//  UIColor+Extension.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

/// 16进制颜色(html颜色值)字符串转为UIColor
+ (UIColor *)colorWithHexString:(NSString *)color;

@end

NS_ASSUME_NONNULL_END
