//
//  TextFiledFactory.h
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^textfieldBlock)(UITextField *tf);

@interface TextFieldFactory : NSObject

+ (UITextField *)textfield:(textfieldBlock)tf placeholderColor:(UIColor *)color placeHolder:(NSString *)placeholder;

@end

NS_ASSUME_NONNULL_END
