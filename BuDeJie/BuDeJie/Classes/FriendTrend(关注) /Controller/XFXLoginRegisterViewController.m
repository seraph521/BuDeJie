
//
//  XFXLoginRegisterViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/13.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXLoginRegisterViewController.h"
#import "XFXLoginRegisterView.h"

@interface XFXLoginRegisterViewController ()

@property (weak, nonatomic) IBOutlet UIView *middleView;

@property(nonatomic,strong) XFXLoginRegisterView * loginView;

@property(nonatomic,strong) XFXLoginRegisterView * registerView;

@end

@implementation XFXLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XFXLoginRegisterView * loginView = [XFXLoginRegisterView loginView];
    XFXLoginRegisterView * registerView = [XFXLoginRegisterView registerView];
    [self.middleView addSubview:loginView];
    [self.middleView addSubview:registerView];
    _loginView = loginView;
    _registerView = registerView;
    
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
    }];
    [registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginView.mas_right);
        make.top.mas_equalTo(loginView.mas_top);
    }];
}

- (IBAction)clickCloseBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickRegisterBtn:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.middleView.frame = CGRectMake(-375, self.middleView.frame.origin.y, self.middleView.width, self.middleView.height);
    }];
    [self.view layoutIfNeeded];
}

@end
