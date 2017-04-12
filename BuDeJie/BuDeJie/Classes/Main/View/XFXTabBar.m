//
//  XFXTabBar.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXTabBar.h"

@interface XFXTabBar ()

@property(nonatomic,weak) UIButton * publishButton;

@end

@implementation XFXTabBar

- (UIButton *)publishButton{

    if(_publishButton == nil ){
    
        UIButton * btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        [self addSubview:btn];
        _publishButton = btn;
        
    }
    return _publishButton;
}

-(void)layoutSubviews{

    [super layoutSubviews];
    //跳转tabBarButton位置
    
    NSInteger count = self.items.count;
    CGFloat btnW = self.bounds.size.width / (count +1);
    CGFloat btnH = self.bounds.size.height;
    CGFloat x = 0;
    int  i = 0;
    
    for(UIView * tabBarButton in self.subviews){
    
        if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
        
            if(i==2){
            
                i+=1;
            }
            
            x = i * btnW;
            
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            
            i++;
        }
    
    }
    //发布按钮位置
    self.publishButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
}

@end
