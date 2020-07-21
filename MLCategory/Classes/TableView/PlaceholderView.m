//
//  PlaceholderView.m
//

#import "PlaceholderView.h"
#import "LabelFactory.h"
#import "CoreMacros.h"
#import "LanguageManager.h"
#import <Masonry/Masonry.h>

@interface PlaceholderView()

@property (nonatomic,strong) UILabel *textLabel;

@end

@implementation PlaceholderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.imgV = [[UIImageView alloc]init];
    [self addSubview:self.imgV];
    
    self.textLabel = [LabelFactory labelWithText:AWSLocalizedString(@"暂无记录", nil) font:SYSTEM_FONT(14) color:UIColorFromHex(0xB7C6DB)];
    self.textLabel.numberOfLines = 0;
    [self addSubview:self.textLabel];
}

- (void)setPlaceholderText:(NSString *)placeholderText{
    _placeholderText = placeholderText;
    self.textLabel.text = placeholderText;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.imgV.mas_bottom).offset(15);
        make.left.greaterThanOrEqualTo(@20);
    }];
}

@end
