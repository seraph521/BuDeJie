//
//  UIView+Frame.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setXfx_width:(CGFloat)xfx_width{

    CGRect rect = self.frame;
    rect.size.width = xfx_width;
    self.frame = rect;
}

-(CGFloat)xfx_width{

    return  self.frame.size.width;
}

- (void)setXfx_height:(CGFloat)xfx_height{

    CGRect rect = self.frame;
    rect.size.height = xfx_height;
    self.frame = rect;
}

-(CGFloat)xfx_height{

    return self.frame.size.height;
}

- (void)setXfx_x:(CGFloat)xfx_x{

    CGRect rect = self.frame;
    rect.origin.x = xfx_x;
    self.frame = rect;
}

- (CGFloat)xfx_x{

    return  self.frame.origin.x;
}

- (void)setXfx_y:(CGFloat)xfx_y{

    CGRect rect = self.frame;
    rect.origin.y = xfx_y;
    self.frame = rect;
}

- (CGFloat)xfx_y{

    return  self.frame.origin.y;
}
@end
