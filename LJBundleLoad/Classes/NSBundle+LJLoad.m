//
//  NSBundle+LJLoad.m
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import "NSBundle+LJLoad.h"

@implementation NSBundle (LJLoad)

/*
 使用场景：
    1、假设你的组件名为：MyModule，组件中有xib文件：XIBFile.xib
    2、xib,png,gif等资源文件需要存放在:MyModule/Assets 目录下面
    3、MyModule.podspec文件中需要加上：
         s.resource_bundles = {
           'MyModule' => ['MyModule/Assets/*.xib']
         }
    4、使用时，之前：
         NSBundle *bundle = [NSBundle mainBundle] ;
         NSArray *a = [bundle loadNibNamed:@"XIBFile" owner:nil options:nil];
       引用组件MyModule中的XIB文件：
         NSBundle *bundle = [self bundleWithXIBForModuleName:@"MyModule" targetClass:[self class]];
         NSArray *a = [bundle loadNibNamed:@"XIBFile" owner:nil options:nil];
 */

+ (instancetype)bundleWithXIBForModuleName:(NSString *)moduleName targetClass:(Class)targetClass {
    NSBundle *bundle = [NSBundle bundleForClass:targetClass];
    NSString *path = [bundle pathForResource:moduleName ofType:@"bundle"];
    if (path) {
        return [NSBundle bundleWithPath:path];
    } else {
        return [NSBundle mainBundle];
    }
}

@end
