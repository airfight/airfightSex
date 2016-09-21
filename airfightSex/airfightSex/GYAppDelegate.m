//
//  AppDelegate.m
//  airfightSex
//
//  Created by giant on 16/9/11.
//  Copyright © 2016年 giant. All rights reserved.
//

#import "GYAppDelegate.h"
#import "GYCustomTabbar.h"
#import "GYTabBar.h"
#import "ViewController.h"


@interface GYAppDelegate () <GYTabBarDelegate>

@end

@implementation GYAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [JSPatch startWithAppKey:kJSPatchAppKey];
    //
    //    [JSPatch testScriptInBundle];
    [JSPatch sync];
    
    //    [JPEngine startEngine];
    //    [JPEngine setVersion:2];
    //
    //    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    //    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    //    
    //    [JPEngine evaluateScript:script];
    
    //    [JSPatch setupLogger:^(NSString *msg) {
    //        NSLog(@"%@", msg);
    //
    //    }];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
#if 0
    //默认图片
    NSArray *images = @[@"tabbar_1",@"tabbar_2",@"tabbar_3",@"tabbar_4"];
    
    // 选中后的图片
    NSArray *selectImages = @[@"tabbar_1_h",@"tabbar_2_h",@"tabbar_3_h",@"tabbar_4_h"];
    
    //标题
    NSArray *titles = @[@"微信",
                        @"发现",
                        @"好友",
                        @"我的"];
    
    GYCustomTabbar *tabbar = [[GYCustomTabbar alloc] initWith:@[@"ViewController",@"ViewController",@"ViewController",@"ViewController"] andImages:images andSelectArr:selectImages andTitle:titles];
    
    self.window.rootViewController = tabbar;
#endif
    
#if 1
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[[[ViewController alloc] init], [[UIViewController alloc] init], [[ViewController alloc] init], [[UIViewController alloc] init]];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    GYTabBar *tabBar = [[GYTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    
    tabBar.tabBarItemAttributes = @[@{kGYTabBarButtonTitle: @"藏书馆", kGYTabBarButtonNomalImage: @"home_normal", kGYTabBarButtonSelectedImage: @"home_highlight",kGYTabBarButtonType: @(GYTabBarButtonNomal)},
                                       @{kGYTabBarButtonTitle : @"借书", kGYTabBarButtonNomalImage : @"message_normal", kGYTabBarButtonSelectedImage : @"message_highlight", kGYTabBarButtonType : @(GYTabBarButtonNomal)},
                                  
                                    @{kGYTabBarButtonTitle : @"发布", kGYTabBarButtonNomalImage : @"post_normal", kGYTabBarButtonSelectedImage : @"post_normal", kGYTabBarButtonType : @(GYTabBarButtonRise)},
                                      @{kGYTabBarButtonTitle : @"发现", kGYTabBarButtonNomalImage : @"mycity_normal", kGYTabBarButtonSelectedImage : @"mycity_highlight", kGYTabBarButtonType : @(GYTabBarButtonNomal)},
                                 
                                    @{kGYTabBarButtonTitle : @"我的", kGYTabBarButtonNomalImage : @"account_normal", kGYTabBarButtonSelectedImage : @"account_highlight", kGYTabBarButtonType : @(GYTabBarButtonNomal)}];
    
    tabBar.delegate = self;
    [tabBarController.tabBar addSubview:tabBar];
    
    self.window.rootViewController = tabBarController;
#endif
    return YES;
}


- (void)tabBarDidSelectedRiseButton {
    
    NSLog(@"点击了突出的按钮");
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
