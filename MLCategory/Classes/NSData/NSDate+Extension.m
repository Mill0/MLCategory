//
//  NSDate+Extension.m
//

#import <UIKit/UIKit.h>

@implementation NSDate (Extension)

- (NSString *)stringwithDateFormat:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *destDateString = [dateFormatter stringFromDate:self];
    return destDateString;
}

/** 返回秒 */
- (NSString *)returnSecond
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"ss"];
    NSString *destDateString = [dateFormatter stringFromDate:self];
    return destDateString;
}

/** 判断两日期大小 */
+ (BOOL)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending || result == NSOrderedSame) {
        
        return YES;
    }
    return NO;
}

#pragma mark - 5. 将时间戳转换成时间字符串
+ (NSString *)dateStringWithTimeTamp:(long)timeTamp {
    NSDate * myDate=[NSDate dateWithTimeIntervalSince1970:timeTamp/1000.0];
    //设置时间格式
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    //将时间转换为字符串
    NSString *timeStr=[formatter stringFromDate:myDate];
    return timeStr;
}
@end
