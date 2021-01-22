//
//  NSBundle+LJLoad.h
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (LJLoad)

+ (instancetype)bundleWithModuleName:(NSString *)moduleName targetClass:(Class)targetClass;

@end

NS_ASSUME_NONNULL_END
