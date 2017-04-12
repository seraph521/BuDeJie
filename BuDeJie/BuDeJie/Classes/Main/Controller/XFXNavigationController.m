//
//  XFXNavigationController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXNavigationController.h"

@interface XFXNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XFXNavigationController

+(void)load{

    UINavigationBar *navBar = [UINavigationBar appearance];
    // 只要是通过模型设置,都是通过富文本设置
    // 设置导航条标题 => UINavigationBar
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    
    // 设置导航条背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    //导航栏不透明
//    if([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
//        [navBar setTranslucent:NO];
//    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.isHiddenBottom = YES;
    //修复自定义导航按钮导致手势返回失败
    __weak typeof (self) weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.interactivePopGestureRecognizer.delaysTouchesBegan = NO;
    }

}

//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    viewController.hidesBottomBarWhenPushed = self.isHiddenBottom;
    self.isHiddenBottom = YES;
    if (self.childViewControllers.count > 0) { // 非根控制器
        
        // 设置返回按钮,只有非根控制器
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithimage:[UIImage imageNamed:@"navigationButtonReturn"] highImage:[UIImage imageNamed:@"navigationButtonReturnClick"]  target:self action:@selector(back) title:@"返回"];
    }

    if([self respondsToSelector:@selector(pushViewController:animated:)]){
    
        [super pushViewController:viewController animated:animated];
    }
    
}

- (void)back{

    [self popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotate{

    return NO;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.childViewControllers count] == 1) {
        return NO;
    }
    return YES;
}

// 我们差不多能猜到是因为手势冲突导致的，那我们就先让 ViewController 同时接受多个手势吧。
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


@end
