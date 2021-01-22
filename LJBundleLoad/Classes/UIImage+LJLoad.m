//
//  UIImage+LJLoad.m
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import "UIImage+LJLoad.h"

@implementation UIImage (LJLoad)

//spec.resources  使用user_frameworks
+ (instancetype)image_resource_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:moduleName];
    associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
    NSBundle *bundle = [NSBundle bundleWithURL:associateBundleURL];
    UIImage *img = [UIImage imageNamed:imageName
      inBundle: bundle
    compatibleWithTraitCollection:nil];
    return img;
}

//spec.resources  不使用user_frameworks
+ (instancetype)image_resource_notUserFrameworks_imageName:(NSString *)imageName {
    return [self imageNamed:imageName];
}

//spec.resource_bundles 不使用user_frameworks
+ (instancetype)image_resourceBundles_notUserFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    NSURL *url = [[NSBundle mainBundle] URLForResource:moduleName withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    UIImage *img = [UIImage imageNamed:imageName
      inBundle: bundle
    compatibleWithTraitCollection:nil];
    return img;
}

//spec.resource_bundles 使用user_frameworks
+ (instancetype)image_resourceBundles_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:moduleName];
    associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
    NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
    associateBundleURL = [associateBunle URLForResource:@"CXSalesmanModule" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:associateBundleURL];
    UIImage *img = [UIImage imageNamed:imageName
      inBundle: bundle
    compatibleWithTraitCollection:nil];
    return img;
}

@end
