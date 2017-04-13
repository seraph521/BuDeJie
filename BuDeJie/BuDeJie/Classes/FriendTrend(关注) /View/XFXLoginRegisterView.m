//
//  XFXLoginRegisterView.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/13.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXLoginRegisterView.h"

@interface XFXLoginRegisterView ()
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterBtn;

@end


@implementation XFXLoginRegisterView

+ (instancetype)loginView{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
+ (instancetype)registerView{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    
}

- (void)awakeFromNib{

    UIImage *image = _loginRegisterBtn.currentBackgroundImage;
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 让按钮背景图片不要被拉伸
    [_loginRegisterBtn setBackgroundImage:image forState:UIControlStateNormal];
}

@end
