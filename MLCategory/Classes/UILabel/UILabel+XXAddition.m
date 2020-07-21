//
//  UILabel+AttributeText.m
//

#import "UILabel+XXAddition.h"
#import "NSString+XXNumber.h"
#import "CoreMacros.h"

@implementation UILabel (XXAddition)

- (void)xx_addAttributes:(NSDictionary<NSString *, id> *)attributes forText:(NSString *)text{
    [self xx_addAttributes:attributes forText:text options:NSLiteralSearch];
}

- (void)xx_addAttributes:(NSDictionary<NSString *, id> *)attributes forText:(NSString *)text options:(NSStringCompareOptions)options{
    if (text.length == 0 || self.text.length == 0) {
        return;
    }
    NSMutableAttributedString *attributeText;
    if (self.attributedText.string.length == 0) {
        attributeText = [[NSMutableAttributedString alloc]initWithString:self.text];
    }
    else{
        attributeText = [[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    }
    NSRange range = [attributeText.string rangeOfString:text options:options];
    if(range.location == NSNotFound) return;
    [attributeText addAttributes:attributes range:range];
    self.attributedText = attributeText;
}

-(void)xx_setLineSpace:(CGFloat)space{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];        //设置行间距
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [self xx_addAttributes:@{NSParagraphStyleAttributeName:paragraphStyle} forText:self.text];
}

/**
 添加下划线
 */
- (void)xx_addUnderLineForText:(NSString *)text{
    [self xx_addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]} forText:text];
}

- (CGFloat)xx_labelHeightWithWidth:(CGFloat)width
{
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:attribute context:nil].size;
    return size.height;
}

- (CGFloat)xx_labelWidthWithHeight:(CGFloat)height
{
    NSDictionary *attribute = @{NSFontAttributeName:self.font };
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                           options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:attribute
                                           context:nil].size;
    return size.width;
}

/**
 *  计算富文本字体高度
 *
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *
 *  @return 富文本高度
 */
-(CGFloat)xx_getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    paraStyle.alignment = NSTextAlignmentJustified;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

/// label 涨跌文字
- (void)xx_adjustLabelTextWithCurrentPrice:(NSString *)currentPrice comparePrice:(NSString *)comparePrice digit:(NSInteger)digit{
    currentPrice = [currentPrice removeRedundantZerosWithMaxFractionDigits:digit];
    comparePrice = [comparePrice removeRedundantZerosWithMaxFractionDigits:digit];
    if([currentPrice isEqualToString:comparePrice]){
        self.text = currentPrice;
        self.textColor = MAIN_STATIC_COLOR;
    }
    else if ([currentPrice isBiggerThan:comparePrice]){
        self.text = [NSString stringWithFormat:@"%@↑",currentPrice];
        self.textColor = MAIN_RISE_COLOR;
    }
    else{
        self.text = [NSString stringWithFormat:@"%@↓",currentPrice];
        self.textColor = MAIN_DOWN_COLOR;
    }
}

/// label 涨跌文字 以及颜色
- (void)xx_setLabelTextAndColorWithCurrentPrice:(NSString *)currentPrice comparePrice:(NSString *)comparePrice digit:(NSInteger)digit{
    self.text = [currentPrice removeRedundantZerosWithMaxFractionDigits:digit];
    if([currentPrice isEqualToString:comparePrice]){
        self.textColor = MAIN_STATIC_COLOR;
    }
    else if ([currentPrice isBiggerThan:comparePrice]){
        self.textColor = MAIN_RISE_COLOR;
    }
    else{
        self.textColor = MAIN_DOWN_COLOR;
    }
}

/// label 涨跌背景颜色
- (void)xx_adjustLabelBackgroundColorWithCurrentPrice:(NSString *)currentPrice comparePrice:(NSString *)comparePrice digit:(NSInteger)digit{
    if([currentPrice isEqualToString:comparePrice]){
        self.backgroundColor = MAIN_STATIC_COLOR;//FFD658
    }
    else if ([currentPrice isBiggerThan:comparePrice]){
        self.backgroundColor = MAIN_RISE_COLOR;
    }
    else{
        self.backgroundColor = MAIN_DOWN_COLOR;
    }
    self.text = [currentPrice removeRedundantZerosWithMaxFractionDigits:digit];
}

