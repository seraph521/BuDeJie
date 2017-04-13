//
//  XFXSubTagCell.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXSubTagCell.h"
#import "XFXSubTagItem.h"
#import <UIImageView+WebCache.h>
@interface XFXSubTagCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;

@end


@implementation XFXSubTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (IBAction)subBtnClick:(UIButton *)sender {
}


- (void)setItem:(XFXSubTagItem *)item
{

    _item = item;
    _nameLabel.text = item.theme_name;
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅",item.sub_number] ;
    NSInteger num = item.sub_number.integerValue;
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f万人订阅",numF];
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    
    _numLabel.text = numStr;
    
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        // 1开启图形上下文
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        // 2描述裁剪区域
        UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        // 3设置裁剪区域
        [path addClip];
        // 4画图片
        [image drawAtPoint:CGPointZero];
        // 5取出图片
        UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
        // 6关闭上下文
        UIGraphicsEndImageContext();
        
        _iconImageView.image = newImage;
        
    }];
    
}

@end
