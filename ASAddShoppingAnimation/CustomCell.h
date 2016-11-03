//
//  CustomCell.h
//  ASAddShoppingAnimation
//
//  Created by haohao on 16/11/3.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickBlock)(NSInteger index, UIImageView *imageView);
@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (nonatomic, copy) ClickBlock block;
-(void)creatBtnTag:(NSInteger)index;
@end