///label 涨幅调整
- (void)xx_adjustLabelBackgroundColorWithRiserate:(NSString *)rate{
    if (rate.floatValue == 0) {
        self.backgroundColor = MAIN_STATIC_COLOR;
        self.text = [NSString stringWithFormat:@"%@%%", rate];
    }
    else if (rate.floatValue > 0){
        self.backgroundColor = MAIN_RISE_COLOR;
        if ([rate containsString:@"+"]) {
            self.text = [NSString stringWithFormat:@"%@%%", rate];
        }else{
            self.text = [NSString stringWithFormat:@"+%@%%", rate];
        }
    }
    else{
        self.backgroundColor = MAIN_DOWN_COLOR;
        self.text = [NSString stringWithFormat:@"%@%%", rate];
    }
}

// 根据涨跌显示价格文字和颜色
- (void)xx_adjustLabelColorWithPrice:(NSString *)price Riserate:(NSString *)rate{
    if (rate.floatValue == 0) {
        self.textColor = MAIN_STATIC_COLOR;
    }
    else if (rate.floatValue > 0){
        self.textColor = MAIN_RISE_COLOR;
    }
    else{
        self.textColor = MAIN_DOWN_COLOR;
    }
    
    self.text = [NSString stringWithFormat:@"%@", price];
}


- (void)xx_adjustLabelColorWithRiserate:(NSString *)rate{
    if (rate.floatValue == 0) {
        self.textColor = MAIN_STATIC_COLOR;
        self.text = [NSString stringWithFormat:@"%@%%",rate];
    }
    else if (rate.floatValue > 0){
        self.textColor = MAIN_RISE_COLOR;
        self.text = [NSString stringWithFormat:@"+%@%%",rate];
    }
    else{
        self.textColor = MAIN_DOWN_COLOR;
        self.text = [NSString stringWithFormat:@"%@%%",rate];
    }
}

- (void)xx_adjustLabelColorWithValue:(NSString *)value{
    if (value.floatValue == 0) {
        self.textColor = MAIN_STATIC_COLOR;
        self.text = [NSString stringWithFormat:@"%@",value];
    }
    else if (value.floatValue > 0){
        self.textColor = MAIN_RISE_COLOR;
        self.text = [NSString stringWithFormat:@"+%@",value];
    }
    else{
        self.textColor = MAIN_DOWN_COLOR;
        self.text = [NSString stringWithFormat:@"%@",value];
    }
}

/// label 涨跌 文字颜色
- (void)xx_adjustLabelTextColorWithText:(NSString *)text{
    if (text.floatValue == 0) {
        self.textColor = MAIN_STATIC_COLOR;
    }
    else if (text.floatValue > 0){
        self.textColor = MAIN_RISE_COLOR;
    }
    else{
        self.textColor = MAIN_DOWN_COLOR;
    }
    self.text = text;
}

/// label 浮动盈亏显示
- (void)xx_adjustTotalProfitText:(NSString *)text{
    if ([text containsString:@"-"]) {
        NSString *removedSymbol = [text substringFromIndex:1];
        self.text = [NSString stringWithFormat:@"-$%@",removedSymbol];
        self.textColor = MAIN_DOWN_COLOR;
    }
    else if (text.floatValue > 0){
        self.text = [NSString stringWithFormat:@"$%@",text];
        self.textColor = MAIN_RISE_COLOR;
    }
    else{
        self.text = [NSString stringWithFormat:@"$%@",text];
        self.textColor = MAIN_STATIC_COLOR;
    }
}


/// 交易界面涨跌带背景颜色
- (void)xx_adjustLabelTranBackgroundColorWithRiserate:(NSString *)rate{
    if (rate.floatValue == 0) {
        self.textColor = MAIN_STATIC_COLOR;
        self.text = [NSString stringWithFormat:@"  %@%%  ",rate];
        self.backgroundColor = [MAIN_STATIC_COLOR colorWithAlphaComponent:0.1];
    }
    else if (rate.floatValue > 0){
        self.textColor = MAIN_RISE_COLOR;
        self.text = [NSString stringWithFormat:@"  %@%%  ",rate];
        self.backgroundColor = [MAIN_RISE_COLOR colorWithAlphaComponent:0.1];
    }
    else{
        self.textColor = MAIN_DOWN_COLOR;
        self.text = [NSString stringWithFormat:@"  %@%%  ",rate];
        self.backgroundColor = [MAIN_DOWN_COLOR colorWithAlphaComponent:0.1];
    }
}
@end
