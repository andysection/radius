# radius
roundRect or round Image
# 结合SDWebImage实现圆角图片或圆角矩形图片(也可实现静态图片圆角功能)
## 网络下载图片

![新版本 2017年2月16日 下午2.24.47.png](http://upload-images.jianshu.io/upload_images/2860910-5ab21bf9a5c801f5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/375)

> 思路1：通过SD提供的函数：

```
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;
```
在completedBlock中将image贝塞尔切割为圆角图片或圆角矩形图

但是在实现以后发现，一旦图片下载失败，那么sd不会调用completedBlock，无法实现placeholder占位图片圆角，所以产生了新的思路

> 思路2：直接将placeholder占位图直接处理为圆角图片，然后再调用sd提供的函数。

## 目前可支持UIImageView和UIButton分别调用方法：
* UIImageView:（color设置为nil时，背景色为透明）
```
//网络延迟下载--圆形
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color;
//网络延迟下载--圆形矩阵
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius;
```
* UIButton:（color设置为nil时，背景色为透明）
```
//button--圆形
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color forState:(UIControlState)state;
//button--圆角矩形
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state;
```
## 对于静态图片，直接UIImage对象调用以下方法即可：
```
//圆形
- (void)was_roundImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion;
//圆角矩阵
- (void)was_roundRectImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor radius:(CGFloat)radius completion:(void (^)(UIImage *))completion;
```

> 2017.2.16更新

## 新增方法
* UIImageView:

```
//网络延迟下载--圆形    背景色为透明 无背景色
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image;
//网络延迟下载--圆形矩阵 背景色为透明 无背景色
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image cornerRadius:(CGFloat) cornerRadius;
```
* UIButton:

```
//button--圆形    背景为透明 无背景色
- (void)was_setCircleImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image forState:(UIControlState)state;
//button--圆角矩形 背景为透明 无背景色
- (void)was_setRoundRectImageWithUrlString:(NSString *)urlString placeholder:(UIImage *)image cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state;
```

* 修复了placeholder为空时候崩溃问题

# 使用方法
* 在项目中加入SDWebImage
* 将文件夹RoundImage内的UIImage+extension.h与UIImage+extension.m拖入项目
* 导入头文件：#import "UIImage+extension.h"即可

## 注意点：
* 如果背景色为nil的话，理论上会影响流畅度，最好还是讲背景色设为和cell背景色一样，以提高tableview滑动的流畅度。
* 以上提供的方法不会受离屏渲染影响，但是会Color Blended Layers方面的影响，这就是影响到tableview性能的原因，但是影响十分小。

## 缺点：加载的时候会闪一下，原因是先展现了占位图片，之后加载网络图片。
* 当设置占位图为空时，就不会闪了

如果有好的建议可以直接留言或者发送邮件：andysection@gmail.com

thank you for your reading !
