//
//  PrivateGradientView.m
//

#import "PrivateGradientView.h"

@implementation PrivateGradientView
- (instancetype)initWithFrame:(CGRect)frame gradientLayer:(CALayer*)gradientLayer {
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer insertSublayer:gradientLayer atIndex:0];
        self.userInteractionEnabled = NO;
    }
    return self;
}

@end
