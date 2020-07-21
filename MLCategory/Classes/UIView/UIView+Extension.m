//
//  UIView+Extension.m
//

#import "UIView+Extension.h"
#import <objc/runtime.h> 

@interface UIView (Extenion)

@property(nonatomic,copy)tpBlock tapBlock;
@end

@implementation UIView (Extension)
 
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)left;
{
    return CGRectGetMinX(self.frame);
}

- (void)setLeft:(CGFloat)x;
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)top;
{
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)y;
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setSize:(CGSize)size
{
//    self.width = size.width;
//    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

-(void)isYY{
    //    self.superview.clipsToBounds = YES;
    //shadowColor阴影颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    //shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOffset = CGSizeMake(0,0);
    //阴影透明度，默认0
    self.layer.shadowOpacity = 0.1;
    //阴影半径，默认3
    self.layer.shadowRadius = 8;
}

-(void)isYYTop {
    //    self.superview.clipsToBounds = YES;
    //shadowColor阴影颜色
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    //shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOffset = CGSizeMake(0,2);
    //阴影透明度，默认0
    self.layer.shadowOpacity = 0.2;
    //阴影半径，默认3
    self.layer.shadowRadius = 7;
    
}

- (void)setCornerRadius:(CGFloat)cornerRadius{
//    [self clipRectCorner:UIRectCornerAllCorners cornerRadius:cornerRadius];
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = YES;
}

- (void)setBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = YES;
}

- (void)clipRectCorner:(UIRectCorner)direction cornerRadius:(CGFloat)cornerRadius{
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:direction cornerRadii:cornerSize];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    [self.layer addSublayer:maskLayer];
    self.layer.mask = maskLayer;
}

/**
 圆角要先设置
 */
- (void)addShadow:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(float)shadowOpacity{
    //设置阴影颜色
    self.layer.shadowColor = shadowColor.CGColor;
    
    //设置阴影的偏移
    self.layer.shadowOffset = shadowOffset;
    
    //设置阴影半径
    self.layer.shadowRadius = shadowRadius;
    
    //设置阴影的透明度
    self.layer.shadowOpacity = shadowOpacity;
    
    //超出父视图部分是否显示
    self.layer.masksToBounds = NO;
}

- (void)viewShadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(ShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth{
    
    self.layer.masksToBounds = NO;//必须要等于NO否则会把阴影切割隐藏掉
    self.layer.shadowColor = shadowColor.CGColor;// 阴影颜色
    self.layer.shadowOpacity = shadowOpacity;// 阴影透明度，默认0
    self.layer.shadowOffset = CGSizeZero;//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowRadius = shadowRadius;//阴影半径，默认3
    CGRect shadowRect = CGRectZero;
    CGFloat originX,originY,sizeWith,sizeHeight;
    originX = 0;
    originY = 0;
    sizeWith = self.bounds.size.width;
    sizeHeight = self.bounds.size.height;
    
    if (shadowPathType == ShadowPathTop) {
        shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == ShadowPathBottom){
        shadowRect = CGRectMake(originY, sizeHeight-shadowPathWidth/2, sizeWith, shadowPathWidth);
    }else if (shadowPathType == ShadowPathLeft){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == ShadowPathRight){
        shadowRect = CGRectMake(sizeWith-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    }else if (shadowPathType == ShadowPathCommon){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, 2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth/2);
    }else if (shadowPathType == ShadowPathAround){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth);
    }
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = bezierPath.CGPath;//阴影路径
}

- (UIViewController*)supVC{
    for(UIView *next = self.superview; next ; next = next.superview){
        UIResponder *nextResponder = [next nextResponder];
        if([nextResponder isKindOfClass:[UIViewController class]]){ 
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

///添加渐变色 数组为CGColor
- (void)addGradientWithColors:(NSArray *)cgCollors{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = cgCollors;
    [self.layer insertSublayer:gradient atIndex:0];
}
@end
