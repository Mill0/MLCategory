//
//  LabelFactory.m
//

#import "LabelFactory.h"


@implementation LabelFactory


+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    
    return label;
    
}

@end
