//
//  TextFieldFactory+User.m
//

#import "TextFieldFactory+User.h"
#import "CoreMacros.h"

@implementation TextFieldFactory (User)

+ (UITextField *)userTextField:(NSString *)placeholder valueChangedBlock:(textfieldBlock)block {
    UITextField *textfield = [TextFieldFactory textfield:block placeholderColor:UIColorFromHex(0xB6C2CE) placeHolder:placeholder];
    textfield.font = SYSTEM_FONT(16);
    textfield.textColor = UIColorFromHex(0x666666);
    
    return textfield;
}
@end
