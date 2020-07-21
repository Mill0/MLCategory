//
//  UIButton+EnlargeTouchArea.m
//

#import "UIButton+TouchArea.h"
#import <objc/runtime.h>


static char touchAreaEdgeNameKey;

@implementation UIButton (TouchArea)

- (void)setButtonTourAreaEdge:(UIEdgeInsets)edge {
    objc_setAssociatedObject(self, &touchAreaEdgeNameKey, [NSValue valueWithUIEdgeInsets:edge], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)setButtonTourAreaMinHeight:(CGFloat)height {
    if (height <= self.frame.size.height) {
         return;
    }
    
    // 必须处理frame问题
    [self setNeedsLayout];
    CGFloat topBottomMargin = (height - self.frame.size.height)/2;
    [self setButtonTourAreaEdge:UIEdgeInsetsMake(topBottomMargin, 0, topBottomMargin, 0)];
}
 
- (CGRect) enlargedRect {
    UIEdgeInsets edge = [objc_getAssociatedObject(self, &touchAreaEdgeNameKey) UIEdgeInsetsValue];
    
    return CGRectMake(self.bounds.origin.x - edge.left,
                          self.bounds.origin.y - edge.top,
                          self.bounds.size.width + edge.left + edge.right,
                          self.bounds.size.height + edge.top + edge.bottom);
}
 
- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
