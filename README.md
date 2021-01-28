# LJBundleLoad

[![CI Status](https://img.shields.io/travis/lijia2010114105/LJBundleLoad.svg?style=flat)](https://travis-ci.org/lijia2010114105/LJBundleLoad)
[![Version](https://img.shields.io/cocoapods/v/LJBundleLoad.svg?style=flat)](https://cocoapods.org/pods/LJBundleLoad)
[![License](https://img.shields.io/cocoapods/l/LJBundleLoad.svg?style=flat)](https://cocoapods.org/pods/LJBundleLoad)
[![Platform](https://img.shields.io/cocoapods/p/LJBundleLoad.svg?style=flat)](https://cocoapods.org/pods/LJBundleLoad)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LJBundleLoad is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LJBundleLoad'
```

## Note
###使用配置：
    1、假设你的组件名为：MyModule，有资源文件：view.xib，XNClusHomeTableViewCell.xib ，abc@2x.png，abc@3x.png，data.json
    2、xib,png,json等资源文件需要存放在:MyModule/Assets 目录下面
    3、MyModule.podspec文件中配置：
         s.resource_bundles = {
           'MyModule' => ['MyModule/Assets/*.{xib,png,json}']
         }
         
   ###使用：
  ##### 1、加载自定义视图 xib
  ```
  //正常使用
  NSBundle *bundle = [NSBundle mainBundle] ;
  NSArray *a = [bundle loadNibNamed:@"view" owner:nil options:nil];
  return [a firstObject];
  
  //引用组件MyModule后使用：
  NSBundle *bundle = [self bundleWithXIBForModuleName:@"MyModule" targetClass:[self class]];
  NSArray *a = [bundle loadNibNamed:@"view" owner:nil options:nil];
  return [a firstObject];
  ```

##### 2、tableview中重用tableviewcell
  ```
  //正常使用
  static NSString *clusHomeTableViewCellIdentifier = @"XNClusHomeTableViewCell";
  [self.tableView registerNib:[UINib nibWithNibName:clusHomeTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:clusHomeTableViewCellIdentifier];
  XNClusHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:clusHomeTableViewCellIdentifier forIndexPath:indexPath];
  
  //引用组件MyModule后使用：
 static NSString *clusHomeTableViewCellIdentifier = @"XNClusHomeTableViewCell";
 NSBundle *bundle = LJBundleLoad(@"MyModule",[self class]);
  [self.tableView registerNib:[UINib nibWithNibName:clusHomeTableViewCellIdentifier bundle:bundle] forCellReuseIdentifier:clusHomeTableViewCellIdentifier];
  XNClusHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:clusHomeTableViewCellIdentifier forIndexPath:indexPath];
  ```
  
  ##### 3、加载json文件
  ```
  //正常使用
  NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:path];
  
  //引用组件MyModule后使用：
  NSBundle *bundle = LJBundleLoad(@"MyModule", [self class]);
  NSString *path = [bundle pathForResource:@"data" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:path];
  ```
       
 ##### 4、加载图片
```
1、我写了四个方法和4个宏，每个方法都对应一个宏，方便调用
2、配置是主要有spec.resources和spec.resource_bundles两种，加上是否使用user_frameworks，一共四种情况，根据实际情况选择调用
3、方法如下：

//spec.resources  使用user_frameworks【不建议使用，建议使用resource_bundles】
#define LJImageLoad_resource_userFrameworks(imageName,moduleName)

//spec.resources  不使用user_frameworks【不建议使用，建议使用resource_bundles】
#define LJImageLoad_resource_notUserFrameworks(imageName)

//spec.resource_bundles 不使用user_frameworks
#define LJImageLoad_resourceBundles_notUserFrameworks(imageName,moduleName)

//spec.resource_bundles 使用user_frameworks
#define LJImageLoad_resourceBundles_userFrameworks(imageName,moduleName)


//spec.resources  使用user_frameworks【不建议使用，建议使用resource_bundles】
+ (instancetype)image_resource_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

//spec.resources  不使用user_frameworks【不建议使用，建议使用resource_bundles】
+ (instancetype)image_resource_notUserFrameworks_imageName:(NSString *)imageName;

//spec.resource_bundles 不使用user_frameworks
+ (instancetype)image_resourceBundles_notUserFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;

//spec.resource_bundles 使用user_frameworks
+ (instancetype)image_resourceBundles_userFrameworks_imageName:(NSString *)imageName moduleName:(NSString *)moduleName;
```

## Author

lijia2010114105, lijia@harsons.cn

## License

LJBundleLoad is available under the MIT license. See the LICENSE file for more info.
