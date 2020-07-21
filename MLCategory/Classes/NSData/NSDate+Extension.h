//
//  NSDate+Extension.h
//

#import <UIKit/UIKit.h>

@interface NSDate (Extension)

/** 返回秒 */
- (NSString *)returnSecond;

/** 返回时间格式字符串 */
- (NSString *)stringwithDateFormat:(NSString *)dateFormat;

/** 判断两日期大小 */
+ (BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;

#pragma mark - 5. 将时间戳转换成时间字符串
+ (NSString *)dateStringWithTimeTamp:(long)timeTamp;
@end
