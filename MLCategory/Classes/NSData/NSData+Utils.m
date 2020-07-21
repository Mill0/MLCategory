//
//  NSData+Utils.m
//

#import "NSData+Utils.h"

@implementation NSData (Utils)

/**
 Data转16进制字符串
 */
- (NSString *)toHexString{
    const unsigned char *dataBuffer = (const unsigned char*)[self bytes];
    if(!dataBuffer){
        return nil;
    }
    NSUInteger dataLength = [self length];
    NSMutableString* hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    for(int i = 0; i < dataLength; i++){
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    }
    NSString* result = [NSString stringWithString:hexString];
    return result;
}

/**
 Data转string
 */
- (NSString *)toString{
    NSString *str = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    return str;
}

/**
 转字典
 */
- (NSDictionary *)toDictionary{
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers |NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&error];
    if (error == nil) {
        return dic;
    }
    return nil;
}

@end
