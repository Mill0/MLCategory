//
//  CoreMacros.h
//  DeveloperTool
//

#ifndef CoreMacros_h
#define CoreMacros_h

/// 颜色
#define UIColorFromHex(hexString)                                               \
[UIColor colorWithRed:((float) ((hexString & 0xFF0000) >> 16)) / 255.0      \
green:((float) ((hexString & 0x00FF00) >> 8)) / 255.0       \
blue:((float) ((hexString & 0x0000FF) >> 0)) / 255.0       \
alpha:1.0]

#define UIColorFromRGBA(hexString,a)                                       \
[UIColor colorWithRed:((float) ((hexString & 0xFF0000) >> 16)) / 255.0      \
green:((float) ((hexString & 0x00FF00) >> 8)) / 255.0       \
blue:((float) ((hexString & 0x0000FF) >> 0)) / 255.0       \
alpha:a]

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r,g,b) RGBA(r, g, b, 1)

#define COLOR_CELLBOTTOMSPACE UIColorFromHex(0xE0E0E0)

#define KWeakSelf __weak typeof(self) weakSelf = self;

// 判断delegate是否反应某个selector
#define A_IS_DELEGATE_RSP_SEL(iDel, iSel)                                    \
    (iDel != nil && [iDel respondsToSelector:@selector(iSel)])
#define A_IS_DELEGATE_RSP_ASEL(iDel, iSel)                                   \
    (iDel != nil && [iDel respondsToSelector:iSel])
#define A_IS_DELEGATE_CFM_PROTOCOL(iDel, iProtocol)                          \
    (iDel != nil && [iDel conformsToProtocol:@protocol(iProtocol)])

///  尺寸
#define SCREEN_SCALE    [UIScreen mainScreen].scale
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define STATUSANDBARHEIGHT  \
([UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height)
#define STATUSBAR_WIDTH     [[UIApplication sharedApplication] statusBarFrame].size.width
#define STATUSBAR_HEIGHT    [[UIApplication sharedApplication] statusBarFrame].size.height
#define TABBARHEIGHT    [[UITabBarController alloc]init].tabBar.frame.size.height

#define SCREEN_4S_WIDTH 320
#define SCREEN_5_WIDTH  320
#define SCREEN_6_WIDTH  375
#define SCREEN_6P_WIDTH 414

#define SCREEN_4S_HEIGHT 480
#define SCREEN_5_HEIGTH 568
#define SCREEN_6_HEIGHT 667
#define SCREEN_6P_HEIGHT 736
#define SCREEN_X_HEIGHT 812

///按屏幕比例计算高度,以 iphone6 为基准
#define SCALE_HEIGHT(currentHeight)     (SCREEN_HEIGHT / SCREEN_6_HEIGHT * currentHeight)
///按屏幕比例计算宽度,以 iphone6 为基准
#define SCALE_WIDTH(currentWidth)       (SCREEN_WIDTH / SCREEN_6_WIDTH * currentWidth)
///计算图片在不同屏幕的高度
#define SCALE_IMAGE(currentScreenWidth,imageSize)       (currentScreenWidth * imageSize.height / imageSize.width)


///空的判断
#define A_IS_STR_NIL(objStr)                                                 \
(![objStr isKindOfClass:[NSString class]] || objStr == nil ||              \
[objStr length] <= 0 || [objStr isKindOfClass:[NSNull class]] || [objStr isEqualToString:@"<null>"])
#define A_IS_DICT_NIL(objDict)                                               \
(![objDict isKindOfClass:[NSDictionary class]] || objDict == nil ||        \
[objDict count] <= 0)
#define A_IS_ARRAY_NIL(objArray)                                             \
(![objArray isKindOfClass:[NSArray class]] || objArray == nil ||           \
[objArray count] <= 0)
#define A_IS_NUM_NIL(objNum)                                                 \
(![objNum isKindOfClass:[NSNumber class]] || objNum == nil)
#define A_IS_DATA_NIL(objData)                                               \
(![objData isKindOfClass:[NSData class]] || objData == nil ||              \
[objData length] <= 0)
#define A_IS_OBJC_NIL(obj)     (obj == nil || [obj isKindOfClass:[NSNull class]])


#define CHECK_STRING(str) A_IS_STR_NIL(str) ? @"" : str

#define STRING_NULL_NUM(str) A_IS_STR_NIL(str) ? @"0" : str

/// 字体
#define SYSTEM_FONT(SIZE)       [UIFont systemFontOfSize:SIZE]
#define BOLD_SYSTEM_FONT(SIZE)      [UIFont boldSystemFontOfSize:SIZE]

#define DEFAULT_FONT_NAME @"PingFangSC-Regular"
#define FONT_WITH_SIZE(fontSize) [UIFont fontWithName:DEFAULT_FONT_NAME size:(fontSize)]

/// 判断系统版本大小
#define SYSTEM_VERSION_EQUAL_TO(v)                                             \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)                                         \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)                             \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                                            \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)                                \
([[[UIDevice currentDevice] systemVersion]                                 \
compare:v                                                             \
options:NSNumericSearch] != NSOrderedDescending)


///工具
#define IS_IPHONE_X_STYLE   (STATUSBAR_HEIGHT > 20)
#define SafeAreaBottomHeight (IS_IPHONE_X_STYLE ? 34 : 0)
#define SafeAreaTopHeight (IS_IPHONE_X_STYLE ? 44 : 0)

//获取屏幕宽高
#define KScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreen_Bounds [UIScreen mainScreen].bounds

#define KWindow [UIApplication sharedApplication].keyWindow
#define kAppWindow  [UIApplication sharedApplication].delegate.window

#define KImageNamed(name) ([UIImage imageNamed:name])

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]


