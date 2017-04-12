//
//  XFXTabBarController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/11.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXTabBarController.h"
#import "XFXEssenceViewController.h"
#import "XFXFriendTrendViewController.h"
#import "XFXMeViewController.h"
#import "XFXNewViewController.h"
#import "XFXPublicViewController.h"
#import "UIImage+Image.h"
#import "XFXTabBar.h"
#import "XFXNavigationController.h"

@interface XFXTabBarController ()

@end

@implementation XFXTabBarController

//只执行一次,设置颜色，字体
+ (void)load{
    
    UITabBarItem * tabBarItem = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    //字体颜色
    NSMutableDictionary * attrDic = [NSMutableDictionary dictionary];
    attrDic[NSForegroundColorAttributeName] = [UIColor blackColor];
    [tabBarItem setTitleTextAttributes:attrDic forState:UIControlStateSelected];
    //字体大小
    NSMutableDictionary * attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [tabBarItem setTitleTextAttributes:attrsNor forState:UIControlStateNormal];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self setupChildController];
    //设置TabBarItem
    [self setupTabBarItem];
    
    [self setupTabBar];
}

- (void)setupChildController{

    //精华模块
    XFXEssenceViewController * essenceViewController = [[XFXEssenceViewController alloc] init];
    XFXNavigationController * nav1 = [[XFXNavigationController alloc] initWithRootViewController:essenceViewController];
    [self addChildViewController:nav1];
    
    //新帖
    XFXNewViewController * newViewController = [[XFXNewViewController alloc] init];
    XFXNavigationController * nav2 = [[XFXNavigationController alloc] initWithRootViewController:newViewController];
    [self addChildViewController:nav2];
    
    //发布
//    XFXPublicViewController * publicViewController = [[XFXPublicViewController alloc] init];
//    [self addChildViewController:publicViewController];
    
    //关注
    XFXFriendTrendViewController * friendTrendViewController = [[XFXFriendTrendViewController alloc] init];
    XFXNavigationController * nav3 = [[XFXNavigationController alloc] initWithRootViewController:friendTrendViewController];
    [self addChildViewController:nav3];
    
    //我
    XFXMeViewController * meViewController = [[XFXMeViewController alloc] init];
    XFXNavigationController * nav4 = [[XFXNavigationController alloc] initWithRootViewController:meViewController];
    
    [self addChildViewController:nav4];
}

- (void)setupTabBarItem{
    
    //1
    UINavigationController * nav1 = self.childViewControllers[0];
    nav1.tabBarItem.title = @"精华";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    
    //2
    UINavigationController * nav2 = self.childViewControllers[1];
    nav2.tabBarItem.title = @"新帖";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    nav2.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    
//    XFXPublicViewController * publicViewController = self.childViewControllers[2];
//    publicViewController.tabBarItem.title = @"发布";
//    publicViewController.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_icon"];
//    publicViewController.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_publish_click_icon"];
    
    UINavigationController * nav4 = self.childViewControllers[2];
    nav4.tabBarItem.title = @"关注";
    nav4.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav4.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    
    UINavigationController * nav5 = self.childViewControllers[3];
    nav5.tabBarItem.title = @"我";
    nav5.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    nav5.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];

}

- (void)setupTabBar{

    XFXTabBar * tabBar = [[XFXTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}

@end
