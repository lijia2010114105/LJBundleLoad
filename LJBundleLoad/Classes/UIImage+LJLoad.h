//
//  UIImage+LJLoad.h
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import <UIKit/UIKit.h>

//spec.resources  使用user_frameworks【不建议使用，建议使用resource_bundles】
#define LJImageLoad_resource_userFrameworks(imageName,moduleName) \
({\
    UIImage *image;\
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];\
    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:moduleName];\
    associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];\
    NSBundle *bundle = [NSBundle bundleWithURL:associateBundleURL];\
    if (bundle) {\
        image = [UIImage imageNamed:imageName inBundle: bundle compatibleWithTraitCollection:nil];\
    }\
    if (!image) {\
        image = [UIImage imageNamed:@""];\
    }\
    (image);\
})\

//spec.resources  不使用user_frameworks【不建议使用，建议使用resource_bundles】
#define LJImageLoad_resource_notUserFrameworks(imageName) [UIImage imageNamed:imageName]

//spec.resource_bundles 不使用user_frameworks
#define LJImageLoad_resourceBundles_notUserFrameworks(imageName,moduleName) \
({ \
    UIImage *image;\
    NSURL *url = [[NSBundle mainBundle] URLForResource:moduleName withExtension:@"bundle"];\
    NSBundle *bundle = [NSBundle bundleWithURL:url];\
    if (bundle) {\
        image = [UIImage imageNamed:imageName inBundle: bundle compatibleWithTraitCollection:nil];\
    }\
    if (!image) {\
        image = [UIImage imageNamed:@""];\
    }\
    (image);\
}) \

//spec.resource_bundles 使用user_frameworks
#define LJImageLoad_resourceBundles_userFrameworks(imageName,moduleName) \
({\
    UIImage *image;\
    NSURL *associateBundleURL = [[NSBundle mainBundle] URLForResource:@"Frameworks" withExtension:nil];\
    associateBundleURL = [associateBundleURL URLByAppendingPathComponent:moduleName];\
    associateBundleURL = [associateBundleURL URLByAppendingPathExtension:@"framework"];\
    NSBundle *associateBunle = [NSBundle bundleWithURL:associateBundleURL];\
    if (associateBunle) {\
        associateBundleURL = [associateBunle URLForResource:moduleName withExtension:@"bundle"];\
        NSBundle *bundle = [NSBundle bundleWithURL:associateBundleURL];\
        if (bundle) {\
            image = [UIImage imageNamed:imageName inBundle: bundle compatibleWithTraitCollection:nil];\
        }\
    }\
    if (!image) {\
        image = [UIImage imageNamed:@""];\
    }\
    (image);\
})\

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LJLoad)

//spec.resources  使用user_frameworks【不建议使用，建议使用resource_bundles】
+ (instancetype)image_resource_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

//spec.resources  不使用user_frameworks【不建议使用，建议使用resource_bundles】
+ (instancetype)image_resource_notUserFrameworks_imageName:(NSString *)imageName;

//spec.resource_bundles 不使用user_frameworks
+ (instancetype)image_resourceBundles_notUserFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

//spec.resource_bundles 使用user_frameworks
+ (instancetype)image_resourceBundles_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

@end

NS_ASSUME_NONNULL_END
