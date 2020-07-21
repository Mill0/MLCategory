//
//  TextFieldFactory+User.h
//

#import "TextFieldFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldFactory (User)
+ (UITextField *)userTextField:(NSString *)placeholder valueChangedBlock:(textfieldBlock)block;
@end

NS_ASSUME_NONNULL_END
