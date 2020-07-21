//
//  UILabel+AttributeText.h
//

#import <UIKit/UIKit.h>

@interface UILabel (AttributeText)

- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs forText:(NSString *)str;

- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs forText:(NSString *)str options:(NSStringCompareOptions)options;

-(void)setLineSpacing:(CGFloat)lineSpacing;

@end
