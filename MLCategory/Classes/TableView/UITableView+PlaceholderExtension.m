//
//  UITableView+PlaceholderExtension.m
//

#import "UITableView+PlaceholderExtension.h"
#import "UITableView+XXPlaceholder.h"
#import "PlaceholderView.h"
#import "CoreMacros.h"
#import "LanguageManager.h"


@implementation UITableView (PlaceholderExtension)

- (void)pe_addDefaultTableViewPlaceholderViewWithName:(NSString *)imageName withPlaceholderText:(NSString *)placeholderText{
    self.xx_enablePlaceholderView = YES;
    PlaceholderView *placeholderView = [[PlaceholderView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCALE_HEIGHT(300))];
    placeholderView.imgV.image = [UIImage imageNamed:imageName];
    placeholderView.placeholderText = placeholderText;
    self.xx_placeholderView = placeholderView;
}

- (void)pe_addDefaultTableViewPlaceholderViewWithHeight:(CGFloat)height{
    self.xx_enablePlaceholderView = YES;
    PlaceholderView *placeholderView = [[PlaceholderView alloc] initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCALE_HEIGHT(height))];
    placeholderView.imgV.image = [UIImage imageNamed:@"mine_img_coininfo_noData"];
    placeholderView.placeholderText = AWSLocalizedString(@"暂无记录", nil);
    self.xx_placeholderView = placeholderView;
}

- (void)pe_addDefaultTableViewPlaceholderView{
    [self pe_addDefaultTableViewPlaceholderViewWithHeight:300];
}

- (void)pe_addPlaceholderWithText:(NSString *)text{
    self.xx_enablePlaceholderView = YES;
    PlaceholderView *placeholderView = [[PlaceholderView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCALE_HEIGHT(300))];
    placeholderView.imgV.image = [UIImage imageNamed:@"mine_img_coininfo_noData"];
    placeholderView.placeholderText = text;
    self.xx_placeholderView = placeholderView;
}
@end
