//
//  NSObject+XXRuntime.m
//  XXTableViewPlaceholderView
//

#import "NSObject+XXRuntime.h"
#import <objc/runtime.h>
@implementation NSObject (XXRuntime)

+ (void)xx_swizzleInstanceMethod:(SEL)originalSel andMethod:(SEL)swizzleSel{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method swizzleMethod = class_getInstanceMethod(class, swizzleSel);
    BOOL isSuccess = class_addMethod(class, originalSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (isSuccess) {
        class_replaceMethod(class, swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
}

@end
