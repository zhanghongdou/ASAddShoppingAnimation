//
//  SubViewController.m
//  ASAddShoppingAnimation
//
//  Created by haohao on 16/11/3.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import "SubViewController.h"
#import "CustomCell.h"
#import "ASAddShoppingAnimaiton.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SubViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self creatTableView];
    
}

-(void)creatTableView
{
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell creatBtnTag:indexPath.row];
    cell.block= ^(NSInteger index, UIImageView *imageView) {
        
        [[ASAddShoppingAnimaiton shareAnimation]startAnimationWithView:imageView WithAbsoluteFrame:[imageView convertRect:imageView.frame toView:self.view] ToFinishPoint:CGPointMake(kScreenWidth / 4 * 2.5, kScreenHeight - 49) WithFinishBlock:^{
            UIView *tabbarBtn = self.tabBarController.tabBar.subviews[3];
            [ASAddShoppingAnimaiton shakeAnimationWith:tabbarBtn];
        }];
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
