#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AppConfigManager.h"
#import "CommonMethod.h"
#import "CoreMacros.h"
#import "ButtonFactory.h"
#import "DigitalTextField.h"
#import "ImageViewFactory.h"
#import "LabelFactory+User.h"
#import "LabelFactory.h"
#import "LineViewFactory.h"
#import "TextFieldFactory+User.h"
#import "TextFieldFactory.h"
#import "LanguageManager.h"
#import "MLScrollView.h"
#import "NSData+Utils.h"
#import "NSDate+Extension.h"
#import "NSArray+Foundation_Log.h"
#import "NSDictionary+Utils.h"
#import "NSString+Md5.h"
#import "NSString+Utils.h"
#import "NSString+XXNumber.h"
#import "NSObject+XXRuntime.h"
#import "PlaceholderView.h"
#import "UITableView+PlaceholderExtension.h"
#import "UITableView+XXPlaceholder.h"
#import "UITableView+XXRefresh.h"
#import "UIButton+Block.h"
#import "UIButton+Extenion.h"
#import "UIButton+XXMultiTouch.h"
#import "UIColor+Extension.h"
#import "UIImage+Colorful.h"
#import "UIImage+Utils.h"
#import "UILabel+AttributeText.h"
#import "UILabel+Extension.h"
#import "UILabel+XXAddition.h"
#import "UITextView+Util.h"
#import "CALayer+Frame.h"
#import "PrivateGradientView.h"
#import "UIButton+TouchArea.h"
#import "UIView+Addition.h"
#import "UIView+Extension.h"
#import "UIView+Gradient.h"
#import "UIView+MLTapGestureRecognizer.h"
#import "UIView+MLTouchArea.h"
#import "UIView+xib.h"

FOUNDATION_EXPORT double MLCategoryVersionNumber;
FOUNDATION_EXPORT const unsigned char MLCategoryVersionString[];

