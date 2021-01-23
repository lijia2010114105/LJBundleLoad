//
//  UIImage+LJLoad.h
//  LJBundleLoad
//
//  Created by harsons on 2021/1/22.
//

#import <UIKit/UIKit.h>

#define LJImageLoad(imageName,moduleName) [UIImage imageNamed:imageName inBundle:[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:moduleName withExtension:@"bundle"]] compatibleWithTraitCollection:nil]

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LJLoad)

//spec.resources  使用user_frameworks
+ (instancetype)image_resource_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

//spec.resources  不使用user_frameworks
+ (instancetype)image_resource_notUserFrameworks_imageName:(NSString *)imageName;

//spec.resource_bundles 不使用user_frameworks
+ (instancetype)image_resourceBundles_notUserFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

//spec.resource_bundles 使用user_frameworks
+ (instancetype)image_resourceBundles_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

+ (instancetype)imageWithName:(NSString *)imageName moduleName:(NSString *)moduleName targetClass:(Class)targetClass;

@end

NS_ASSUME_NONNULL_END
