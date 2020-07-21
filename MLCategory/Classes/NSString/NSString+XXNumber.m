//
//  NSString+XXNumber.m
//

#import "NSString+XXNumber.h"
#import "NSString+Utils.h"
#import "CoreMacros.h"

@implementation NSString (XXNumber)

#pragma mark - 加减乘除 -
- (NSString *)add:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:[self stringByReplacingOccurrencesOfString:@"," withString:@""]];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString.length == 0 ? @"0" : aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberByAdding:numberB];
    return result.stringValue;
}

- (NSString *)subtract:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:[self stringByReplacingOccurrencesOfString:@"," withString:@""]];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString.length == 0 ? @"0" : aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberBySubtracting:numberB];
    return result.stringValue;
}

- (NSString *)multiply:(NSString *)aNumberString{
    
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:[self stringByReplacingOccurrencesOfString:@"," withString:@""]];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString.length == 0 ? @"0" : aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberByMultiplyingBy:numberB];
    return result.stringValue;
}

- (NSString *)divid:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:[self stringByReplacingOccurrencesOfString:@"," withString:@""]];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString.length == 0 ? @"0" : aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return nil;
    }
    if (numberB.floatValue == 0) {
        return nil;
    }
    NSDecimalNumber *result = [numberA decimalNumberByDividingBy:numberB];
    return result.stringValue;
}

#pragma mark - 比较 -
///大于等于
- (BOOL)isBiggerThanOrEqualTo:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return NO;
    }
    NSComparisonResult result = [numberA compare:numberB];
    /*
     NSOrderedAscending的意思是：左边的操作对象小于右边的对象。
     NSOrderedDescending的意思是：左边的操作对象大于右边的对象。
     */
    if (result == NSOrderedSame || result == NSOrderedDescending) {
        return YES;
    }
    else{
        return NO;
    }
}

///大于
- (BOOL)isBiggerThan:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return NO;
    }
    NSComparisonResult result = [numberA compare:numberB];
    if (result == NSOrderedDescending) {
        return YES;
    }
    else{
        return NO;
    }
}

///等于
- (BOOL)isEqualToNumber:(NSString *)aNumberString{
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:aNumberString];
    if ([NSString safeCheck:numberA anotherNumber:numberB] == NO) {
        return NO;
    }
    NSComparisonResult result = [numberA compare:numberB];
    if (result == NSOrderedSame) {
        return YES;
    }
    else{
        return NO;
    }
}

#pragma mark - 格式化 -
- (NSString *)removeRedundantZerosWithMaxFractionDigits:(NSUInteger)digit{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @"";
    formatter.roundingMode = NSNumberFormatterRoundFloor;
    formatter.maximumFractionDigits = digit;
    NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:self];
    NSString *str = [formatter stringFromNumber:decimal];
    return str;
}

///去除末尾多余的0,并保留x位小数.四舍五入
- (NSString *)removeRedundantZerosRoundUpWithMaxFractionDigits:(NSUInteger)digit{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @"";
    formatter.roundingMode = kCFNumberFormatterRoundHalfUp;
    formatter.maximumFractionDigits = digit;
    if (self.floatValue == 0) { return @""; }
    
    NSDecimalNumber *decimal = [NSDecimalNumber decimalNumberWithString:self];
    NSString *str = [formatter stringFromNumber:decimal];
    return str;
}

- (NSString *)formatterNumberToDigit:(NSInteger)digit{
    //小数点最后一位截取
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:digit raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal = [NSDecimalNumber decimalNumberWithString:[self returnNullStrWithNum]];
    NSDecimalNumber *roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    // 生成需要精确的小数点格式
    NSMutableString *formatterString = [NSMutableString stringWithString:@"0."];
    for (NSInteger i = 0; i < digit; ++i) {
        [formatterString appendString:@"0"];
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:formatterString];
    NSString *formatterStr = [formatter stringFromNumber:roundedOunces];
    return digit == 0 ? [formatterStr stringByReplacingOccurrencesOfString:@"." withString:@""] : formatterStr;
}



/// 去除字符串后面多余的零
- (NSString*)deleteFloatAllZero{
    if (A_IS_STR_NIL(self) || ![self containsString:@"."]) {
         return self;
    }
    
    NSArray *arrStr= [self componentsSeparatedByString:@"."];
    NSString *str = arrStr.firstObject;
    NSString *str1 = arrStr.lastObject;

    while ([str1 hasSuffix:@"0"]) {
        str1 = [str1 substringToIndex:(str1.length-1)];
    }
    return (str1.length>0) ? [NSString stringWithFormat:@"%@.%@",str,str1] : str;
}

#pragma mark - private -
+ (BOOL)safeCheck:(NSDecimalNumber *)numberA anotherNumber:(NSDecimalNumber *)numberB{
    if ([numberA.stringValue isEqualToString:@"NaN"] || [numberB.stringValue isEqualToString:@"NaN"]) {
        return NO;
    }
    return YES;
}

/// 数量用符号表示
- (NSString *)formattrtNumberUnitWithDigit:(NSInteger)digit{
    if ([self floatValue] >= 1000 && [self floatValue] < 10000) {
        return NSStringFormat(@"%@K", [[self divid:@"1000"] formatterNumberToDigit:digit]);
    }else if ([self floatValue] >= 10000 && [self floatValue] < 1000000){
        return NSStringFormat(@"%@W", [[self divid:@"10000"] formatterNumberToDigit:digit]);
    }else if ([self floatValue] >= 1000000){
        return NSStringFormat(@"%@M", [[self divid:@"1000000"] formatterNumberToDigit:digit]);
    }
    
    return [self formatterNumberToDigit:digit];
}


 - (NSString *)decimalNumberRoundingMode:(NSRoundingMode)roundModel digit:(short)digit {
     
     if (A_IS_STR_NIL(self)) {
         return self;
     }
     
     // 负数需要反过来
     if ([self doubleValue] < 0) {
         if (roundModel == NSRoundDown) {
             roundModel = NSRoundUp;
         } else {
             roundModel = NSRoundDown;
         }
     }
     
     if (digit < 0) {
         digit += 1;
     }
     NSDecimalNumber *decimalNum = [NSDecimalNumber decimalNumberWithString:self];
     NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:roundModel scale:digit raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
     NSDecimalNumber *roundedNumber = [decimalNum decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
     if (digit > 0) {
         NSString *scaleString = [NSString stringWithFormat:@"%%.%df",digit];
         return [NSString stringWithFormat:scaleString, roundedNumber.doubleValue];
     } else {
         return [NSString stringWithFormat:@"%lld",roundedNumber.longLongValue];
     }
 }
@end
