//
//  UIView+Gradient.m
//

#import "UIView+Gradient.h"
#import "PrivateGradientView.h"
#import <objc/runtime.h>

@implementation UIView (Gradient)
- (NSString *)startPoint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setStartPoint:(NSString *)startPoint {
    objc_setAssociatedObject(self, @selector(startPoint), startPoint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)startColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setStartColor:(UIColor *)startColor {
    objc_setAssociatedObject(self, @selector(startColor), startColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)endColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEndColor:(UIColor *)endColor {
    objc_setAssociatedObject(self, @selector(endColor), endColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (void)configureGradient {
    
    if (self.startPoint.length == 0) {
        return;
    }

    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:PrivateGradientView.class]) {
            [subView removeFromSuperview];
        }
    }
    
    CALayer *gradientLayer = [self makeGradientLayer];
    gradientLayer.cornerRadius = self.layer.cornerRadius;
    gradientLayer.frame = self.bounds;
    PrivateGradientView *gradientView = [[PrivateGradientView alloc] initWithFrame:self.bounds gradientLayer:gradientLayer];
    [self insertSubview:gradientView atIndex:0];
    
}

- (CALayer*)makeGradientLayer {
    
    NSArray *colors = [self gradientColors];
    
    if (colors == nil) {
        return nil;
    }
    
    return [self makeLinearLayer:colors];
    
}

- (CAGradientLayer*)makeLinearLayer:(NSArray *)colors {
    
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.colors = colors;
    
    if ([self.startPoint isEqualToString:@"top"]) {
        layer.startPoint = CGPointMake(0.5, 0);
        layer.endPoint = CGPointMake(0.5, 1);
    } else if ([self.startPoint isEqualToString:@"topRight"]) {
        layer.startPoint = CGPointMake(1, 0);
        layer.endPoint = CGPointMake(0, 1);
    } else if ([self.startPoint isEqualToString:@"right"]) {
        layer.startPoint = CGPointMake(1, 0.5);
        layer.endPoint = CGPointMake(0, 0.5);
    } else if ([self.startPoint isEqualToString:@"bottomRight"]) {
        layer.startPoint = CGPointMake(1, 1);
        layer.endPoint = CGPointMake(0, 0);
    } else if ([self.startPoint isEqualToString:@"bottom"]) {
        layer.startPoint = CGPointMake(0.5, 1);
        layer.endPoint = CGPointMake(0.5, 0);
    } else if ([self.startPoint isEqualToString:@"bottomLeft"]) {
        layer.startPoint = CGPointMake(0, 1);
        layer.endPoint = CGPointMake(1, 0);
    } else if ([self.startPoint isEqualToString:@"left"]) {
        layer.startPoint = CGPointMake(0, 0.5);
        layer.endPoint = CGPointMake(1, 0.5);
    } else if ([self.startPoint isEqualToString:@"topLeft"]) {
        layer.startPoint = CGPointMake(0, 0);
        layer.endPoint = CGPointMake(1, 1);
    } else {
        layer.startPoint = CGPointZero;
        layer.endPoint = CGPointZero;
    }
    
    return layer;
}

- (NSArray*)gradientColors {
    
    if (self.startColor == nil || self.endColor == nil) {
        return nil;
    }
    
    return @[(__bridge id)self.startColor.CGColor, (__bridge id)self.endColor.CGColor];
    
}

@end
