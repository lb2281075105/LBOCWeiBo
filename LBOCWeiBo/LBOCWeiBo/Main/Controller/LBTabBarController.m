//
//  LBTabBarController.m
//  LBOCWeiBo
//
//  Created by 常金城 on 2018/6/1.
//  Copyright © 2018年 liubo. All rights reserved.
//

#import "LBTabBarController.h"
#import "LBHomeTableVController.h"
#import "LBMessageTableVController.h"
#import "LBMineTableVController.h"
#import "LBDiscoverTableVController.h"
#import "LBNavigationController.h"
//#import "XFTabBar.h"
#import "FXBlurView.h"
//#import "XFComposeViewController.h"
@interface LBTabBarController ()

@end

@implementation LBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置子控制器
    LBHomeTableVController *home = [[LBHomeTableVController alloc]init];
    [self addChildViewController:home title:@"首页" image:@"tabbar_home" selImage:@"tabbar_home_selected"];
    
    
    LBMessageTableVController *messageCenter = [[LBMessageTableVController alloc] init];
    [self addChildViewController:messageCenter title:@"消息" image:@"tabbar_message_center" selImage:@"tabbar_message_center_selected"];
    
    
    LBDiscoverTableVController *discover = [[LBDiscoverTableVController alloc] init];
    [self addChildViewController:discover title:@"发现" image:@"tabbar_discover" selImage:@"tabbar_discover_selected"];
    
    
    LBMineTableVController *profile = [[LBMineTableVController alloc] init];
    [self addChildViewController:profile title:@"我" image:@"tabbar_profile" selImage:@"tabbar_profile_selected"];
}

//添加子控制器
-(void)addChildViewController:(UIViewController *)childVc  title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    
    //设置子控制器的TabBarButton属性
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *AttrDic = [NSMutableDictionary dictionary];
    
    AttrDic[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    [childVc.tabBarItem setTitleTextAttributes:AttrDic forState:UIControlStateNormal];
    
    NSMutableDictionary *selAttr = [NSMutableDictionary dictionary];
    
    selAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    [childVc.tabBarItem setTitleTextAttributes:selAttr forState:UIControlStateSelected];
    
    //让子控制器包装一个导航控制器
    LBNavigationController *nav = [[LBNavigationController alloc]initWithRootViewController:childVc];
    
    
    [self addChildViewController:nav];
    
}

@end
