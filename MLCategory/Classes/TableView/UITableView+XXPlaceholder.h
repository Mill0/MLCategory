//
//  UITableView+XXPlaceholderView.h
//  XXTableViewPlaceholderView
//

#import <UIKit/UIKit.h>
@interface UITableView (XXPlaceholder)

/** 是否开启,默认为NO */
@property (nonatomic,assign) BOOL xx_enablePlaceholderView;

/** 设置自定义占位图 */
@property (nonatomic,strong) UIView *xx_placeholderView;

@end



