# radius
roundRect or round Image
# 结合SDWebImage实现圆角图片或圆角矩形图片(也可实现静态图片圆角功能)
## 网络下载图片
> 思路1：通过SD提供的函数：

```
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;
```
在completedBlock中将image贝塞尔切割为圆角图片或圆角矩形图

但是在实现以后发现，一旦图片下载失败，那么sd不会调用completedBlock，无法实现placeholder占位图片圆角，所以产生了新的思路

> 思路2：直接将placeholder占位图直接处理为圆角图片，然后再调用sd提供的函数。

## 目前可支持UIImageView和UIButton分别调用方法：
* UIImageView:
```
//网络延迟下载--圆形
- (void)was_setCircleImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color;
//网络延迟下载--圆形矩阵
- (void)was_setRoundRectImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius;
```
* UIButton:
```
//button--圆形
- (void)was_setCircleImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color forState:(UIControlState)state;
//button--圆角矩形
- (void)was_setRoundRectImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state;
```
## 对于静态图片，直接UIImage对象调用以下方法即可：
```
//圆形
- (void)was_roundImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion;
//圆角矩阵
- (void)was_roundRectImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor radius:(CGFloat)radius completion:(void (^)(UIImage *))completion;
```
# 使用方法
* 在项目中加入SDWebImage
* 将文件夹RoundImage内的UIImage+extension.h与UIImage+extension.m拖入项目
* 导入头文件：#import "UIImage+extension.h"即可

## 缺点：加载的时候会闪一下，原因是先展现了占位图片，之后加载网络图片。
如果有好的建议可以直接留言或者发送邮件：andysection@gmail.com

thank you for your reading !