// 是否iPhone5
#define isiPhone5       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 是否iPhone6
#define isiPhone6       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define isiPhonePlus   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)) : NO)

#define isiPhoneX       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//  6.1 是否XR,  iPhone11
#define isiPhoneXR       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

// 6.5是否XS-MAS, iPhone 11 Pro Max
#define isiPhoneXSMax       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

// 是否isiPhoneX XR  XS-MAS
#define isiPhoneXAll (IS_IPHONE_X_STYLE)

// 状态栏隐藏情况下用
#define isiPhoneXAll__UnStatus (isiPhoneXSMax || isiPhoneXR || isiPhoneX)

// iphonex高度
#define kNaviHeight (IS_IPHONE_X_STYLE ? 88 : 64)

#define kNaviHeight_UnStatus (IS_IPHONE_X_STYLE ? 88 : 64)

// tabbar高度
#define kTabbarBottomHeight            (IS_IPHONE_X_STYLE ? 34.f + 49.f : 49.f)

// tabbar安全区域高度
#define  kTabbarSafeBottomMargin         (IS_IPHONE_X_STYLE ? 34.f : 0.f)

// 导航+底部安全区域
#define KNavTabSafeHeight (kNaviHeight + kTabbarSafeBottomMargin)

#define kNavBarHeight 44.0
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define SafeKLineBottomHeight ((KScreenHeight >= 812.0) && [[UIDevice currentDevice].model isEqualToString:@"iPhone"]  ? 15 : 0)

//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

#define  adjustsScrollViewInsets(tableView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([tableView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
if (@available(iOS 11.0, *)) {\
tableView.estimatedRowHeight = 0;\
tableView.estimatedSectionHeaderHeight = 0;\
tableView.estimatedSectionFooterHeight = 0;\
tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
self.automaticallyAdjustsScrollViewInsets = NO;\
}\
}\
_Pragma("clang diagnostic pop")\
} while (0)

#define  adjustsTableViewInsets(tableView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([tableView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
if (@available(iOS 11.0, *)) {\
tableView.estimatedRowHeight = 0;\
tableView.estimatedSectionHeaderHeight = 0;\
tableView.estimatedSectionFooterHeight = 0;\
tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
}\
}\
_Pragma("clang diagnostic pop")\
} while (0)


#define KDecimal XXDecimalNumberHelper
#define KDetail [KSymbolDetailData sharedKSymbolDetailData]

///
#define App_Name [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleName"]

/**
 * 懒加载
 */
#define MLLazyGetMethod(type, attribute)            \
- (type *)attribute                                 \
{                                             \
    if (!_##attribute) {                            \
        _##attribute = [[type alloc] init];         \
    }                                               \
    return _##attribute;                            \
}


#define LabelAdapationFont(n) (n*([[UIScreen mainScreen] bounds].size.width/375.0f))


#define LEFT_EDAGE                          18.0f
#define RIGHT_EDAGE                         18.0f
#define AlertEdageWidth                     40

#define MAIN_BLUE_COLOR                     UIColorFromHex(0x1677FF)
#define MAIN_RED_COLOR                      UIColorFromHex(0xE1614E)
#define MAIN_GREEN_COLOR                    UIColorFromHex(0x10AD7E)
#define MAIN_GRAY_COLOR                     UIColorFromHex(0x939393)
#define MAIN_BLACK_COLOR                    UIColorFromHex(0x333333)
///白色弹窗 线的颜色
#define MAIN_LINE_COLOR                     UIColorFromHex(0xDDDDDD)
/// 黑色背景 线的颜色
#define BLACK_LINE_COLOR                    UIColorFromHex(0x06080C)
#define MAIN_BACKGROUND_COLOR               UIColorFromHex(0x06080C)
#define WHITE_COLOR                         UIColorFromHex(0xFFFFFF)
#define MAIN_BLACK_BG_COLOR                 UIColorFromHex(0x0F151C)
/// 默认颜色
#define MAIN_STATIC_COLOR                   UIColorFromHex(0x7B8084)


// 红涨绿跌
#define MAIN_RISE_COLOR UIColorFromHex(0xE1614E)
#define MAIN_DOWN_COLOR UIColorFromHex(0x10AD7E)

//买卖按钮颜色
#define TRADE_BUY_COLOR UIColorFromHex(0xE1614E)
#define TRADE_SELL_COLOR UIColorFromHex(0x10AD7E)

//修改挂单界面 填充颜色
#define TRADE_BUY_FILLCOLOR UIColorFromHex(0xB2D5CA)
#define TRADE_SELL_FILLCOLOR UIColorFromHex(0xFFCDC6)

#else

//绿涨红跌
#define MAIN_RISE_COLOR UIColorFromHex(0x179F69)
#define MAIN_DOWN_COLOR UIColorFromHex(0xE83950)

//买卖按钮颜色
#define TRADE_BUY_COLOR UIColorFromHex(0x10AD7E)
#define TRADE_SELL_COLOR UIColorFromHex(0xEC4037)

//修改挂单界面 填充颜色
#define TRADE_BUY_FILLCOLOR UIColorFromHex(0xFFCDC6)
#define TRADE_SELL_FILLCOLOR UIColorFromHex(0xB2D5CA)

#endif /* CoreMacros_h */
