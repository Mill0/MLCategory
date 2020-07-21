//
//  UILabel+Extension.m
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (void)ex_setAttributedParagraphStyleText:(NSString *)text{
    if (text == nil) { return; }
    [self ex_setAttributedParagraphStyleText:text lineSpacing:5];
}

- (void)ex_setAttributedParagraphStyleText:(NSString *)text lineSpacing:(CGFloat)lineSpacing{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    self.attributedText = attributedText;
}

/// 添加缩放动画
- (void)ml_addScaleAnimation{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 1;// 动画时间
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];
    animation.values = values;
    [self.layer addAnimation:animation forKey:nil];
}
@end
