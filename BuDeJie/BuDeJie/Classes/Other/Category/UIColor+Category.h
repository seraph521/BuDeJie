//
//  UIColor+Category.h
//  EVA
//
//  Created by Apple on 14/12/15.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue A:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(NSInteger)hexValue;

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;

- (BOOL)isEqualToColor:(UIColor *)otherColor;

- (CGColorSpaceModel)colorSpaceModel;

- (CGFloat)red;

- (CGFloat)green;

- (CGFloat)blue;

- (CGFloat)alpha;

@end
