//
//  XFXEssenceViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/11.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXEssenceViewController.h"

@interface XFXEssenceViewController ()

@end

@implementation XFXEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupNavBar];
}

- (void)setupNavBar{

    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"nav_item_game_icon"] highImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"navigationButtonRandom"] highImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:nil action:nil];
    
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}

- (void)game
{
    XFXLog(@"=====");
}



@end
