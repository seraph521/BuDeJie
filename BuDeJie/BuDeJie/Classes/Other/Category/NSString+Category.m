//
//  NSString+Category.m
//  EVA
//
//  Created by Apple on 14/12/11.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "NSString+Category.h"
#import "EvaDateUtil.h"

@implementation NSString (Category)

- (CGSize)sizeWithFont:(UIFont *)font {
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    
    return [self sizeWithAttributes:attributes];
}

- (CGSize)sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    return [self sizeWithAttributes:attributes];
}

- (CGSize)sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

- (NSAttributedString *)getAttributedStringWithFont:(UIFont *)font lineSpacing:(CGFloat)lineSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self attributes:attributes];
    
    return attributedString;
}

- (BOOL)isBlankString {
    
    NSString *testString = [self copy];
    
    if (testString == nil || testString == NULL) {
        return YES;
    }
    else if ([testString isEqualToString:@""]) {
        return YES;
    }
    else if ([testString isKindOfClass:[NSNull class]]) {
        return YES;
    }
    else if ([[testString stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0) {
        return YES;
    }
    else if ([[testString stringByReplacingOccurrencesOfString:@"\n" withString:@""] length] == 0) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isMobileNumberClassification {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    //    NSString * MOBILE = @"^1((3//d|5[0-35-9]|8[025-9])//d|70[059])\\d{7}$";//总况
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     12         */
    
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";
    NSString * CM = @"^(134|135|136|137|138|139|150|151|152|157|158|159|182|183|184|187|178|188|147|170)[0-9]{8}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186,1709
     17         */
    
    NSString * CU = @"^(130|131|132|145|155|156|176|185|186|170)[0-9]{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,1700
     22         */
    NSString * CT = @"^(133|153|177|180|181|189|134|170)[0-9]{8}$";
    
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
//    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    
    if (([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else {
        return NO;
    }
}

//    将时间格式化
+ (NSString *)timeFormatFromSeconds:(int)seconds {
    int totalm = seconds / (60);
    int h = totalm / (60);
    int m = totalm % (60);
    int s = seconds % (60);
    if (h == 0) {
        return [NSString stringWithFormat:@"%02d:%02d", m, s];
    }
    return [NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s];
}

+ (NSString *)transTimeSpWithTimeInterval:(NSTimeInterval)timeInterval {
    
    @try {
        //  实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //  获取当前时间
        NSDate * nowDate = [NSDate date];
        //  将需要转换的时间转换成 NSDate 对象
        NSDate *needFormatDate = [NSDate dateWithTimeIntervalSince1970:timeInterval / 1000];
        //  取当前时间和转换时间两个日期对象的时间间隔
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        //  再然后，把间隔的秒数折算成天数和小时数：
        NSString *dateStr = @"";
        
        if (time <= 60) {
            // 1分钟以内的
            dateStr = @"刚刚";
        }else if(time < 60 * 60){
            // 1小时以内
            int minute = time / 60;
            dateStr = [NSString stringWithFormat:@"%d分钟之前",minute];
        }else if (time >= 60 * 60 && time < 24 * 60 * 60) {
            // 1个小时以外,1天以内的
            int hour = time / (60 * 60);
            dateStr = [NSString stringWithFormat:@"%d小时以前",hour];
        }else if (time >= 24 * 60 * 60 && time < (7 * 24 * 60 * 60)) {
            //大于1天 小于7天
            int day = time / (24 * 60 * 60);
            dateStr = [NSString stringWithFormat:@"%d天前",day];
        }else{
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                //  在同一年
                [dateFormatter setDateFormat:@"MM月dd日 HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else {
                [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        return dateStr;
    }@catch (NSException *exception) {
        return @"";
    }
}

- (BOOL)myContainsString:(NSString*)other {
    NSRange range = [self rangeOfString:other];
    return range.length != 0;
}

//    利用正则表达式验证邮箱格式正确性
+ (BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSLog(@"%@",[emailTest evaluateWithObject:email]?@"满足":@"不满足");
    return [emailTest evaluateWithObject:email];
}

+ (NSString *)getBundleFilePathWithFileName:(NSString *)fileName
{
    NSString * path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    return path;
}


+ (NSString *)getFirstCharacterInString:(NSString *)originString
{
    NSMutableString *ms = [[NSMutableString alloc] initWithString:originString];
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {}
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {}
    NSString * resultString;
    if(ms.length > 0){
        resultString = [ms substringWithRange:NSMakeRange(0, 1)];
    }
    return resultString;
}

// 获取cache路径
+ (NSString *)cacheFile:(NSString *)file
{
    NSString *cacheFile = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    return [cacheFile stringByAppendingPathComponent:file];
}

- (BOOL)isNotEmpty
{
    return (self && ![self isKindOfClass:[NSNull class]] && ![self isEqualToString:@""]);
}

/**
 *  获取时间显示
 *
 *  @param timeStamp 时间戳
 *
 *  @return 需要显示的字符串
 */
+ (NSString *)getChatTimeString:(int64_t)timeStamp
{
    NSDate * messageDate = [NSDate dateWithTimeIntervalSince1970:timeStamp / 1000];
    NSDate * currentDate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    
    BOOL isSameDay = [EvaDateUtil twoDateIsSameDay:messageDate second:currentDate];

//    BOOL isMessageYesterDay = [EvaDateUtil isDateYesterday:messageDate];
    if(isSameDay){
        dateFormatter.dateFormat = @"HH:mm";
        return [dateFormatter stringFromDate:messageDate];
    }else if([EvaDateUtil twoDateIsSameYear:messageDate second:currentDate]){
        dateFormatter.dateFormat = @"MM月dd日";
        NSString * resultStr = @"";
        //插入月份
        resultStr = [resultStr stringByAppendingString:[dateFormatter stringFromDate:messageDate]];
        //插入星期几
        NSCalendar * calendar = [NSCalendar currentCalendar];
        NSDateComponents * components = [calendar components:NSCalendarUnitWeekday fromDate:messageDate];
        NSArray * dayArray = @[@" 星期日 ",@" 星期一 ",@" 星期二 ",@" 星期三 ",@" 星期四 ",@" 星期五 ",@" 星期六 "];
        NSInteger weakDay = components.weekday;
        resultStr = [resultStr stringByAppendingString:dayArray[weakDay - 1]];
        //插入时间点
        dateFormatter.dateFormat = @"HH:mm";
        resultStr = [resultStr stringByAppendingString:[dateFormatter stringFromDate:messageDate]];
        
        return resultStr;
    }else{
        dateFormatter.dateFormat = @"yyyy-MM-dd";
        return [dateFormatter stringFromDate:messageDate];
    }
    /*
     else if(isMessageYesterDay){
     dateFormatter.dateFormat = @"昨天 HH:mm";
     }else{
     if([EvaDateUtil twoDateIsSameYear:messageDate second:currentDate]){
     dateFormatter.dateFormat = @"MM-dd HH:mm";
     }else{
     dateFormatter.dateFormat = @"yyyy-MM-dd";
     }
     }
     */
    
}



@end
