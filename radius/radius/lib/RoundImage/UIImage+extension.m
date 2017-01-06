//
//  UIImage+extension.m
//  Redious
//
//  Created by admin on 16/12/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "UIImage+extension.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@implementation UIImage (extension)
- (void)was_roundImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
//        NSTimeInterval start = CACurrentMediaTime();
        
        // 1. 利用绘图，建立上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        // 2. 设置填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        
        // 3. 利用 贝赛尔路径 `裁切 效果
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [path addClip];
        
        // 4. 绘制图像
        [self drawInRect:rect];
        
        // 5. 取得结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
//        NSLog(@"%f", CACurrentMediaTime() - start);
        
        // 7. 完成回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion != nil) {
                completion(result);
            }
        });
    });
}

//圆角矩形
- (void)was_roundRectImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor radius:(CGFloat)radius completion:(void (^)(UIImage *))completion {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //        NSTimeInterval start = CACurrentMediaTime();
        
        // 1. 利用绘图，建立上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        // 2. 设置填充颜色
        [fillColor setFill];
        UIRectFill(rect);
        
        // 3. 利用 贝赛尔路径 `裁切 效果
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
//        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [path addClip];
        
        // 4. 绘制图像
        [self drawInRect:rect];
        
        // 5. 取得结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
        //        NSLog(@"%f", CACurrentMediaTime() - start);
        
        // 7. 完成回调
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion != nil) {
                completion(result);
            }
        });
    });
}

@end

#pragma mark - UIImageView
@implementation UIImageView (Extension)
//圆
- (void)was_setCircleImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color{
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    //1.现将占位图圆角化，这样就避免了如图片下载失败，使用占位图的时候占位图不是圆角的问题
    [image was_roundImageWithSize:size fillColor:color completion:^(UIImage *radiusPlaceHolder) {
        
        //2.使用sd的方法缓存异步下载的图片
        [weakSelf sd_setImageWithURL:url placeholderImage:radiusPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundImageWithSize:size fillColor:color completion:^(UIImage *radiusImage) {
                weakSelf.image = radiusImage;
            }];
            
        }];
        
    }];
}

//圆形矩阵
- (void)was_setRoundRectImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius{
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    //1.现将占位图圆角化，这样就避免了如图片下载失败，使用占位图的时候占位图不是圆角的问题
    [image was_roundRectImageWithSize:size fillColor:color radius:cornerRadius completion:^(UIImage *roundRectPlaceHolder) {
        
        //2.使用sd的方法缓存异步下载的图片
        [weakSelf sd_setImageWithURL:url placeholderImage:roundRectPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundRectImageWithSize:size fillColor:color radius:cornerRadius completion:^(UIImage *radiusImage) {
                weakSelf.image = radiusImage;
            }];
            
        }];
        
    }];

}

@end

#pragma mark - UIButton

@implementation UIButton (Extension)
//圆形
- (void)was_setCircleImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color forState:(UIControlState)state {
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    //占位处理
    [image was_roundImageWithSize:size fillColor:color completion:^(UIImage *radiusPlaceHolder) {
        //sd
        [weakSelf sd_setImageWithURL:url forState:state placeholderImage:radiusPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundImageWithSize:size fillColor:color completion:^(UIImage *radiusImage) {
                [weakSelf setImage:radiusImage forState:state];
            }];
            
        }];
        
    }];
}
//圆角矩阵
- (void)was_setRoundRectImageWithUrl:(NSURL *)url placeholder:(UIImage *)image fillColor:(UIColor *)color cornerRadius:(CGFloat) cornerRadius forState:(UIControlState)state{
    __weak typeof(self) weakSelf = self;
    CGSize size = self.frame.size;
    
    //占位处理
    [image was_roundRectImageWithSize:size fillColor:color radius:cornerRadius completion:^(UIImage *roundRectPlaceHolder) {
        //sd
        [weakSelf sd_setImageWithURL:url forState:state placeholderImage:roundRectPlaceHolder completed:^(UIImage *img, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //3.如果下载成功那么讲下载成功的图进行圆角化
            [img was_roundRectImageWithSize:size fillColor:color radius:cornerRadius completion:^(UIImage *roundRectImage) {
                [weakSelf setImage:roundRectImage forState:state];
            }];
            
        }];
        
    }];

}

@end
