//
//  LabelFactory+User.h
//

#import "LabelFactory.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    UserDetailLabelType_Default,
    UserDetailLabelType_HighLight,
    UserDetailLabelType_Seted,
    UserDetailLabelType_Success,
    UserDetailLabelType_Checking,
} UserDetailLabelType;

@interface LabelFactory (User)
/// 放置标题的label  #333333  16  medium
/// @param title <#title description#>
+ (UILabel *)titleLabel:(NSString *)title;

/// 放置cell 左侧标题的label 颜色：#333333 字体大小: 14.5 字重(1 rugular 2 medium):1  alignment: left
/// @param title title description

+ (UILabel *)cellTitleLabel:(NSString *)title;

+ (float )cellTitleLabelWidth:(NSString *)title;

/// <#Description#>
/// @param title <#title description#>
+ (UILabel *)celldetailLabel:(NSString *)title type:(UserDetailLabelType)type;


/// 辅助 celldetailLabel 对应的颜色
/// @param type <#type description#>
+ (UIColor *)colorWithType:(UserDetailLabelType)type;

//颜色：#686868 字体大小: 13 字重(1 rugular 2 medium):1  alignment:center
+ (UILabel *)stateLabel:(NSString *)stateInfo;

//颜色：#1677FF 字体大小: 13 字重(1 rugular 2 medium):1  alignment:left numbers 0
+ (UILabel *)tipLabel:(NSString *)tips;
@end

NS_ASSUME_NONNULL_END
