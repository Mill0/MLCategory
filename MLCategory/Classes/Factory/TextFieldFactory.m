//
//  TextFiledFactory.m
//

#import "TextFieldFactory.h"

@interface ChangeTextField : UITextField
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, copy) textfieldBlock block;

- (void)cusSetPlaceholder:(NSString *)content;
@end

@implementation ChangeTextField

- (instancetype)initWithColor:(UIColor *)color {
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(didInputChange) forControlEvents:UIControlEventEditingChanged];
        self.placeholderColor = color;
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(didInputChange) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)didInputChange {
    if (self.block) {
        self.block(self);
    }
}

- (void)cusSetPlaceholder:(NSString *)content {
    if (self.placeholderColor) {
        UIFont *font = self.font;
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:content
                                                                                attributes:@{NSForegroundColorAttributeName : self.placeholderColor,
                                                                                             NSFontAttributeName : font
                                                                                }];
        self.attributedPlaceholder = att.copy;
    }
}
@end


@implementation TextFieldFactory

+ (UITextField *)textfield:(textfieldBlock)tf placeholderColor:(UIColor *)color placeHolder:(NSString *)placeholder{
    ChangeTextField *textField = [[ChangeTextField alloc] initWithColor:color];
    [textField cusSetPlaceholder:placeholder];
    textField.block = tf;
    
    return textField;
}

@end
