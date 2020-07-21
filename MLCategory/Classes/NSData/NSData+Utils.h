//
//  NSData+Utils.h
//

#import <Foundation/Foundation.h>

@interface NSData (Utils)

/**
 Data转16进制字符串
 */
- (NSString *)toHexString;

/**
 Data转string.
 UTF8StringEncoding
 */
- (NSString *)toString;

/**
 转字典
 */
- (NSDictionary *)toDictionary;

@end


