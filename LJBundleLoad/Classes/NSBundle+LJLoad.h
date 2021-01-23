//
//  NSBundle+LJLoad.h
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import <Foundation/Foundation.h>

#define LJBundleLoad(moduleName,targetClass)\
({\
    NSBundle *mainBundle = [NSBundle mainBundle];\
    NSBundle *bundle = [NSBundle bundleForClass:targetClass];\
    NSString *path = [bundle pathForResource:moduleName ofType:@"bundle"];\
    if (path) {\
        mainBundle = [NSBundle bundleWithPath:path];\
    }\
    (mainBundle);\
})\

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (LJLoad)

+ (instancetype)bundleWithModuleName:(NSString *)moduleName targetClass:(Class)targetClass;

@end

NS_ASSUME_NONNULL_END
