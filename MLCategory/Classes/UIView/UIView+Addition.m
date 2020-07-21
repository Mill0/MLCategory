//
//  UIView+Addition.m
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

/* 尺寸大小 */
- (CGSize)kSize
{
    return self.frame.size;
}

- (void)setKSize:(CGSize)kSize
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    self.frame = CGRectMake(x, y, kSize.width, kSize.height);
}

/* 位置 */
- (CGPoint)kOrigin
{
    return self.frame.origin;
}

- (void)setKOrigin:(CGPoint)kOrigin
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.frame = CGRectMake(kOrigin.x, kOrigin.y, w, h);
}

/* 宽度 */
- (CGFloat)kWidth
{
    return self.frame.size.width;
}

- (void)setKWidth:(CGFloat)kWidth
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat h = self.frame.size.height;
    self.frame = CGRectMake(x, y, kWidth, h);
}

/* 高度 */
- (CGFloat)kHeight
{
    return self.frame.size.height;
}

- (void)setKHeight:(CGFloat)kHeight
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat w = self.frame.size.width;
    self.frame = CGRectMake(x, y, w, kHeight);
}

/* 最小x坐标 */
- (CGFloat)kMidX
{
    return self.frame.origin.x;
}

- (void)setKMidX:(CGFloat)kMidX
{
    CGFloat y = self.frame.origin.y;
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.frame = CGRectMake(kMidX, y, w, h);
}

/* 最小y坐标 */
- (CGFloat)kMidY
{
    return self.frame.origin.y;
}

- (void)setKMidY:(CGFloat)kMidY
{
    CGFloat x = self.frame.origin.x;
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.frame = CGRectMake(x, kMidY, w, h);
}

/* 最大x坐标 */
- (CGFloat)kMaxX
{
    return (self.frame.origin.x + self.frame.size.width);
}

- (void)setKMaxX:(CGFloat)kMaxX
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat w = kMaxX - x;
    CGFloat h = self.frame.size.height;
    self.frame = CGRectMake(x, y, w, h);
}

/* 最大y坐标 */
- (CGFloat)kMaxY
{
    return (self.frame.origin.y + self.frame.size.height);
}

- (void)setKMaxY:(CGFloat)kMaxY
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat w = self.frame.size.width;
    CGFloat h = kMaxY - y;
    self.frame = CGRectMake(x, y, w, h);
}

/* 中心Y坐标 */
- (CGFloat)kCenterY
{
    return (self.frame.origin.y + self.frame.size.height/2);
}

- (void)setKCenterY:(CGFloat)kCenterY
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    CGFloat x = self.frame.origin.x;
    CGFloat y = kCenterY - h/2;
    self.frame = CGRectMake(x, y, w, h);
}

/* 中心X坐标 */
- (CGFloat)kCenterX
{
    return (self.frame.origin.x + self.frame.size.width/2);
}

- (void)setKCenterX:(CGFloat)kCenterX
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    CGFloat x = kCenterX - w/2;
    CGFloat y = self.frame.origin.y;
    self.frame = CGRectMake(x, y, w, h);
}


#pragma mark - 设置部分圆角
/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}

- (void)addRoundedTopCornerWithRadii:(CGSize)radii {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerTopRight | UIRectCornerTopLeft) cornerRadii:radii];
    CAShapeLayer* layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
    
    //    CAShapeLayer *boardLayer = [[CAShapeLayer alloc] init];
    //    boardLayer.frame = self.bounds;
    //    boardLayer.path = path.CGPath;
    //    boardLayer.lineWidth = 0.01;
    //    boardLayer.strokeColor = [UIColor clearColor].CGColor;
    //    boardLayer.fillColor = [UIColor clearColor].CGColor;
    //
    //    NSArray *layers = self.layer.sublayers;
    //    CALayer *subLayer = layers.lastObject;
    //    if (![subLayer isKindOfClass:[CAShapeLayer class]]) {
    //        [subLayer removeFromSuperlayer];
    //    }
    //    [self.layer addSublayer:boardLayer];
}
- (void)addRoundedbottomCornerWithRadii:(CGSize)radii {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:radii];
    CAShapeLayer* layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

- (void)addTopRounded {
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect bounds = CGRectInset(self.bounds, 0, 0);
    CGFloat cornerRadius = 8.f;
    
    CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
    CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
    CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    
    layer.path = pathRef;
    CFRelease(pathRef);
    layer.fillColor = [UIColor whiteColor].CGColor;
    
    UIView *testView = [[UIView alloc] initWithFrame:bounds];
    [testView.layer insertSublayer:layer atIndex:0];
    testView.backgroundColor = UIColor.clearColor;
    //    cell.backgroundView = testView;
}

/// 添加阴影效果
- (void)addShadowEffect{
    self.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.layer.cornerRadius = 3;
    self.layer.shadowColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:0.5].CGColor;
    self.layer.shadowOffset = CGSizeMake(1,1);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 8.5;
}

@end
