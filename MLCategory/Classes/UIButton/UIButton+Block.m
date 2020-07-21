//
//  UIButton+Block.m
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

static NSString *eventTouchBlockKey = @"EventTouchBlockKey";


@implementation UIButton (Block)

- (void)setBlock:(void(^)(UIButton*))block
{
    objc_setAssociatedObject(self, &eventTouchBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}

- (void(^)(UIButton*))block
{
    return objc_getAssociatedObject(self, &eventTouchBlockKey);
}

- (void)addTapBlock:(void(^)(UIButton*))block
{
    self.block = block;
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click:(UIButton*)btn
{
    if(self.block) {
        self.block(btn);
    }
}
@end
