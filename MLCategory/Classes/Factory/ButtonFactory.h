//
//  ButtonFactory.h
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ActionBlock)(void);

typedef NS_ENUM(NSInteger,ButtonType) {
    ButtonTypeNormal = 0,
    ButtonTypeImageRight = 1,
    ButtonTypeImageTop = 2,
    ButtonTypeImageBottom = 3
};

@interface AutoWidthButton : UIView


@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSTextAlignment alignment;
@property (nonatomic, copy) ActionBlock block;



@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *maskButton;

@end


@interface BlockButton : UIButton

- (void)refreshLayout;

@end

@interface ButtonFactory : NSObject

+ (UIButton *)textButton:(NSString *)text
                   block:(ActionBlock)block;

+ (UIButton *)imageButton:(NSString *)imageName
                    block:(ActionBlock)block;

+ (BlockButton *)buttonWithTitle:(NSString *)title
                           image:(NSString *)imageName
                            type:(ButtonType)type
                             gap:(CGFloat)gap
                           block:(ActionBlock)block;


/// 根据设置的文本内容和字体大小 自动计算出宽度，实现类似于button的功能
/// @param title <#title description#>
/// @param font <#font description#>
/// @param textColor <#textColor description#>
/// @param alignment <#alignment description#>
/// @param block <#block description#>
+ (AutoWidthButton *)autoWidthButtonView:(NSString *)title
                                    font:(UIFont *)font
                               textColor:(UIColor *)textColor
                           textAlignment:(NSTextAlignment)alignment
                                  cation:(ActionBlock)block;


+ (UIButton *)buttonWithTitle:(NSString *)title font:(UIFont *)font rightImage:(UIImage *)image block:(ActionBlock)block;
@end

NS_ASSUME_NONNULL_END
