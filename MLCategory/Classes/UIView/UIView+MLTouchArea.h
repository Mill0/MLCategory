//
//  UIView+MLTouchArea.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MLTouchArea)
- (void)setTourAreaEdge:(UIEdgeInsets)edge;

- (void)setTourAreaMinHeight:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
