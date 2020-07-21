//
//  ImageViewFactory.m
//

#import "ImageViewFactory.h"

@implementation ImageViewFactory
+ (UIImageView *)nextIcon_BEBEBE {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_next"]];
    
    return imageView;
}
@end
