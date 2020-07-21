//
//  UIButton+EnlargeTouchArea.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (TouchArea)

/// 设置相应范围Edge，为负数则表示缩小
- (void)setButtonTourAreaEdge:(UIEdgeInsets)edge;

/// 设置相应范围最小高度，如果小于本省则不设置
- (void)setButtonTourAreaMinHeight:(CGFloat)height;


@end

NS_ASSUME_NONNULL_END
