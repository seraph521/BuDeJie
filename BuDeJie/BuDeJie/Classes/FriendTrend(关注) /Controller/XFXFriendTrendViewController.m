//
//  XFXFriendTrendViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/11.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXFriendTrendViewController.h"

@interface XFXFriendTrendViewController ()

@end

@implementation XFXFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setupNavBar];
}

- (void)setupNavBar{

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"friendsRecommentIcon"] highImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecomment)];
    
    // titleView
    self.navigationItem.title = @"我的关注";
}

- (void)friendsRecomment{

    XFXLog(@"我的关注");
}

@end
