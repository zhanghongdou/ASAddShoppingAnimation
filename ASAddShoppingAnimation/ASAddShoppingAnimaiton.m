//
//  ASAddShoppingAnimaiton.m
//  ASAddShoppingAnimation
//
//  Created by haohao on 16/11/3.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import "ASAddShoppingAnimaiton.h"
#import "AppDelegate.h"
#define LAYERWIDTH 60.0
@interface ASAddShoppingAnimaiton ()<CAAnimationDelegate>
@property (nonatomic, strong) CAAnimationGroup *groupAnimation;
@end
@implementation ASAddShoppingAnimaiton

+(instancetype)shareAnimation
{
    return [[ASAddShoppingAnimaiton alloc]init];
}

-(void)startAnimationWithView:(UIView *)view WithAbsoluteFrame:(CGRect)viewRect ToFinishPoint:(CGPoint)toPoint WithFinishBlock:(FinishBlock)block
{
    //设置layer的背景图片，苹果给的id类型，只要是id都能编译通过，但是实际上必须是CGimage才行
    self.animationLayer = [CALayer layer];
    self.animationLayer.contents = view.layer.contents;
    //相当于view的contentMode
    self.animationLayer.contentsGravity = kCAGravityResizeAspectFill;
    self.animationLayer.bounds = CGRectMake(0, 0, LAYERWIDTH, LAYERWIDTH);
    self.animationLayer.anchorPoint = CGPointMake(0.5, 0.5);
    self.animationLayer.position = CGPointMake( CGRectGetMidX(viewRect), CGRectGetMidY(viewRect));
    self.animationLayer.cornerRadius = LAYERWIDTH / 2;
   self.animationLayer.masksToBounds = YES;
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.window.layer addSublayer:self.animationLayer];
    //绘制路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.animationLayer.position];
    [bezierPath addQuadCurveToPoint:toPoint controlPoint:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, viewRect.origin.y - 80)];
    
    //设计动画，二次曲线路径，旋转过程,透明度，缩放
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:Attributes_Position];
    pathAnimation.delegate = self;
    pathAnimation.path = bezierPath.CGPath;
    
    //旋转
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:Attributes_RotationZ];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:12];
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    //透明度
    CABasicAnimation *opacityAniamtion = [CABasicAnimation animationWithKeyPath:Attributes_Opacity];
    opacityAniamtion.fromValue = [NSNumber numberWithFloat:1];
    opacityAniamtion.fromValue = [NSNumber numberWithFloat:0.4];
    opacityAniamtion.removedOnCompletion = NO;
    opacityAniamtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    //缩放
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:Attributes_Scale];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    self.groupAnimation = [CAAnimationGroup animation];
    self.groupAnimation.animations = @[pathAnimation, rotationAnimation, opacityAniamtion, scaleAnimation];
    self.groupAnimation.duration = 1.5f;
    self.groupAnimation.removedOnCompletion = NO;
    self.groupAnimation.fillMode = kCAFillModeForwards;
    self.groupAnimation.delegate = self;
    
    [self.animationLayer addAnimation:self.groupAnimation forKey:@"groupAnimation"];
    
    self.finishBlock = block;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [self.animationLayer animationForKey:@"groupAnimation"]) {
        [self.animationLayer removeFromSuperlayer];
        self.animationLayer = nil;
        if (self.finishBlock) {
            self.finishBlock();
        }
    }
}

+(void)shakeAnimationWith:(UIView *)shakeView
{
    CABasicAnimation *shakeAniamation = [CABasicAnimation animationWithKeyPath:Attributes_TranslationY];
    shakeAniamation.fromValue = [NSNumber numberWithFloat:-5];
    shakeAniamation.fromValue = [NSNumber numberWithBool:4];
    shakeAniamation.autoreverses = YES;
    shakeAniamation.duration = 0.25f;
    [shakeView.layer addAnimation:shakeAniamation forKey:@"shakeAniamation"];
}
@end















