//
//  DigitalTextField.m
//

#import "DigitalTextField.h"
#import "CoreMacros.h"

@interface DigitalTextField ()
@property (nonatomic, strong) NSMutableString *text;
@end

@implementation DigitalTextField

static NSString  * const MONEYNUMBERS = @"0123456789";

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.text = [NSMutableString string];
        self.passWordNum = 6;
        self.pointRadius = 6;
        self.pointColor = UIColorFromHex(0x5E87D8);
    }
    return self;
}


- (instancetype)init {
    if (self = [super init]) {
        self.text = [NSMutableString string];
        self.passWordNum = 6;
        self.pointRadius = 6;
        self.pointColor = UIColorFromHex(0x5E87D8);
    }
    return self;
}
- (void)customInitBack {
    
}

/**
 *  设置键盘的类型
 */
- (UIKeyboardType)keyboardType {
    return UIKeyboardTypeNumberPad;
}

/**
 *  设置密码的位数
 */
- (void)setPassWordNum:(NSUInteger)passWordNum {
    _passWordNum = passWordNum;
    [self setNeedsDisplay];
}

- (BOOL)becomeFirstResponder {
    if ([self.delegate respondsToSelector:@selector(passWordBeginInput:)]) {
        [self.delegate passWordBeginInput:self];
    }
    return [super becomeFirstResponder];
}

/**
 *  是否能成为第一响应者
 */
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (![self isFirstResponder]) {
        [self becomeFirstResponder];
    }
}

#pragma mark - Public -
- (void)clearText{
    while (self.text.length > 0) {
        [self deleteBackward];
    }
}

#pragma mark - UIKeyInput
/**
 *  用于显示的文本对象是否有任何文本
 */
- (BOOL)hasText {
    return self.text.length > 0;
}

/**
 *  插入文本
 */
- (void)insertText:(NSString *)text {
    if (self.text.length < self.passWordNum) {
        //判断是否是数字
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:MONEYNUMBERS] invertedSet];
        NSString*filtered = [[text componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [text isEqualToString:filtered];
        if(basicTest) {
            [self.text appendString:text];
            if ([self.delegate respondsToSelector:@selector(passWordDidChange:)]) {
                [self.delegate passWordDidChange:self];
            }
            if (self.text.length == self.passWordNum) {
                if ([self.delegate respondsToSelector:@selector(passWordCompleteInput:)]) {
                    [self.delegate passWordCompleteInput:self];
                }
            }
            [self setNeedsDisplay];
        }
    }
}

/**
 *  删除文本
 */
- (void)deleteBackward {
    if (self.text.length > 0) {
        [self.text deleteCharactersInRange:NSMakeRange(self.text.length - 1, 1)];
        if ([self.delegate respondsToSelector:@selector(passWordDidChange:)]) {
            [self.delegate passWordDidChange:self];
        }
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
- (void)drawRect:(CGRect)rect {
    CGFloat height = rect.size.height;
    CGFloat width = rect.size.width;

    for (int i = 0 ; i < 6 ; i++) {
        CGFloat space = (width - 6 * height)/5.0;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(i * (height + space), 0, height, height)
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(5, 5)];
        [UIColorFromHex(0xDFDFDF) set];
        [path fill];
    }
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, self.pointColor.CGColor);
    for (int i = 0 ; i < self.text.length ; i++) {
        CGFloat space = (width - 6 * height)/5.0;
        CGContextAddArc(context, i * (height + space) + height/2.0, height/2.0, self.pointRadius, 0, M_PI*2, YES);
        CGContextDrawPath(context, kCGPathFill);
    }
}


@end
