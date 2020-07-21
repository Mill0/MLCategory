//
//  UIButton+XXMultiTouch.h
//

#import <UIKit/UIKit.h>

@interface UIButton (XXMultiTouch)
/** 禁止连续点击  */
@property (nonatomic,assign) BOOL xx_disableMultiTouch;
/** 允许连续点击的时间间隔.默认是1s  */
@property (nonatomic,assign) NSTimeInterval xx_timeInterval;
@end
