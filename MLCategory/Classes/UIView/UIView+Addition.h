//
//  UIView+Addition.h
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)

/* 为避免与第三方框架（如：Masonry框架）属性同名，属性名称都加上前缀k */

@property (nonatomic, assign) CGSize kSize;

@property (nonatomic, assign) CGPoint kOrigin;

@property (nonatomic, assign) CGFloat kWidth;

@property (nonatomic, assign) CGFloat kHeight;

@property (nonatomic, assign) CGFloat kMaxX;

@property (nonatomic, assign) CGFloat kMaxY;

@property (nonatomic, assign) CGFloat kMidX;

@property (nonatomic, assign) CGFloat kMidY;

@property (nonatomic, assign) CGFloat kCenterY;

@property (nonatomic, assign) CGFloat kCenterX;

#pragma mark - 设置部分圆角
//massory布局 [self layoutIfNeeded];//这句代码很重要，不能忘了

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;
/**
 *  设置top圆角(绝对布局)
 */
- (void)addRoundedTopCornerWithRadii:(CGSize)radii;
/**
 *  设置bottom圆角(绝对布局)
 */
- (void)addRoundedbottomCornerWithRadii:(CGSize)radii;

- (void)addTopRounded;


/// 添加阴影效果
- (void)addShadowEffect;

@end
