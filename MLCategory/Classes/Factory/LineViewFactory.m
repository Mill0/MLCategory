//
//  LineViewFactory.m
//

#import "LineViewFactory.h"
#import "CoreMacros.h"

@interface BlueLineView : UIView

@end

@implementation BlueLineView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, MAIN_BLUE_COLOR.CGColor);
    CGContextFillRect(context, rect);
}

@end


@interface LineView : UIView

@end

@implementation LineView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, UIColorFromHex(0xEEEEEE).CGColor);
    CGContextFillRect(context, rect);
}

@end


@implementation LineViewFactory
+ (UIView *)lineViewEEEEEE {
    LineView *view = [[LineView alloc] init];
    return view;
}

+ (UIView *)lineBlueViewBlue {
    BlueLineView *view = [[BlueLineView alloc] init];
    return view;
}
@end
