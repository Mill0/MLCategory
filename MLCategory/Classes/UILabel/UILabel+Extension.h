//
//  UILabel+Extension.h
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

// 段落间距
- (void)ex_setAttributedParagraphStyleText:(NSString *)text;

- (void)ex_setAttributedParagraphStyleText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;

/// 添加缩放动画
- (void)ml_addScaleAnimation;
@end
