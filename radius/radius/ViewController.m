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
    UIButton *_btn1;
    UIButton *_btn2;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIImageView *imageView1 = [[UIImageView alloc] init];
    imageView1.frame = CGRectMake(60, 100, 128, 128);
    [self.view addSubview:imageView1];
    _imgView1 = imageView1;
    
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.frame = CGRectMake(60, 300, 128, 128);
    [self.view addSubview:imageView2];
    _imgView2 = imageView2;
    
    UIButton *roundButton = [[UIButton alloc] init];
    roundButton.frame = CGRectMake(200, 100, 128, 128);
    [self.view addSubview:roundButton];
    _btn1 = roundButton;
    
    UIButton *roundRectButton = [[UIButton alloc] init];
    roundRectButton.frame = CGRectMake(200, 300, 128, 128);
    [self.view addSubview:roundRectButton];
    _btn2 = roundRectButton;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"左侧为UIImageView，右侧为UIButton";
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel sizeToFit];
    [self.view addSubview:titleLabel];
    titleLabel.center = CGPointMake(190, 480);
    
    NSURL *url = [NSURL URLWithString:@"http://cc.cocimg.com/api/uploads/20150803/1438567345483993.jpg"];
    
    //圆形
    [_imgView1 was_setCircleImageWithUrl:url placeholder:[UIImage imageNamed:@"head"] fillColor:[UIColor whiteColor]];
    //圆角矩阵
    [_imgView2 was_setRoundRectImageWithUrl:url placeholder:[UIImage imageNamed:@"head"] fillColor:[UIColor whiteColor] cornerRadius:20];
    
    //圆形按钮
    [_btn1 was_setCircleImageWithUrl:url placeholder:[UIImage imageNamed:@"head"] fillColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //圆角矩阵按钮
    [_btn2 was_setRoundRectImageWithUrl:url placeholder:[UIImage imageNamed:@"head"] fillColor:[UIColor whiteColor] cornerRadius:20 forState:UIControlStateNormal];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//}

@end
