//
//  LabelFactory+User.m
//

#import "LabelFactory+User.h"
#import "Util.h"
#import "CoreMacros.h"
#import "CommonMethod.h"

@implementation LabelFactory (User)
+ (UILabel *)titleLabel:(NSString *)title {
    UILabel *label = [LabelFactory labelWithText:title font:BOLD_SYSTEM_FONT(16) color:UIColorFromHex(0x333333)];
    
    return label;
}

+ (UILabel *)cellTitleLabel:(NSString *)title {
    UILabel *label = [LabelFactory labelWithText:title font:SYSTEM_FONT(14.5) color:UIColorFromHex(0x333333)];
    
    return label;
}

+ (float)cellTitleLabelWidth:(NSString *)title {
//    return [Util caculateTextWidth:title font:SYSTEM_FONT(14.5) sizeHeight:SYSTEM_FONT(14.5).lineHeight];
    CGSize size = [CommonMethod computeTextSizeWithString:title andFontSize:SYSTEM_FONT(14.5)];
    
    return size.width;
}

+ (UILabel *)stateLabel:(NSString *)stateInfo {
    UILabel *label = [LabelFactory labelWithText:stateInfo font:SYSTEM_FONT(13) color:UIColorFromHex(0x686868)];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

+ (UIColor *)colorWithType:(UserDetailLabelType)type{
    UIColor *color;
    switch (type) {
        case UserDetailLabelType_Default:
            color = UIColorFromHex(0xB6C2CE);
            break;
        case UserDetailLabelType_HighLight:
            color = UIColorFromHex(0x4A90E2);
            break;
        case UserDetailLabelType_Seted:
            color = UIColorFromHex(0x666666);
            break;
        case UserDetailLabelType_Success:
            color = UIColorFromHex(0x00B578);
            break;
        case UserDetailLabelType_Checking:
            color = UIColorFromHex(0xF5A623);
            break;
            
        default:
            break;
    }
    return color;
}

+ (UILabel *)celldetailLabel:(NSString *)title  type:(UserDetailLabelType)type{
    UIColor *color = [self colorWithType:type];
    UILabel *label = [LabelFactory labelWithText:title font:SYSTEM_FONT(15) color:color];
    label.textAlignment = NSTextAlignmentRight;
    return label;
}

+ (UILabel *)tipLabel:(NSString *)tips {
    UILabel *label = [LabelFactory labelWithText:tips font:SYSTEM_FONT(13) color:MAIN_BLUE_COLOR];
    label.numberOfLines = 0;
    return label;
}
@end
