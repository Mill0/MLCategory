//
//  LanguageManager.h
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,LangType) {
    /** 中文 */
    LangTypeZh = 100,
    /** 英语 */
    LangTypeEn = 200,
    /** 越南文*/
    LangTypeViet = 300
};

/**
 swift
 enum Lang:String {
 case zh,en,vn
 var description {
 }
 
 let lang = Lang(rawValue:"")
 渣渣
 }
 
 */

#define AWSLocalizedString(key,comment) \
[LanguageManager localizedString:key andComment:comment]

/** 待国际化的字符串用这个标记 */
#define XLocalizedString(key,comment) AWSLocalizedString(key,comment)

@interface LanguageManager : NSObject

@property (nonatomic,assign) LangType langType;

@property (nonatomic,copy) NSString *langTypeDescription;

+ (instancetype)sharedManager;

+ (NSString *)localizedString:(NSString *)key andComment:(NSString*)comment;

- (BOOL)isChineseLanguage;

@end
