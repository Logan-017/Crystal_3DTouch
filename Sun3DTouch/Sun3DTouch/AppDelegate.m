//
//  AppDelegate.m
//  Sun3DTouch
//
//  Created by david on 2017/9/18.
//  Copyright © 2017年 David. All rights reserved.
//

#import "AppDelegate.h"

#import "SunMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    SunMainViewController *mainVC = [[SunMainViewController alloc] init];
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = navigationVC;
    
    
    [self setUp3DTouch];
    return YES;
}

#pragma mark - 设置3DTouch
- (void)setUp3DTouch{
 
   NSMutableArray *arrShortcutItem = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
    
    UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"com.sunday.3DTouchDemo.openSearch" localizedTitle:@"搜索" localizedSubtitle:@"搜索副标题" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    
    UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"com.sunday.3DTouchDemo.openCompose" localizedTitle:@"发消息" localizedSubtitle:@"搜索副标题" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    
    [arrShortcutItem addObject:shortItem1];
    [arrShortcutItem addObject:shortItem2];

    [UIApplication sharedApplication].shortcutItems = arrShortcutItem;
    
}

#pragma mark - 3DTouch主屏菜单点击回调
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法

    NSLog(@"name:%@ type:%@", shortcutItem.localizedTitle, shortcutItem.type);
    
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
