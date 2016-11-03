//
//  ViewController.m
//  ASAddShoppingAnimation
//
//  Created by haohao on 16/11/3.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import "ViewController.h"
#import "ASAddShoppingAnimaiton.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *addbtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.imageView.image = [UIImage imageNamed:@"11"];
    [self.view addSubview:self.imageView];
    
    self.addbtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addbtn setBackgroundColor:[UIColor lightGrayColor]];
    [self.addbtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.addbtn addTarget:self action:@selector(ClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    self.addbtn.frame = CGRectMake(100, 300, 100, 30);
    [self.view addSubview:self.addbtn];
}

-(void)ClickEvent:(UIButton *)sender
{
    [[ASAddShoppingAnimaiton shareAnimation]startAnimationWithView:self.imageView WithAbsoluteFrame:self.imageView.frame ToFinishPoint:CGPointMake(kScreenWidth / 4 * 2.5, kScreenHeight - 49) WithFinishBlock:^{
        UIView *tabbarBtn = self.tabBarController.tabBar.subviews[3];
        [ASAddShoppingAnimaiton shakeAnimationWith:tabbarBtn];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
