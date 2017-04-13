
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

@end

@implementation XFXLoginRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XFXLoginRegisterView * loginView = [XFXLoginRegisterView loginView];
    [self.middleView addSubview:loginView];
}

- (IBAction)clickCloseBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickRegisterBtn:(id)sender {
}

@end
