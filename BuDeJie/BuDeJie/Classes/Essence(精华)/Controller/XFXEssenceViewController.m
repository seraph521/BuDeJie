//
//  XFXEssenceViewController.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/11.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXEssenceViewController.h"
#import "XFXAllViewController.h"
#import "XFXVideoViewController.h"
#import "XFXVoiceViewController.h"
#import "XFXPictureViewController.h"
#import "XFXWordViewController.h"

#define PADDING 10


@interface XFXEssenceViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView * scrollerView;

@property(nonatomic,strong) NSMutableArray * titlesArray;

@property(nonatomic,strong) NSMutableArray * titlesSizeArray;

@property(nonatomic,strong) NSMutableArray * titlesLabelArray;

@property(nonatomic,strong) UILabel * preLabel;

@property(nonatomic,strong) UIScrollView * titlesView;

@property(nonatomic,strong) UIView * line;

@end

@implementation XFXEssenceViewController


- (NSMutableArray *)titlesArray{

    if(_titlesArray == nil){
    
        _titlesArray = [NSMutableArray array];
        [_titlesArray addObject:@"全部"];
        [_titlesArray addObject:@"视频"];
        [_titlesArray addObject:@"声音"];
        [_titlesArray addObject:@"图片"];
        [_titlesArray addObject:@"段子"];

    }
    return _titlesArray;
}

- (NSMutableArray *)titlesLabelArray{

    if(_titlesLabelArray == nil){
    
        _titlesLabelArray = [[NSMutableArray alloc] init];
        
    }
    return _titlesLabelArray;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    [self setupChildViewController];
    
    [self setupNavBar];
    
    [self setupContentView];
    
    [self setupTitlesView];
    
    [self setupTitleLine];
    
    [self addChildViewToScrollViewWith:0];
    
    
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

- (void)setupChildViewController{

    [self addChildViewController:[[XFXAllViewController alloc] init]];
    [self addChildViewController:[[XFXVideoViewController alloc] init]];
    [self addChildViewController:[[XFXVoiceViewController alloc] init]];
    [self addChildViewController:[[XFXPictureViewController alloc] init]];
    [self addChildViewController:[[XFXWordViewController alloc] init]];
    
}




- (void)setupContentView{

    self.scrollerView = [[UIScrollView alloc] init];
    self.scrollerView.frame = self.view.bounds;
    self.scrollerView.delegate = self;
    self.scrollerView.backgroundColor = [UIColor blueColor];
    self.scrollerView.showsVerticalScrollIndicator = NO;
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    self.scrollerView.pagingEnabled = YES;
    [self.view addSubview:self.scrollerView];
    
    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollViewW = self.scrollerView.xfx_width;
    CGFloat scrollViewH = self.scrollerView.xfx_height;
    
    self.scrollerView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
}

- (void)setupTitlesView{

    self.titlesSizeArray = [NSMutableArray array];
    
    UIScrollView * titlesView = [[UIScrollView alloc] init];
    titlesView.frame = CGRectMake(0, 64, self.view.xfx_width, 35);
    titlesView.showsVerticalScrollIndicator = NO;
    titlesView.showsHorizontalScrollIndicator = NO;
    // 设置半透明背景色
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
//    CGFloat contentW = 0;
    
//    for(int i=0;i<self.titlesArray.count;i++){
//    
//        NSString * itemTitle = self.titlesArray[i];
//        UILabel * itemLabel = [[UILabel alloc] init];
//        itemLabel.textAlignment = NSTextAlignmentCenter;
//        itemLabel.font = [UIFont systemFontOfSize:18];
//        itemLabel.text = itemTitle;
//       // [self.titlesSizeArray addObject:@([itemLabel getTextSize].width+PADDING)];
//        NSLog(@"=======%@",NSStringFromCGSize([itemLabel getTextSize]));
//        itemLabel.frame = CGRectMake(contentW, 0, [itemLabel getTextSize].width+PADDING, 35);
//        [titlesView addSubview:itemLabel];
//        contentW += ([itemLabel getTextSize].width+PADDING);
//        
//       
//    }
    
    CGFloat titleW = SCREEN_WIDTH / self.titlesArray.count;
    
    for (int i=0; i<self.titlesArray.count; i++) {
        
        NSString * itemTitle = self.titlesArray[i];
        UILabel * itemLabel = [[UILabel alloc] init];
        itemLabel.textAlignment = NSTextAlignmentCenter;
        itemLabel.font = [UIFont systemFontOfSize:18];
        itemLabel.text = itemTitle;
        itemLabel.textColor = [UIColor darkGrayColor];
        itemLabel.userInteractionEnabled = YES;
        itemLabel.frame = CGRectMake(titleW * i, 0, titleW, 35);
        
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTitleItem:)];
        [itemLabel addGestureRecognizer:tapGesture];
        
        itemLabel.tag = i;
        [self.titlesLabelArray addObject:itemLabel];
        
        [titlesView addSubview:itemLabel];

    }
    
    titlesView.contentSize = CGSizeMake(SCREEN_WIDTH, 35);
    
}


- (void)setupTitleLine{

    UILabel * label = self.titlesLabelArray[0];
    label.textColor = [UIColor redColor];
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = [UIColor redColor];
    [self.titlesView addSubview:line];
    line.frame = CGRectMake(0, self.titlesView.xfx_height-2, [label getTextSize].width, 2);
    line.xfx_centerX = label.xfx_centerX;
    self.line = line;
    
    self.preLabel = label;
    
}




- (void)clickTitleItem:(UITapGestureRecognizer *) tap{

    UILabel * clickLabel = (UILabel *)tap.view;
   
    [self setTitlelabelSelect:clickLabel];
    self.preLabel = clickLabel;

    [self.scrollerView setContentOffset:CGPointMake(clickLabel.tag * SCREEN_WIDTH, 0)];
}

- (void)setTitlelabelSelect:(UILabel *) selectedlabel{

    self.preLabel.textColor = [UIColor darkGrayColor];
    selectedlabel.textColor = [UIColor redColor];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.line.xfx_centerX = selectedlabel.xfx_centerX;
        self.line.xfx_width = [selectedlabel getTextSize].width;
    } completion:^(BOOL finished) {
        [self addChildViewToScrollViewWith:selectedlabel.tag];
    }];
   

}

- (void)setTitleWithIndex:(int)index{

    UILabel * label = self.titlesLabelArray[index];
    [self setTitlelabelSelect:label];
    self.preLabel = label;
}

- (void)game
{
    XFXLog(@"=====");
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int index =  scrollView.contentOffset.x / self.view.xfx_width;
    
    [self setTitleWithIndex:index];
}




- (void)addChildViewToScrollViewWith:(int) index{

    UIViewController * Vc = self.childViewControllers[index];
    // 如果view已经被加载过，就直接返回
    if (Vc.isViewLoaded) return;
    XFXLog(@"======view已经被加载过");
    // 取出index位置对应的子控制器view
    UIView *childVcView = self.childViewControllers[index].view;
        // 设置子控制器view的frame
    childVcView.frame = self.scrollerView.bounds;
    
    // 添加子控制器的view到scrollView中
    [self.scrollerView addSubview:childVcView];
}











@end
