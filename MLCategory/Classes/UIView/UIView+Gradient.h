//
//  UIView+Gradient.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gradient)
@property (nonatomic, strong)IBInspectable UIColor *startColor;

@property (nonatomic, strong)IBInspectable UIColor *endColor;

@property (nonatomic, copy)IBInspectable NSString *startPoint;

- (void)configureGradient;
@end

NS_ASSUME_NONNULL_END
