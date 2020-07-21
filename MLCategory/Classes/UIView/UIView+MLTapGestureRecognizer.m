//
//  UIView+MLTapGestureRecognizer.m
//

#import "UIView+MLTapGestureRecognizer.h"
#import <objc/runtime.h>

@implementation UIView (MLTapGestureRecognizer)

- (void)addTapGestureBlock:(void (^)(id))block {
    self.block = block;
    
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tagClick)];
    [self addGestureRecognizer:tag];
    self.userInteractionEnabled = YES;
}

- (void)tagClick {
    if (self.block) {
        self.block(self);
    }
}

- (void)setBlock:(void (^)(id obj))block{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void(^)(id obj))block{
    return objc_getAssociatedObject(self, @selector(block));
}
@end
