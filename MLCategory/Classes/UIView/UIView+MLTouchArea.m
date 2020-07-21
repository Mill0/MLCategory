//
//  UIView+MLTouchArea.m
//

#import "UIView+MLTouchArea.h"
#import <objc/runtime.h>
#import "NSObject+XXRuntime.h"

static char touchVAreaEdgeNameKey;
@implementation UIView (MLTouchArea)

+ (void)load {
    [self xx_swizzleInstanceMethod:@selector(pointInside:withEvent:) andMethod:@selector(aef_pointInside:withEvent:)];
}

- (void)setTourAreaEdge:(UIEdgeInsets)edge {
    objc_setAssociatedObject(self, &touchVAreaEdgeNameKey, [NSValue valueWithUIEdgeInsets:edge], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setTourAreaMinHeight:(CGFloat)height {
    if (height <= self.frame.size.height) {
         return;
    }
    
    // 必须处理frame问题
    [self setNeedsLayout];
    CGFloat topBottomMargin = (height - self.frame.size.height)/2;
    [self setTourAreaEdge:UIEdgeInsetsMake(topBottomMargin, 0, topBottomMargin, 0)];
}
 
- (CGRect) enlargedRect {
    UIEdgeInsets edge = [objc_getAssociatedObject(self, &touchVAreaEdgeNameKey) UIEdgeInsetsValue];
    
    return CGRectMake(self.bounds.origin.x - edge.left,
                          self.bounds.origin.y - edge.top,
                          self.bounds.size.width + edge.left + edge.right,
                          self.bounds.size.height + edge.top + edge.bottom);
}
 
-(BOOL)aef_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = [self enlargedRect];
    
    if (CGRectEqualToRect(rect, self.bounds) || self.isHidden ||
        ([self isKindOfClass:UIView.class] && !((UIView *)self).userInteractionEnabled)) {
        return [self aef_pointInside:point withEvent:event];
    }
 
    return CGRectContainsPoint(rect, point);
}

@end
