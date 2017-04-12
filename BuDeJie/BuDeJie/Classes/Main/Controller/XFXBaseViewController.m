//
//  XFXBaseViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXBaseViewController.h"

@interface XFXBaseViewController ()

@end

@implementation XFXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBarSetting];
}

#pragma mark - 导航控制器设定
-(void)navigationBarSetting
{
    NSMutableDictionary * attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = DreamColor(20, 20, 20);
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [self.navigationController.navigationBar setTitleTextAttributes:attr];
    
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil];
    item.tintColor = DreamColor(20, 20, 20);
    
    NSMutableDictionary * itemAttr = [NSMutableDictionary dictionary];
    itemAttr[NSForegroundColorAttributeName] = DreamColor(20, 20, 20);
    itemAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:itemAttr forState:UIControlStateNormal];
    
    //去掉灰色线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage createImageWithColor:[UIColor clearColor]]];
}

- (void)setupMainNavBackWithColor:(UIColor *)color
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIImage * arrowImage = [UIImage imageNamed:@"main_nav_back"];
    arrowImage = [arrowImage imageWithColor:color];
    UIButton * navBackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, arrowImage.size.width, arrowImage.size.height)];
    [navBackButton setImage:arrowImage forState:UIControlStateNormal];
    [navBackButton addTarget:self action:@selector(handleNavBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:navBackButton];
    UIBarButtonItem * leftNegativeSpacer = [[UIBarButtonItem alloc]
                                            initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                            target:nil action:nil];
    leftNegativeSpacer.width = -5;
    self.navigationItem.leftBarButtonItems = @[leftNegativeSpacer,leftItem];
}

- (void)setupMainNavBack
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIImage * arrowImage = [UIImage imageNamed:@"main_nav_back"];
    UIButton * navBackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, arrowImage.size.width, arrowImage.size.height)];
    [navBackButton setImage:arrowImage forState:UIControlStateNormal];
    [navBackButton addTarget:self action:@selector(handleNavBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:navBackButton];
    UIBarButtonItem * leftNegativeSpacer = [[UIBarButtonItem alloc]
                                            initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                            target:nil action:nil];
    leftNegativeSpacer.width = -10;
    self.navigationItem.leftBarButtonItems = @[leftNegativeSpacer,leftItem];
}

- (void)handleNavBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
