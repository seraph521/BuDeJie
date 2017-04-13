//
//  XFXFriendTrendViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/11.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXFriendTrendViewController.h"
#import "XFXLoginRegisterViewController.h"

@interface XFXFriendTrendViewController ()

@end

@implementation XFXFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
}

- (void)setupNavBar{

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithimage:[UIImage imageNamed:@"friendsRecommentIcon"] highImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecomment)];
    
    // titleView
    self.navigationItem.title = @"我的关注";
}
- (IBAction)clickLoginRegisterBtn:(id)sender {
    
    XFXLoginRegisterViewController * loginRegisterViewController = [[XFXLoginRegisterViewController alloc] init];
    [self presentViewController:loginRegisterViewController animated:YES completion:nil];
    
}

- (void)friendsRecomment{

    XFXLog(@"我的关注");
}

@end
