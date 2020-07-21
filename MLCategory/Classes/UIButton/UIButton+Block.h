//
//  UIButton+Block.h
//

#import <UIKit/UIKit.h>

@interface UIButton (Block)

@property (nonatomic, copy) void(^block)(UIButton *);

- (void)addTapBlock:(void(^)(UIButton *btn))block;

@end
