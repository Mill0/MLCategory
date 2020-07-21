//
//  UITableView+VoidBlock.m
//

#import "UITableView+XXRefresh.h"
#import <objc/runtime.h>
#import "LanguageManager.h"
#import "UIView+MJExtension.h"
#import "MJRefresh.h"

static NSString const *refreshBlockKey = @"refreshBlockKey";
static NSString const *loadBlockKey = @"loadBlockKey";

@implementation UITableView (XXRefresh)

- (void)startRefresh {
    if (self.refreshBlock) {
        [self.mj_header beginRefreshing];
    }
}

- (void)endRefresh {
    if (!self.mj_header && !self.mj_footer) {
        return;
    }
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer.isRefreshing) {
        [self.mj_footer endRefreshing];
    }
}

- (void)endLoadDataWithNoMoreData {
    if (self.mj_footer) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
}

- (void)resetNoMoreData{
    if (self.mj_footer) {
        [self.mj_footer resetNoMoreData];
    }
}

#pragma mark runtime

- (void)setRefreshBlock:(VoidBlock)refreshBlock {
    if (refreshBlock) {
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.refreshBlock();
        }];
        //隐藏刷新时间提示
        MJRefreshNormalHeader *header = (MJRefreshNormalHeader *)self.mj_header;
        header.lastUpdatedTimeLabel.hidden = YES;
    }
    objc_setAssociatedObject(self, &refreshBlockKey, refreshBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (VoidBlock)refreshBlock {
    return objc_getAssociatedObject(self, &refreshBlockKey);
}

- (void)setLoadBlock:(VoidBlock)loadBlock {
    if (loadBlock) {
        //MJRefreshAutoNormalFooter
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.loadBlock();
        }];
    }
    else {
        self.mj_footer = nil;
    }
    objc_setAssociatedObject(self, &loadBlockKey, loadBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)enableLoadMore{
    self.mj_footer.hidden = NO;
}


- (void)disableLoadMore{
    self.mj_footer.hidden = YES;
}

- (void)enableRefresh{
    self.mj_header.hidden = NO;
}

- (void)disableRefresh{
    self.mj_header.hidden = YES;
}

- (void)refreshLanguage{
    // 设置header
    MJRefreshNormalHeader *header = (MJRefreshNormalHeader *)self.mj_header;
    [header setTitle:AWSLocalizedString(MJRefreshHeaderIdleText, nil) forState:MJRefreshStateIdle];
    [header setTitle:AWSLocalizedString(MJRefreshHeaderPullingText, nil) forState:MJRefreshStatePulling];
    [header setTitle:AWSLocalizedString(MJRefreshHeaderRefreshingText, nil) forState:MJRefreshStateRefreshing];

    //设置footer
    if([self.mj_footer isKindOfClass:[MJRefreshBackNormalFooter class]]){
        MJRefreshBackNormalFooter *footer = (MJRefreshBackNormalFooter *)self.mj_footer;
        [footer setTitle:AWSLocalizedString(MJRefreshBackFooterIdleText, nil) forState:MJRefreshStateIdle];
        [footer setTitle:AWSLocalizedString(MJRefreshBackFooterPullingText, nil) forState:MJRefreshStatePulling];
        [footer setTitle:AWSLocalizedString(MJRefreshBackFooterRefreshingText, nil) forState:MJRefreshStateRefreshing];
        [footer setTitle:AWSLocalizedString(MJRefreshBackFooterNoMoreDataText, nil) forState:MJRefreshStateNoMoreData];
    }
    else if ([self.mj_footer isKindOfClass:[MJRefreshAutoStateFooter class]]){
        MJRefreshAutoStateFooter *footer = (MJRefreshAutoStateFooter *)self.mj_footer;
        [footer setTitle:AWSLocalizedString(MJRefreshAutoFooterIdleText, nil) forState:MJRefreshStateIdle];
        [footer setTitle:AWSLocalizedString(MJRefreshAutoFooterRefreshingText, nil) forState:MJRefreshStateRefreshing];
        [footer setTitle:AWSLocalizedString(MJRefreshAutoFooterNoMoreDataText, nil) forState:MJRefreshStateNoMoreData];
    }
}

- (VoidBlock)loadBlock {
    return objc_getAssociatedObject(self, &loadBlockKey);
}

@end







