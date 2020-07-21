//
//  UILabel+AttributeText.h
//

#import <UIKit/UIKit.h>

@interface UILabel (XXAddition)

/**
 设置属性
 */
- (void)xx_addAttributes:(NSDictionary<NSString *, id> *)attributes
              forText:(NSString *)text;

/**
 设置属性
 */
- (void)xx_addAttributes:(NSDictionary<NSString *, id> *)attributes
              forText:(NSString *)text
              options:(NSStringCompareOptions)options;

/**
 行间距
 */
- (void)xx_setLineSpace:(CGFloat)space;

/**
 添加下划线
 */
- (void)xx_addUnderLineForText:(NSString *)text;

/**
 获取在限定宽度下label的高度
 */
- (CGFloat)xx_labelHeightWithWidth:(CGFloat)width;

/**
 获取在限定高度下label的宽度
 */
- (CGFloat)xx_labelWidthWithHeight:(CGFloat)height;


/**
 *  计算富文本字体高度
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *  @return 富文本高度
 */
-(CGFloat)xx_getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;

/// label 涨跌文字
- (void)xx_adjustLabelTextWithCurrentPrice:(NSString *)currentPrice comparePrice:(NSString *)comparePrice digit:(NSInteger)digit;

/// label 涨跌文字 以及颜色
- (void)xx_setLabelTextAndColorWithCurrentPrice:(NSString *)currentPrice comparePrice:(NSString *)comparePrice digit:(NSInteger)digit;

/// label 涨跌背景颜色
- (void)xx_adjustLabelBackgroundColorWithCurrentPrice:(NSString *)currentPrice comparePrice:(NSString *)comparePrice digit:(NSInteger)digit;

///label 涨幅调整
- (void)xx_adjustLabelBackgroundColorWithRiserate:(NSString *)rate;

/// label 涨幅文字颜色调整
- (void)xx_adjustLabelColorWithRiserate:(NSString *)rate;

///
- (void)xx_adjustLabelColorWithValue:(NSString *)value;

/// label 涨跌 文字颜色
- (void)xx_adjustLabelTextColorWithText:(NSString *)text;

/// label 浮动盈亏显示
- (void)xx_adjustTotalProfitText:(NSString *)text;


// 根据涨跌显示价格文字和颜色
- (void)xx_adjustLabelColorWithPrice:(NSString *)price Riserate:(NSString *)rate;

/// 交易界面涨跌带背景颜色
- (void)xx_adjustLabelTranBackgroundColorWithRiserate:(NSString *)rate;
@end
