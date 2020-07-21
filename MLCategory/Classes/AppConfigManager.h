//
//  AppConfigManager.h
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppConfigManager : NSObject

+ (instancetype)sharedManager;

///获取 伦敦时区
- (NSTimeZone *)timeZone;

@end

NS_ASSUME_NONNULL_END
