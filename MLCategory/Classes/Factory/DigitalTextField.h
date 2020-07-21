//
//  DigitalTextField.h
//

#import <UIKit/UIKit.h>
@class DigitalTextField;
@protocol  DigitalTextFieldDelegate<NSObject>

@optional
/**
 *  监听输入的改变
 */
- (void)passWordDidChange:(DigitalTextField *)passWord;

/**
 *  监听输入的完成时
 */
- (void)passWordCompleteInput:(DigitalTextField *)passWord;

/**
 *  监听开始输入
 */
- (void)passWordBeginInput:(DigitalTextField *)passWord;


@end

@interface DigitalTextField : UIView<UIKeyInput>
@property (assign, nonatomic)  NSUInteger passWordNum;//密码的位数
@property (assign, nonatomic)  CGFloat pointRadius;//黑点的半径
@property (strong, nonatomic)  UIColor *pointColor;//黑点的颜色
@property (strong, nonatomic)  UIColor *rectColor;//边框的颜色
@property (weak, nonatomic)  id<DigitalTextFieldDelegate> delegate;
@property (strong, nonatomic, readonly) NSMutableString *text;//保存密码的字符串
- (void)clearText;
@end
