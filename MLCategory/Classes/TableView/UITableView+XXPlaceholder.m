//
//  UITableView+XXPlaceholderView.m
//  XXTableViewPlaceholderView
//


#import "UITableView+XXPlaceholder.h"
#import "NSObject+XXRuntime.h"
#import <objc/runtime.h>

@implementation UITableView (XXPlaceholder)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self xx_swizzleInstanceMethod:@selector(reloadData) andMethod:@selector(xx_reloadData)];
        
        [self xx_swizzleInstanceMethod:@selector(layoutSubviews) andMethod:@selector(xx_layoutSubviews)];
    });
}

- (void)xx_reloadData{
    if (self.xx_enablePlaceholderView == YES) {
        if ([self isEmpty] == YES) {
            if (self.xx_placeholderView != nil) {
                [self addSubview:self.xx_placeholderView];
                [self sendSubviewToBack:self.xx_placeholderView];
            }
        }
        else{
            [self removePlaceholderView];
        }
    }
    else{
        [self removePlaceholderView];
    }
   
    [self xx_reloadData];
}

- (void)xx_layoutSubviews{
    CGFloat tableHeaderHeight = CGRectGetMaxY(self.tableHeaderView.frame);
    BOOL isUseAutoLayout = self.tableHeaderView.constraints.count != 0;
    if (isUseAutoLayout) {
        for (NSLayoutConstraint* constraint in self.tableHeaderView.constraints) {
            if (constraint.firstAttribute ==NSLayoutAttributeHeight) {
                tableHeaderHeight = constraint.constant ;
            }
        }
    }
    
    if (self.xx_enablePlaceholderView == YES) {
        if (self.tableHeaderView != nil) {
            self.xx_placeholderView.frame = CGRectMake(self.frame.origin.x, tableHeaderHeight, self.xx_placeholderView.frame.size.width, self.xx_placeholderView.frame.size.height);
        }
        
        if (self.tableFooterView != nil) {
            if ([self isEmpty] == YES) {
                self.tableFooterView.frame = CGRectMake(self.tableFooterView.frame.origin.x, CGRectGetMaxY(self.xx_placeholderView.frame), self.tableFooterView.frame.size.width, self.tableFooterView.frame.size.height);
            }
        }
    }
    else{
        if(self.xx_placeholderView != nil){
            self.xx_placeholderView.frame = CGRectZero;
        }
        if ([self isEmpty] == YES) {
            self.tableFooterView.frame = CGRectMake(self.tableFooterView.frame.origin.x, tableHeaderHeight, self.tableFooterView.frame.size.width, self.tableFooterView.frame.size.height);
        }
    }
    
    [self xx_layoutSubviews];
}

- (BOOL)isEmpty{
    BOOL isEmpty = YES;
    id <UITableViewDataSource> dataSource = self.dataSource;
    NSInteger sections = 1;
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [dataSource numberOfSectionsInTableView:self];
    }
    for (int i = 0; i < sections; i++) {
        NSInteger rows = [dataSource tableView:self numberOfRowsInSection:i];
        if (rows != 0) {
            isEmpty = NO;
            break;
        }
    }
    return isEmpty;
}

- (void)removePlaceholderView{
    if (self.xx_placeholderView) {
        [self.xx_placeholderView removeFromSuperview];
    }
}


- (void)setXx_enablePlaceholderView:(BOOL)xx_enablePlaceholderView{
    objc_setAssociatedObject(self, @selector(xx_enablePlaceholderView), [NSNumber numberWithBool:xx_enablePlaceholderView], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)xx_enablePlaceholderView{
    return [objc_getAssociatedObject(self, @selector(xx_enablePlaceholderView)) boolValue];
}

- (void)setXx_placeholderView:(UIView *)xx_placeholderView{
    objc_setAssociatedObject(self, @selector(xx_placeholderView), xx_placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)xx_placeholderView{
    return objc_getAssociatedObject(self, @selector(xx_placeholderView));
}

@end




