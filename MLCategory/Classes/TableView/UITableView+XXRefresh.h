//
//  UITableView+refresh.h
//  
//

#import <UIKit/UIKit.h>
typedef void(^VoidBlock)(void);

@interface UITableView (XXRefresh)

/**
 下拉刷新的block，实现了才能执行下拉刷新。
 */
@property (nonatomic, copy) VoidBlock refreshBlock;

/**
 上拉加载的block，实现了才能执行上拉加载
 */
@property (nonatomic, copy) VoidBlock loadBlock;

/**
 手动进行下拉刷新
 */
- (void)startRefresh;

/**
 手动刷新的动画
 */
- (void)endRefresh;

/**
允许上拉
 */
- (void)enableLoadMore;

/**
禁止上拉
 */
- (void)disableLoadMore;

/**
 允许下拉
 */
- (void)enableRefresh;

/**
 禁止下拉
 */
- (void)disableRefresh;


/**
 刷新国际化语言
 */
- (void)refreshLanguage;


/**
暂无数据
 */
- (void)endLoadDataWithNoMoreData;

/**
取消暂无数据的状态
 */
- (void)resetNoMoreData;

@end


