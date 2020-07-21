//
//  UIView+MLTapGestureRecognizer.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MLTapGestureRecognizer)

@property (nonatomic, copy) void(^block)(id obj);

- (void)addTapGestureBlock:(void(^)(id obj))block;

@end

NS_ASSUME_NONNULL_END
