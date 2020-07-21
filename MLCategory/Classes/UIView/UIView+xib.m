//
//  UIView+xib.m
//

#import "UIView+xib.h"
#import <objc/runtime.h>

@implementation UIView (xib)

//MARK: - cornerRadius
-(void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)cornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

//MARK: -  borderWidth;
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = borderWidth;
    objc_setAssociatedObject(self, @selector(borderWidth), @(borderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)borderWidth {
      return [objc_getAssociatedObject(self, _cmd) floatValue];
}

//MARK: -  borderColor;
-(void)setBorderColor:(UIColor *)borderColor {
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    objc_setAssociatedObject(self, @selector(borderColor), borderColor, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)borderColor {
    return objc_getAssociatedObject(self, _cmd);
}

//MARK: - shadowOffset;
-(void)setShadowOffset:(CGSize)shadowOffset {
    self.layer.masksToBounds = YES;
    self.layer.shadowOffset = shadowOffset;
    objc_setAssociatedObject(self, @selector(shadowOffset), @(shadowOffset), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGSize)shadowOffset{
      return [objc_getAssociatedObject(self, _cmd) CGSizeValue];
}

//MARK: -  shadowColor;
-(void)setShadowColor:(UIColor *)shadowColor{
    self.layer.masksToBounds = YES;
    self.layer.shadowColor = shadowColor.CGColor;
    objc_setAssociatedObject(self, @selector(shadowColor), shadowColor, OBJC_ASSOCIATION_RETAIN);
}

-(UIColor *)shadowColor{
      return objc_getAssociatedObject(self, _cmd);
}

//MARK: -  shadowRadius;
-(void)setShadowRadius:(CGFloat)shadowRadius {
    self.layer.masksToBounds = YES;
    self.layer.shadowRadius = shadowRadius;
    objc_setAssociatedObject(self, @selector(shadowRadius), @(shadowRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)shadowRadius{
      return [objc_getAssociatedObject(self, _cmd) floatValue];
}
@end
