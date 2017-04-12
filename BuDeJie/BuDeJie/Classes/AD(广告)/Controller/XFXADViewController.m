//
//  XFXADViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXADViewController.h"
#import "XFXADItem.h"
#import "XFXTabBarController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface XFXADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property(nonatomic,strong) UIView * contentView;
@property(nonatomic,strong) UIImageView * contentImageView;

@property (nonatomic, strong) XFXADItem *item;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation XFXADViewController

- (UIView *)contentView{

    if(_contentView == nil){
        
        UIView * contentView = [[UIView alloc] init];
        contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.frame = contentView.frame;
        [contentView addSubview:imageView];
        _contentImageView = imageView;
        
        [self.launchImageView addSubview:contentView];
        UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAD)];
        [self.contentImageView addGestureRecognizer:recognizer];
        self.launchImageView .userInteractionEnabled = YES;
        _contentImageView.userInteractionEnabled = YES;
        _contentView = contentView;
    }
    return _contentView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLaunchImageView];
    
    [self loadAdData];
    // 创建定时器
    _timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}


- (void)timeChange
{
    // 倒计时
    static int i = 3;
    
    if (i == 0) {
        
        [self jumpBtnClick:nil];
        
    }
    
    i--;
    
    // 设置跳转按钮文字
    [_jumpBtn setTitle:[NSString stringWithFormat:@"跳转 (%d)",i] forState:UIControlStateNormal];
}



- (IBAction)jumpBtnClick:(UIButton *)sender {
    
    XFXTabBarController * tabBarController = [[XFXTabBarController alloc] init];
    // 销毁广告界面,进入主框架界面
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarController;
    
    // 定时器
    [_timer invalidate];
}

- (void)showAD{

    NSURL * url = [NSURL URLWithString:@"http://campaign.rong360.com/sem/51/index.html?utm_source=baidu&utm_medium=dsp&utm_campaign=40"];
    UIApplication * application = [UIApplication sharedApplication];
    if([application canOpenURL:url]){
        [application openURL:url];
    }
}

- (void)loadAdData{

    
    self.contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    // 加载广告网页
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:@"http://ubmcmm.baidustatic.com/media/v1/0f0005PuIe4MRu5WMDdeS0.jpg"]];
    // 1.创建请求会话管理者
   // AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    
    // 3.发送请求
//    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
//        
//        // 获取字典
//        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
//        
//        // 字典转模型
//        _item = [XFXADItem mj_objectWithKeyValues:adDict];
//        
//        // 创建UIImageView展示图片 =>
//        CGFloat h = SCREEN_WIDTH / _item.w * _item.h;
//        
//        self.contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, h);
//        // 加载广告网页
//        [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        NSLog(@"%@",error);
//        
//    }];

    
}

//设置启动图
- (void)setupLaunchImageView{

    if (iPhone6p) { // 6p
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone6) { // 6
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) { // 5
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"];
        
    } else if (iPhone4) { // 4
        
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }

}

@end
