//
//  LanguageManager.m
//

#import "LanguageManager.h"

static NSString *const kUserLanguage = @"kUserLanguage";

@implementation LanguageManager

+ (instancetype)sharedManager{
    static LanguageManager * manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

- (LangType)langType{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    LangType userLanguage = [defaults integerForKey:kUserLanguage];
    
    if (userLanguage == LangTypeEn || userLanguage == LangTypeZh || userLanguage == LangTypeViet) {
        return userLanguage;
    }
    else{
        //未设置跟随系统
        NSArray *languages = [[NSBundle mainBundle] preferredLocalizations];
        NSString *systemLanguage = languages.firstObject;
        LangType systemType = LangTypeZh;
        if ([systemLanguage containsString:@"zh"]) {
            systemType = LangTypeZh;
        }
        else if ([systemLanguage containsString:@"en"]){
            systemType = LangTypeEn;
        }
        else if ([systemLanguage containsString:@"vi"]){
            systemType = LangTypeViet;
        }
        
        return systemType;
    }
}

- (NSString *)langTypeDescription{
    if (self.langType == LangTypeZh) {
        return @"zh_cn";
    }
    else if(self.langType == LangTypeEn){
        return @"en_us";
    }
    else if (self.langType == LangTypeViet){
        return @"vn";
    }
    else{
        //默认中文
        return @"zh_cn";
    }
}

- (NSString *)lprojName{
    if (self.langType == LangTypeZh) {
        return @"zh-Hans";
    }
    else if(self.langType == LangTypeEn){
        return @"en";
    }
    else if (self.langType == LangTypeViet){
        return @"vi";
    }
    else{
        return @"zh-Hans";
    }
}

- (BOOL)isChineseLanguage{
    if(self.langType == LangTypeZh){
        return YES;
    }
    else{
        return NO;
    }
}

- (void)setLangType:(LangType)langType{
    [[NSUserDefaults standardUserDefaults] setInteger:langType forKey:kUserLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)localizedString:(NSString *)key andComment:(NSString*)comment{
    NSString *language = [[LanguageManager sharedManager] lprojName];
    
#if !TARGET_USE_MULTI_LANGE
//    language = @"zh-Hans";
#endif
    //test: @"en" @"zh-Hans" @"vi"
//    language = @"en";
//    language = @"vi";
//    language = @"zh-Hans";
    
    NSString * path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    NSBundle * languageBundle = [NSBundle bundleWithPath:path];
    NSString *localizedString = [languageBundle localizedStringForKey:key value:comment table:nil];
    return localizedString;
}

@end
