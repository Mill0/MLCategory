//
//  UILabel+AttributeText.m
//

#import "UILabel+AttributeText.h"

@implementation UILabel (AttributeText)

- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs forText:(NSString *)str{
    [self addAttributes:attrs forText:str options:NSLiteralSearch];
}

- (void)addAttributes:(NSDictionary<NSString *, id> *)attrs forText:(NSString *)str options:(NSStringCompareOptions)options{
    if (str.length == 0) {
        return;
    }
    NSString *text = self.attributedText.string;
    NSMutableAttributedString *attributeText;
    if (text.length == 0) {
        if (self.text.length == 0) {
            return;
        }
        attributeText = [[NSMutableAttributedString alloc]initWithString:self.text];
    }
    else{
        attributeText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    }
    NSRange range = [text rangeOfString:str options:options];
    if(range.location == NSNotFound) return;
    [attributeText addAttributes:attrs range:range];
    self.attributedText = attributeText;
}

-(void)setLineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];

    [self addAttributes:@{NSParagraphStyleAttributeName:paragraphStyle} forText:self.text];
  
}
@end
