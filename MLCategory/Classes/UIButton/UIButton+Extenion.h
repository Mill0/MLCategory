//
//  UIButton+Extenion.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extenion)

/**
 倒计时
 */
- (void)ex_countDown:(int)time;

/**
 time: 倒计时时间
 executeeColor: 倒计时进行中文字颜色
 endColor: 倒计时结束时文字颜色
 */
 - (void)ex_countDown:(int)time executeColor:(UIColor *)executeColor endColor:(UIColor *)endColor;


/**
 上部分是图片，下部分是文字
 @param space 间距
 */
- (void)ex_setUpImageAndDownLableWithSpace:(CGFloat)space;


/**
 左边是文字，右边是图片（和原来的样式翻过来）
 @param space 间距
 */
- (void)ex_setLeftTitleAndRightImageWithSpace:(CGFloat)space;


/**
 设置角标的个数（右上角）
 @param badgeValue 
 */
- (void)ex_setBadgeValue:(NSInteger)badgeValue;


- (void)aef_setImageWithUrl:(NSString *)url forState:(UIControlState)state;

- (void)aef_setImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(NSString *)place;
@end

NS_ASSUME_NONNULL_END
