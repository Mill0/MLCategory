//
//  UIButton+XXMultiTouch.m
//

#import "UIButton+XXMultiTouch.h"
#import "NSObject+XXRuntime.h"
#import <objc/runtime.h>
#define defaultInterval 1
@interface UIButton()
/** 是否忽略此时的事件 */
@property (nonatomic, assign) BOOL isIgnoreEvent;
@end

@implementation UIButton (XXMultiTouch)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self xx_swizzleInstanceMethod:@selector(sendAction:to:forEvent:) andMethod:@selector(mySendAction:to:forEvent:)];
    });
    
}

- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    if (self.xx_disableMultiTouch == NO) {
        [self mySendAction:action to:target forEvent:event];
        return;
    }
    
    if ([self isKindOfClass:[UIButton class]]) {
        self.xx_timeInterval = self.xx_timeInterval == 0 ? defaultInterval : self.xx_timeInterval;
        if (self.isIgnoreEvent) {
            return;
        }
        else if (self.xx_timeInterval > 0){
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.xx_timeInterval];
        }
    }
    self.isIgnoreEvent = YES;
    [self mySendAction:action to:target forEvent:event];
}

- (void)resetState{
    [self setIsIgnoreEvent:NO];
}

#pragma mark - Setter && Getter -
- (void)setXx_disableMultiTouch:(BOOL)xx_disableMultiTouch{
    objc_setAssociatedObject(self, @selector(xx_disableMultiTouch), @(xx_disableMultiTouch), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)xx_disableMultiTouch{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setXx_timeInterval:(NSTimeInterval)xx_timeInterval{
    objc_setAssociatedObject(self, @selector(xx_timeInterval), @(xx_timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)xx_timeInterval{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent{
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
