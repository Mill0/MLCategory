//
//  NSObject+XXRuntime.h
//  XXTableViewPlaceholderView
//

#import <Foundation/Foundation.h>

@interface NSObject (XXRuntime)

+ (void)xx_swizzleInstanceMethod:(SEL)originalSel andMethod:(SEL)swizzleSel;

@end
