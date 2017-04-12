//
//  XFXMeViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/11.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXMeViewController.h"

@interface XFXMeViewController ()

@end

@implementation XFXMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
}

- (void)setupNavBar
{
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    
    // 设置
    UIBarButtonItem *settingItem =  [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"mine-setting-icon"] highImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    
    // 夜间模型
    UIBarButtonItem *nightItem =  [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"mine-moon-icon"] selImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    
    // titleView
    self.navigationItem.title = @"我的";
    
    
}

- (void)night:(UIButton *)button
{
    button.selected = !button.selected;
    
}

#pragma mark - 设置就会调用
- (void)setting
{
    UIViewController * setVc = [[UIViewController alloc] init];
    [self.navigationController pushViewController:setVc animated:YES];
}

@end
