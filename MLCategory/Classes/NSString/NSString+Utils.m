//
//  NSString+Utils.m
//

#import "NSString+Utils.h"
#import "NSData+Utils.h"
#import "AppConfigManager.h"
#import "CoreMacros.h"

@implementation NSString (Utils)

- (NSData *)toData{
    NSData *data =[self dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

-(NSData*)toHexData{
    if (!self || [self length] == 0) {
        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([self length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [self length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [self substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}


/**
 复制文本到剪贴板
 */
- (void)copyToPasteboard{
    if (self.length == 0) {
        return;
    }
    UIPasteboard *psd = [UIPasteboard generalPasteboard];
    psd.string = self;
}

/**
 转字典
 */
- (NSDictionary *)toDictionary{
    NSData *data = [self toData];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers |NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&error];
    if (error == nil) {
        return dic;
    }
    return nil;
}

/**
 时间戳转时间
 */
- (NSString *)timeFromTimeStamp{
    NSTimeInterval interval    =[self doubleValue] ;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}

/**
 时间戳转时间
 */
- (NSString *)timeFromTimeMMStamp{
    NSTimeInterval interval  = [self doubleValue] ;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm MM/dd"];
    NSString *dateString = [formatter stringFromDate: date];
    return dateString;
}

/**
 时间戳转时间 年月日时分秒
 */
- (NSString *)yearMonthDayFromTimeStamp{
    NSTimeInterval interval    =[self doubleValue] ;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}

/**
 时间戳转时间 年月日
 */
- (NSString *)yMonthDayFromTimeStamp{
    NSTimeInterval interval    =[self doubleValue] ;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    //    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}

/** 字符串返回时间 */
- (NSDate *)stringWithDate
{
    if (self == nil)
        return nil;
    
    NSTimeInterval interval = [self doubleValue] ;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return date;
}

/**
 移除0x
 */
- (NSString *)remove0x{
    if ([self hasPrefix:@"0x"]) {
        NSMutableString *mString = [[NSMutableString alloc]initWithString:self];
        [mString deleteCharactersInRange:[mString rangeOfString:@"0x"]];
        return mString;
    }
    else{
        return self;
    }
}

/**
 获取当前天
 */
+ (NSString *)getCurrentDay{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    [formatter setTimeZone:[AppConfigManager sharedManager].timeZone];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *8-16位字符，包含字母、数字、符号中至少2种
 */
- (BOOL)judgePasswordFormat{
    NSString *pattern = @"^(?=.*[a-zA-Z0-9].*)(?=.*[a-zA-Z\\W].*)(?=.*[0-9\\W].*).{8,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**
 *  判断输入字符是否都为字母
 *  @return 如果字符串包含非字母，则返回NO，反之返回YES
 */
- (BOOL)isAllEnglish{
    NSInteger length = [self length];
    char c;
    for (int i = 0; i < length; i++) {
        c = [self characterAtIndex:i];
        if((c >= 'a' && c <= 'z') || (c >='A' && c <= 'Z')){
            continue;
        }else{
            return NO;
        }
    }
    return YES;
}

/**
 *  判断输入字符是否都为数字
 *  @return 如果字符串包含非数字，则返回NO，反之返回YES
 */
- (BOOL)isAllInterger{
    NSInteger length = [self length];
    char c;
    for (int i = 0; i < length; i++) {
        c = [self characterAtIndex:i];
        if(c >= '0' && c <= '9'){
            continue;
        }else{
            return NO;
        }
    }
    return YES;
}

/**
 *  判断输入字符是否都为字母或数字
 *  @return 如果字符串包含非字母、数字，则返回NO，反之返回YES
 */
- (BOOL)isAllEnglishOrInterger{
    NSInteger length = [self length];
    char c;
    for (int i = 0; i < length; i++) {
        c = [self characterAtIndex:i];
        if((c >= 'a' && c <= 'z') || (c >='A' && c <= 'Z') || (c >= '0' && c <= '9')){
            continue;
        }else{
            return NO;
        }
    }
    return YES;
}

+ (NSString *)getRandomStr:(NSInteger)length{
    char data[length];
    for (int x=0; x<length; data[x++] = (char)('A' + (arc4random_uniform(26))));
    NSString *randomStr = [[NSString alloc] initWithBytes:data length:length encoding:NSUTF8StringEncoding];
    NSString *string = [NSString stringWithFormat:@"%@",randomStr];
    return string;
}

- (BOOL)isNull{
    if (self.length == 0 || [self isEqualToString:@"(null)"] || self == nil) {
        return YES;
    }
    return NO;
}

// 空字符转换
- (NSString *)returnNullStr{
    if (self.length == 0 || [self isEqualToString:@"(null)"] || self == nil) {
        return @"";
    }
    return self;
}

// 空字符转换字符串0
- (NSString *)returnNullStrWithNum{
    if (self.length == 0 || [self isEqualToString:@"(null)"] || self == nil || [self isEqualToString:@"nan"] || [self isEqualToString:@"<null>"]){
        return @"0";
    }
    return self;
}

/**
 返回涨幅百分百
 */
- (NSString *)returnRangeAbility{
    if (self.floatValue == 0) {
        return [NSString stringWithFormat:@"%@%%", self];
    }
    else if (self.floatValue > 0){
        return [NSString stringWithFormat:@"+%@%%", self];
    }
    else{
        return [NSString stringWithFormat:@"%@%%", self];
    }
}

// 隐藏手机号或者邮箱中间数字
- (NSString *)phoneHideMiddle{
    if ([self containsString:@"@"]) {// 邮箱  123@qq.com
        NSArray *list = [[self returnNullStr] componentsSeparatedByString:@"@"];
        NSString *numberStr = list.firstObject;
        NSString *lastStr = list.lastObject;
        if (numberStr.length < 6) {
            NSString *numberString = [NSString stringWithFormat:@"%@@%@", numberStr, lastStr];
            return numberString;
        }
        
        NSString *numberString = [NSString stringWithFormat:@"%@*****%@@%@", [numberStr substringToIndex:3], [numberStr substringFromIndex:numberStr.length - 3], lastStr];
        return numberString;
    }
    
    
    if (self.length < 6) {
        return [self returnNullStr];
    }else{
        NSString *numberString = [NSString stringWithFormat:@"%@*****%@", [self substringToIndex:3], [self substringFromIndex:self.length - 3]];
        return numberString;
    }
}

/**
 *  计算富文本字体高度
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *  @return 富文本高度
 */
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    paraStyle.alignment = NSTextAlignmentJustified;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
    };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

- (BOOL)isPureFloat {
    float val;
    NSScanner* scan = [NSScanner scannerWithString:self];
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (NSString *)insetByString:(NSString *)insetStr space:(NSUInteger)space {
    if (A_IS_STR_NIL(self)) {
        return @"";
    }
    
    NSUInteger location = self.length;
    if ([self containsString:@"."]) {
        location = [self rangeOfString:@"."].location;
    }
    
    NSMutableString *value = [NSMutableString stringWithString:self];
    while (location > space) {
        location -= space;
        [value insertString:insetStr atIndex:location];
        
    }
    return value.copy;
}

/// 字符串转金钱格式
- (NSString *)stringFormatterDecimalStyle{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *decimalstr = [formatter stringFromNumber:[formatter numberFromString:self]];
    return decimalstr;
}
@end
