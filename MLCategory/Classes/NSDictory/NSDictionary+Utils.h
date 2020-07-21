//
//  NSDictionary+Utils.h
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Utils)

- (NSString *)toJsonString;

- (NSData *)toData;
@end

NS_ASSUME_NONNULL_END
