//
//  NSString+XXNumber.h
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
///高精度计算
@interface NSString (XXNumber)

///加
- (NSString *)add:(NSString *)aNumberString;
///减
- (NSString *)subtract:(NSString *)aNumberString;
///乘
- (NSString *)multiply:(NSString *)aNumberString;
///除
- (NSString *)divid:(NSString *)aNumberString;


///大于等于
- (BOOL)isBiggerThanOrEqualTo:(NSString *)aNumberString;
///大于
- (BOOL)isBiggerThan:(NSString *)aNumberString;
///等于
- (BOOL)isEqualToNumber:(NSString *)aNumberString;



///去除末尾多余的0,并保留x位小数.不四舍五入
- (NSString *)removeRedundantZerosWithMaxFractionDigits:(NSUInteger)digit;

///去除末尾多余的0,并保留x位小数.四舍五入
- (NSString *)removeRedundantZerosRoundUpWithMaxFractionDigits:(NSUInteger)digit;

///精确到小数点某一个位,不足的补零,不四舍五入
- (NSString *)formatterNumberToDigit:(NSInteger)digit;

/// 去除字符串后面多余的零
- (NSString*)deleteFloatAllZero;

/// 数量用符号表示
- (NSString *)formattrtNumberUnitWithDigit:(NSInteger)digit;
 
 - (NSString *)decimalNumberRoundingMode:(NSRoundingMode)roundModel digit:(short)digit;
@end

NS_ASSUME_NONNULL_END
