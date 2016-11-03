//
//  CustomCell.m
//  ASAddShoppingAnimation
//
//  Created by haohao on 16/11/3.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.addBtn addTarget:self action:@selector(btnCLick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)creatBtnTag:(NSInteger)index
{
    self.addBtn.tag = index;
}


-(void)btnCLick:(UIButton *)sender
{
    if (self.block) {
        self.block(sender.tag,self.imageView1);
    }
}


@end
