//
//  ASAddShoppingAnimaiton.h
//  ASAddShoppingAnimation
//
//  Created by haohao on 16/11/3.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^FinishBlock)();
static  NSString *Attributes_Position     =  @"position";
static  NSString *Attributes_RotationZ    =  @"transform.rotation.z";
static  NSString *Attributes_Scale        =  @"transform.scale";
static  NSString *Attributes_Opacity      =  @"opacity";
static  NSString *Attributes_TranslationY =  @"transform.translation.y";
@interface ASAddShoppingAnimaiton : NSObject

@property (nonatomic, strong) CALayer *animationLayer;

@property (nonatomic, copy) FinishBlock finishBlock;

/*
 *类方法进行初始化
 */
+(instancetype)shareAnimation;

/**
 *  开始动画
 *
 *  @param view            实现动画的view
 *  @param viewRect        view 的绝对frame
 *  @param toPoint         下落的坐标
 *  @param block           动画完成回调
 */
-(void)startAnimationWithView:(UIView *)view WithAbsoluteFrame:(CGRect)viewRect ToFinishPoint:(CGPoint)toPoint WithFinishBlock:(FinishBlock)block;

/*
 *抖动动画
 */
+(void)shakeAnimationWith:(UIView *)shakeView;

@end
