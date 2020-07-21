//
//  UITextView+Util.m
//

#import "UITextView+Util.h"

@implementation UITextView (Util)

- (void)xx_setTextViewPlaceholderText:(NSString *)str andColor:(UIColor *)color{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = str;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = color;
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    placeHolderLabel.font = self.font;
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}

@end
