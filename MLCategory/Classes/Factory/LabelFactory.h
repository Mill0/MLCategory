//
//  LabelFactory.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LabelFactory : NSObject

+ (UILabel *)labelWithText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;


@end

