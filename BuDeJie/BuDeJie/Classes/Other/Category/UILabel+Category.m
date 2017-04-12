//
//  UILabel+Category.m
//  Yoal
//
//  Created by eva on 15/10/12.
//  Copyright © 2015年 Eva. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

- (CGSize)getTextSize
{
    CGSize maxSize = CGSizeMake(self.width, self.height);
    NSMutableDictionary * attr = [NSMutableDictionary dictionary];
    [attr setValue:self.font forKey:NSFontAttributeName];
    CGSize textSize = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    return textSize;
}

@end
