//
//  AppConfigManager.m
//

#import "AppConfigManager.h"

@implementation AppConfigManager


+ (instancetype)sharedManager{
    static AppConfigManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

- (NSTimeZone *)timeZone{
    //这个api 不会处理夏令时和冬令时
    return [NSTimeZone timeZoneForSecondsFromGMT:0];
    
    //夏令时是正确的
//    return [NSTimeZone timeZoneWithName:@"Europe/London"];
}

/**
伦敦:
当前时区：British Summer Time (BST)，UTC +1
标准时间（2020年10月25起）：Greenwich Mean Time (GMT)，UTC +0

北京:
China Standard Time (CST), UTC +8
无夏令时，全年 UTC 偏移量不变

夏零时:北京时间比伦敦早 7个小时
冬令时:早8个小时

[NSTimeZone systemTimeZone]
Asia/Shanghai (GMT+8) offset 28800
*/

@end
