//
//  UIImage+LJLoad.m
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import "UIImage+LJLoad.h"
#import "NSBundle+LJLoad.h"

@implementation UIImage (LJLoad)

//spec.resources  使用user_frameworks【不建议使用，建议使用resource_bundles】
+ (instancetype)image_resource_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:moduleName];
    associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
    if (associateBundleURL) {
        NSBundle *bundle = [NSBundle bundleWithURL:associateBundleURL];
        if (bundle) {
            UIImage *image = [UIImage imageNamed:imageName
              inBundle: bundle
            compatibleWithTraitCollection:nil];
            if (image) {
                return image;
            }
        }
    }
    
    return [UIImage imageNamed:imageName];
}

//spec.resources  不使用user_frameworks【不建议使用，建议使用resource_bundles】
+ (instancetype)image_resource_notUserFrameworks_imageName:(NSString *)imageName {
    return [self imageNamed:imageName];
}

//spec.resource_bundles 不使用user_frameworks
+ (instancetype)image_resourceBundles_notUserFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    
    UIImage *image = [self resourceBundles_notUserFrameworks_imageName:imageName moduleName:moduleName];
    if (image) {
        return image;
    } else {
        image = [self resourceBundles_userFrameworks_imageName:imageName moduleName:moduleName];
    }
    return image;
}

//spec.resource_bundles 使用user_frameworks
+ (instancetype)image_resourceBundles_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    
    UIImage *image = [self resourceBundles_userFrameworks_imageName:imageName moduleName:moduleName];
    if (image) {
        return image;
    } else {
        image = [self resourceBundles_notUserFrameworks_imageName:imageName moduleName:moduleName];
    }
    return image;
}

#pragma mark - 私有
//spec.resource_bundles 不使用user_frameworks
+ (instancetype)resourceBundles_notUserFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:moduleName withExtension:@"bundle"];
    if (url) {
        NSBundle *bundle = [NSBundle bundleWithURL:url];
        if (bundle) {
            UIImage *img = [UIImage imageNamed:imageName
              inBundle: bundle
            compatibleWithTraitCollection:nil];
            if (img) {
                return img;
            }
        }
    }
    
    return [UIImage imageNamed:imageName];
}

//spec.resource_bundles 使用user_frameworks
+ (instancetype)resourceBundles_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName {
    
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];
    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:moduleName];
    associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];
    if (associateBundleURL) {
        NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];
        if (associateBunle) {
            associateBundleURL = [associateBunle URLForResource:moduleName withExtension:@"bundle"];
            if (associateBundleURL) {
                NSBundle *bundle = [NSBundle bundleWithURL:associateBundleURL];
                if (bundle) {
                    UIImage *image = [UIImage imageNamed:imageName inBundle: bundle compatibleWithTraitCollection:nil];
                    if (image) {
                        return image;
                    }
                }
            }
        }
    }
    
    return [UIImage imageNamed:imageName];
}

@end
