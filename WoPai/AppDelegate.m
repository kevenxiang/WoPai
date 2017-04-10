//
//  AppDelegate.m
//  WoPai
//
//  Created by xiang on 2017/4/10.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "AppDelegate.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setNavigationBarStyle];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self showMainViewController];
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

#pragma mark - gettings and settings
//设置导航栏和状态栏的样式
- (void)setNavigationBarStyle {
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    //    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTintColor:[UIColor magentaColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kRGBCOLOR(235, 72, 139),NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:18], NSFontAttributeName, nil]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:18], NSFontAttributeName, nil]];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)showMainViewController {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    FindViewController *find = [[FindViewController alloc] init];
    UINavigationController *findNav = [[UINavigationController alloc] initWithRootViewController:find];
    
    MineViewController *mine = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mine];
    
    _tabBarController = [[CYLTabBarController alloc] init];
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"发现",
                            CYLTabBarItemImage : @"发现",
                            CYLTabBarItemSelectedImage : @"发现-1"
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"我",
                            CYLTabBarItemSelectedImage : @"我-1"
                            };
    
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       ];
    _tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    _tabBarController.delegate = (id<UITabBarControllerDelegate>) self;
    _tabBarController.tabBar.tintColor = [UIColor magentaColor];
    
    [_tabBarController setViewControllers:@[
                                            findNav,
                                            mineNav,
                                            ]];
    self.window.rootViewController = _tabBarController;
}


@end
























