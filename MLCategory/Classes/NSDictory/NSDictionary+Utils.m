//
//  NSDictionary+Utils.m
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)


- (NSString *)toJsonString{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSData *)toData{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return data;
}
@end
