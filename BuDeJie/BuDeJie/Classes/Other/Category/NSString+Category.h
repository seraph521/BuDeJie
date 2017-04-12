//
//  NSString+Category.h
//  EVA
//
//  Created by Apple on 14/12/11.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (Category)

- (CGSize)sizeWithFont:(UIFont *)font;
- (CGSize)sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;
- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing;
- (CGSize)sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize;

- (BOOL)isBlankString;
- (BOOL)isMobileNumberClassification;
+ (NSString *)timeFormatFromSeconds:(int)seconds;
+ (NSString *)transTimeSpWithTimeInterval:(NSTimeInterval)timeInterval;  //将数字时间转换成字符时间，并计算距离此时多久
+ (BOOL)isValidateEmail:(NSString *)email;
- (BOOL)myContainsString:(NSString*)other;

+ (NSString *)getBundleFilePathWithFileName:(NSString *)fileName;

+ (NSString *)getFirstCharacterInString:(NSString *)originString;
// 获取cache路径
+ (NSString *)cacheFile:(NSString *)file;

- (BOOL)isNotEmpty;

+ (NSString *)getChatTimeString:(int64_t)timeStamp;

@end
