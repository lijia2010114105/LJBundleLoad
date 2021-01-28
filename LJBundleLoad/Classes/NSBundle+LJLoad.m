//
//  NSBundle+LJLoad.m
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import "NSBundle+LJLoad.h"

@implementation NSBundle (LJLoad)

+ (instancetype)bundleWithModuleName:(NSString *)moduleName targetClass:(Class)targetClass {
    NSBundle *bundle = [NSBundle bundleForClass:targetClass];
    NSString *path = [bundle pathForResource:moduleName ofType:@"bundle"];
    if (path) {
        return [NSBundle bundleWithPath:path];
    } else {
        return [NSBundle mainBundle];
    }
}

@end
