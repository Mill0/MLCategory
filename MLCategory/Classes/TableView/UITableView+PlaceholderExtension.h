//
//  UITableView+PlaceholderExtension.h
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (PlaceholderExtension)

/// 默认无文字
- (void)pe_addDefaultTableViewPlaceholderView;

- (void)pe_addDefaultTableViewPlaceholderViewWithHeight:(CGFloat)height;

///
- (void)pe_addPlaceholderWithText:(NSString *)text;

- (void)pe_addDefaultTableViewPlaceholderViewWithName:(NSString *)imageName withPlaceholderText:(NSString *)placeholderText;
@end

NS_ASSUME_NONNULL_END
