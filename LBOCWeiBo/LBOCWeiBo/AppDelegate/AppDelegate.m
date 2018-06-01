//
//  AppDelegate.m
//  LBOCWeiBo
//
//  Created by 常金城 on 2018/6/1.
//  Copyright © 2018年 liubo. All rights reserved.
//

#import "AppDelegate.h"
#import "LBTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
        
    // 显示窗口
    [self.window makeKeyAndVisible];

        
    self.window.rootViewController = [[LBTabBarController alloc]init];

    return YES;
}
@end
