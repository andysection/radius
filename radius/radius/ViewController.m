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
    UIImageView *_imgView1;
    UIImageView *_imgView2;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIImageView *imageView1 = [[UIImageView alloc] init];
    imageView1.frame = CGRectMake(123, 100, 128, 128);
    [self.view addSubview:imageView1];
    _imgView1 = imageView1;
    
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.frame = CGRectMake(123, 300, 128, 128);
    [self.view addSubview:imageView2];
    _imgView2 = imageView2;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"click on the window";
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel sizeToFit];
    [self.view addSubview:titleLabel];
    titleLabel.center = CGPointMake(190, 480);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSURL *url = [NSURL URLWithString:@"http://cc.cocimg.com/api/uploads/20150803/1438567345483993.jpg"];
    
    //圆形
    [_imgView1 setCircleImageWithUrl:url placeholder:[UIImage imageNamed:@"head"] fillColor:[UIColor whiteColor]];
    //圆角矩阵
    [_imgView2 setRoundRectImageWithUrl:url placeholder:[UIImage imageNamed:@"head"] fillColor:[UIColor whiteColor] cornerRadius:20];
}

-(void)noti{
    /*
     http://www.jianshu.com/p/4f505ac1bdc9
     */
}


@end
