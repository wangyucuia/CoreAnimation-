//
//  ViewController.m
//  CoreAnimation实现倒影效果
//
//  Created by 王玉翠 on 16/8/17.
//  Copyright © 2016年 王玉翠. All rights reserved.
//http://tuohuang.info/14.html#.V7Qd35N95E5

#import "ViewController.h"
#import "CoreView.h"
@interface ViewController ()

@property (nonatomic, strong) CoreView *coreView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.view setBackgroundColor:[UIColor whiteColor]];
    //   创建一个origin layer，然后将图片设置为它的contents

    CALayer *contentLayer = [CALayer layer];
    UIImage *flag = [UIImage imageNamed:@"屏幕快照 2016-08-17 下午12.00.42"];
    contentLayer.bounds = CGRectMake(0, 0, flag.size.width, flag.size.height);
    contentLayer.contents = (id)flag.CGImage;
    contentLayer.position = CGPointMake(self.view.center.x, 10);
    contentLayer.anchorPoint = CGPointMake(0.5, 0);
    contentLayer.backgroundColor = [UIColor blueColor].CGColor;
    contentLayer.cornerRadius = 4.0;
    CALayer *reflection = [CALayer layer];
    reflection.bounds = contentLayer.bounds;
    reflection.position = CGPointMake(contentLayer.bounds.size.width/2, contentLayer.bounds.size.height * 1.5);
    reflection.contents = contentLayer.contents;
    reflection.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    CALayer *blackLayer = [CALayer layer];
    blackLayer.backgroundColor = [UIColor blackColor].CGColor;
    blackLayer.bounds = reflection.bounds;
    blackLayer.position = CGPointMake(blackLayer.bounds.size.width/2, blackLayer.bounds.size.height);
    blackLayer.opacity = 0.6;
    [reflection addSublayer:blackLayer];
    
    CAGradientLayer *mask = [CAGradientLayer layer];
    mask.bounds = CGRectMake(0, 0, reflection.bounds.size.width, reflection.bounds.size.height /2 );
    mask.position = CGPointMake(mask.bounds.size.width/2, mask.bounds.size.height);
    mask.anchorPoint = CGPointMake(0.5, 0);
    mask.colors = [NSArray arrayWithObjects:
                   (id)[UIColor clearColor].CGColor,
                   (id)[UIColor whiteColor].CGColor, nil
                   ];
    
    reflection.mask = mask;
    
    [contentLayer addSublayer:reflection];
    
    [self.view.layer addSublayer:contentLayer];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
