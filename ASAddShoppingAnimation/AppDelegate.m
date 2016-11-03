//
//  AppDelegate.m
//  ASAddShoppingAnimation
//
//  Created by haohao on 16/11/3.
//  Copyright © 2016年 haohao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SubViewController.h"
#import "ThrViewController.h"
#import "ForViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    ViewController *vc1 = [[ViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    vc1.title = @"首页";
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[[UIImage imageNamed:@"tab_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    ThrViewController *vc2 = [[ThrViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc2];
    vc2.title = @"Second";
    nav3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Second" image:[[UIImage imageNamed:@"tab_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    SubViewController *subVC = [[SubViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:subVC];
    subVC.title = @"购物车";
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"购物车" image:[[UIImage imageNamed:@"shopping"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"shopping"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    ForViewController *vc4 = [[ForViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    vc4.title = @"个人中心";
    nav4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"个人中心" image:[[UIImage imageNamed:@"tab_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tab_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    [tabBarController setViewControllers:@[nav1, nav3, nav2, nav4]];
    [tabBarController setSelectedIndex:0];
    self.window.rootViewController = tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
