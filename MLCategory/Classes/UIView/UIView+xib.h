//
//  UIView+xib.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (xib)
@property(assign,nonatomic) IBInspectable  CGFloat cornerRadius;

@property(assign,nonatomic) IBInspectable  CGFloat borderWidth;

@property(strong,nonatomic) IBInspectable  UIColor* borderColor;

@property(assign,nonatomic) IBInspectable  CGSize shadowOffset;

@property(strong,nonatomic) IBInspectable  UIColor* shadowColor;

@property(assign,nonatomic) IBInspectable  CGFloat shadowRadius;

@end

NS_ASSUME_NONNULL_END
