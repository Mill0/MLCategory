//
//  UIButton+Extenion.m
//

#import "UIButton+Extenion.h"
#import "UIButton+WebCache.h"
#import "CoreMacros.h"

@implementation UIButton (Extenion)

// 倒计时
- (void)ex_countDown:(int)time{
    [self ex_countDown:time executeColor:[UIColor whiteColor] endColor:[UIColor whiteColor]];
}

/**
time: 倒计时时间
executeeColor: 倒计时进行中文字颜色
endColor: 倒计时结束时文字颜色
*/
- (void)ex_countDown:(int)time executeColor:(UIColor *)executeColor endColor:(UIColor *)endColor{
    [self setUserInteractionEnabled:NO];
    
    //倒计时时间
    __block int timeout = time;
    
    //创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建timer
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置1s触发一次，0s的误差
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    //触发的事件
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=1){ //倒计时结束，关闭
            //取消dispatch源
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setUserInteractionEnabled:YES];
                [self setTitle:@"重新发送" forState:UIControlStateNormal];
                [self setTitleColor:endColor forState:UIControlStateNormal];
            });
        }else{
            timeout--;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%dS", timeout] forState:UIControlStateNormal];
                [self setTitleColor:executeColor forState:UIControlStateNormal];
            });
        }
    });
    
    //开始执行dispatch源
    dispatch_resume(_timer);
}

/**
 上部分是图片，下部分是文字
 
 @param space 间距
 */
- (void)ex_setUpImageAndDownLableWithSpace:(CGFloat)space{
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // titleLabel的宽度不一定正确的时候，需要进行判断
    CGFloat labelWidth = self.titleLabel.intrinsicContentSize.width;
    if (titleSize.width < labelWidth) {
        titleSize.width = labelWidth;
    }
    
    // 文字距上边框的距离增加imageView的高度+间距，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [self setTitleEdgeInsets:UIEdgeInsetsMake(titleSize.height + space, -imageSize.width, 0, 0.0)];
    
    // 图片距右边框的距离减少图片的宽度，距离上面的间隔，其它不变
    CGFloat imageOffsetY = imageSize.height / 2 + space + titleSize.height;
    [self setImageEdgeInsets:UIEdgeInsetsMake(-imageOffsetY, 0.0, 0, -titleSize.width)];
}

/**
 左边是文字，右边是图片（和原来的样式翻过来）
 
 @param space 间距
 */
- (void)ex_setLeftTitleAndRightImageWithSpace:(CGFloat)space{
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;

    // titleLabel的宽度不一定正确的时候，需要进行判断
    CGFloat labelWidth = self.titleLabel.intrinsicContentSize.width;
    if (titleSize.width < labelWidth) {
        titleSize.width = labelWidth;
    }
    
    // 文字距左边框的距离减少imageView的宽度-间距，右侧增加距离imageView的宽度
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -imageSize.width - space, 0.0, imageSize.width)];
    
    // 图片距左边框的距离增加titleLable的宽度,距右边框的距离减少titleLable的宽度
    [self setImageEdgeInsets:UIEdgeInsetsMake(0.0, titleSize.width,0.0,-titleSize.width)];
}

/**
 设置角标的个数（右上角）
 
 @param badgeValue
 */
- (void)ex_setBadgeValue:(NSInteger)badgeValue{
    
    CGFloat badgeW   = 20;
    CGSize imageSize = self.imageView.frame.size;
    CGFloat imageX   = self.imageView.frame.origin.x;
    CGFloat imageY   = self.imageView.frame.origin.y;
    
    UILabel *badgeLable = [[UILabel alloc]init];
    badgeLable.text = [NSString stringWithFormat:@"%ld",(long)badgeValue];
    badgeLable.textAlignment = NSTextAlignmentCenter;
    badgeLable.textColor = [UIColor whiteColor];
    badgeLable.font = [UIFont systemFontOfSize:12];
    badgeLable.layer.cornerRadius = badgeW*0.5;
    badgeLable.clipsToBounds = YES;
    badgeLable.backgroundColor = [UIColor redColor];
    
    CGFloat badgeX = imageX + imageSize.width - badgeW*0.5;
    CGFloat badgeY = imageY - badgeW*0.25;
    badgeLable.frame = CGRectMake(badgeX, badgeY, badgeW, badgeW);
    [self addSubview:badgeLable];
}

- (void)aef_setImageWithUrl:(NSString *)url forState:(UIControlState)state{
    [self aef_setImageWithURL:url forState:state placeholderImage:@"home_img_hud"];
}

- (void)aef_setImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(NSString *)place{
    [self sd_setImageWithURL:[NSURL URLWithString:url] forState:UIControlStateNormal placeholderImage:KImageNamed(place)];
}
@end
