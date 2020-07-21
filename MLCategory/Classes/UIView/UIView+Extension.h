//
//  UIView+Extension.h
//

#import <UIKit/UIKit.h>
typedef void(^tpBlock)(void);

typedef NS_ENUM(NSInteger , ShadowPathType) {
    ShadowPathTop    = 1,
    ShadowPathBottom = 2,
    ShadowPathLeft   = 3,
    ShadowPathRight  = 4,
    ShadowPathCommon = 5,
    ShadowPathAround = 6,
};

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.

-(void)isYY;

-(void)isYYTop;


@property (nonatomic, strong) UIViewController *supVC;

/**
 添加圆角

 @param cornerRadius 圆角大小
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;

/**
  圆角和边框
 */
- (void)setCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

- (void)setBorderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

/**
 添加指定圆角

 @param direction 圆角位置
 @param cornerRadius 圆角大小
 */
- (void)clipRectCorner:(UIRectCorner)direction cornerRadius:(CGFloat)cornerRadius;

///添加阴影
- (void)addShadow:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(float)shadowOpacity;

///添加渐变色 数组为CGColor
- (void)addGradientWithColors:(NSArray *)cgCollors;

// 父控制器
//- (UIViewController*)supVC; 
@end
