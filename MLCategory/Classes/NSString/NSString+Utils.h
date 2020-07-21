//
//  NSString+Utils.h
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

/**
 转Data.
 NSUTF8StringEncoding
 */
- (NSData *)toData;


/**
 转16进制data
 */
-(NSData*)toHexData;

/**
 复制文本到剪贴板
 */
- (void)copyToPasteboard;

/**
 转字典
 */
- (NSDictionary *)toDictionary;

/**
 时间戳转时间
 */
- (NSString *)timeFromTimeStamp;

/**
 时间戳转时间
 */
- (NSString *)timeFromTimeMMStamp;

/**
时间戳转时间 年月日时分秒
*/
- (NSString *)yearMonthDayFromTimeStamp;

/**
 时间戳转时间 年月日
 */
- (NSString *)yMonthDayFromTimeStamp;

/** 字符串返回时间 */
- (NSDate *)stringWithDate;

/**
 移除0x
 */
- (NSString *)remove0x;

/**
获取当前天
*/
+ (NSString *)getCurrentDay;

/**
 *8-16位字符，包含字母、数字、符号中至少2种
 */
- (BOOL)judgePasswordFormat;

/**
 *  判断输入字符是否都为字母
 *  @return 如果字符串包含非字母，则返回NO，反之返回YES
 */
- (BOOL)isAllEnglish;

/**
 *  判断输入字符是否都为数字
 *  @return 如果字符串包含非数字，则返回NO，反之返回YES
 */
- (BOOL)isAllInterger;

/**
 *  判断输入字符是否都为字母或数字
 *  @return 如果字符串包含非字母、数字，则返回NO，反之返回YES
 */
- (BOOL)isAllEnglishOrInterger;

// 随机字符串
+ (NSString *)getRandomStr:(NSInteger)length;

- (BOOL)isNull;

// 空字符转换
- (NSString *)returnNullStr;

// 空字符转换字符串0
- (NSString *)returnNullStrWithNum;

/**
 返回涨幅百分百
 */
- (NSString *)returnRangeAbility;

// 隐藏手机号或者邮箱中间数字
- (NSString *)phoneHideMiddle;


/**
 *  计算富文本字体高度
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *  @return 富文本高度
 */
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;


/// 是否为Float类型
- (BOOL)isPureFloat;


/// 在一个数字字符串中插入一个字符串
/// @param insetStr 需要插入的字符串
/// @param space 相隔的位数
- (NSString *)insetByString:(NSString *)insetStr space:(NSUInteger)space;

/// 字符串转金钱格式
- (NSString *)stringFormatterDecimalStyle;
@end


