//
//  UIFont+LayoutFit.m
//  Dream
//
//  Created by eva on 16/2/2.
//  Copyright © 2016年 Eva. All rights reserved.
//

#import "UIFont+LayoutFit.h"

@implementation UIFont (LayoutFit)

+(UIFont *)lf_systemFontOfSize:(CGFloat)fontSize{
    return [UIFont systemFontOfSize:[UIView lf_sizeFromIphone6:fontSize]];
}


+(UIFont *)lf_boldSystemFontOfSize:(CGFloat)fontSize{
    return [UIFont boldSystemFontOfSize:[UIView lf_sizeFromIphone6:fontSize]];
}

+(UIFont *)lf_robotoFontOfSize:(CGFloat)fontSize{
    return [UIFont fontWithName:@"Roboto-Light" size:[UIView lf_sizeFromIphone6:fontSize]];
}

+(UIFont *)lf_robotoFontOfRegularSize:(CGFloat)fontSize{
    return [UIFont fontWithName:@"Roboto-Regular" size:[UIView lf_sizeFromIphone6:fontSize]];
}


+(UIFont *)lf_sourceHanSansFontOfSize:(CGFloat)fontSize{
    
    return [UIFont fontWithName:@"SourceHanSans-Regular" size:[UIView lf_sizeFromIphone6:fontSize]];
    
}

@end
