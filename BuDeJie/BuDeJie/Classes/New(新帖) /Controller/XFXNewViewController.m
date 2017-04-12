//
//  XFXNewViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/11.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXNewViewController.h"
#import "XFXSubTagViewController.h"

@interface XFXNewViewController ()

@end

@implementation XFXNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setupNavBar];
    
}

#pragma mark - 设置导航条
- (void)setupNavBar
{
    
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagClick)];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}

#pragma mark - 点击订阅标签调用
- (void)tagClick
{
    XFXSubTagViewController * subTagViewController = [[XFXSubTagViewController alloc] init];
    [self.navigationController pushViewController:subTagViewController animated:YES];
}



@end
