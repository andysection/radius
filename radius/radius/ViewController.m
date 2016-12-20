//
//  ViewController.m
//  radius
//
//  Created by admin on 16/12/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+extension.h"

@interface ViewController ()
@end

@implementation ViewController{
    UIImageView *_imgView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 100, 128, 128);
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:imageView];
    _imgView = imageView;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSURL *url = [NSURL URLWithString:@"http://cc.cocimg.com/api/uploads/20150803/1438567345483993.jpg"];
    [_imgView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"image:%@;\n imgView.image:%@",image,_imgView.image);
        [image was_roundRectImageWithSize:_imgView.bounds.size fillColor:[UIColor orangeColor] radius:10 completion:^(UIImage *img) {
            _imgView.image = img;
        }];
    }];
}


@end
