//
//  UIImage+extension.h
//  Redious
//
//  Created by admin on 16/12/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (extension)
- (void)was_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion;

- (void)was_roundRectImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor radius:(CGFloat)radius completion:(void (^)(UIImage *))completion;

- (void)setCircleImageWithUrl:(NSString *)url placeholder:(UIImage *)image;

@end
