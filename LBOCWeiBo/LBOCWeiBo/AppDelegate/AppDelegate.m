//
//  AppDelegate.m
//  LBOCWeiBo
//
//  Created by 常金城 on 2018/6/1.
//  Copyright © 2018年 liubo. All rights reserved.
//

#import "AppDelegate.h"
#import "LBTabBarController.h"
#import "LBAccount.h"
#import "LBAccountTool.h"
#import "LBOAuthController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
        
    // 显示窗口
    [self.window makeKeyAndVisible];
    //设置根控制器
    LBAccount *account = [LBAccountTool account];
    
    // 显示窗口
    [self.window makeKeyAndVisible];
    
    if (account) {
        
        self.window.rootViewController = [[LBTabBarController alloc]init];

    } else{
        
        self.window.rootViewController = [[LBOAuthController alloc]init];
    }
        
    return YES;
}
@end
