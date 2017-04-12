//
//  UITextField+Category.m
//  Yoal
//
//  Created by eva on 15/10/13.
//  Copyright © 2015年 Eva. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

- (CGSize)getTextSizeWithFont:(UIFont *)font
{
    CGSize maxSize = CGSizeMake(self.width, self.height);
    NSMutableDictionary * attr = [NSMutableDictionary dictionary];
    [attr setValue:font forKey:NSFontAttributeName];
    CGSize textSize = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    return textSize;
}


@end
