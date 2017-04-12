//
//  NSString+Validate.m
//  QMarket
//
//  Created by ziooooo on 15/1/5.
//  Copyright (c) 2015年 51. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

//手机号码验证
- (BOOL) validateMobile{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(14[^4,\\D])|(15[^4,\\D])|(17[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

//邮箱验证
- (BOOL) validateEmail  {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


//验证密码
- (BOOL) validatePassword  {
    if (self.length > 5 && self.length < 21) {
        return YES;
    }
    else{
        return NO;
    }
    
}

- (BOOL)validatePasswordFormat{
    
    NSString *pwRegex = @"^[A-Za-z0-9]{6,20}$";
    NSPredicate *pwTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pwRegex];
    return [pwTest evaluateWithObject:self];
}

//验证 验证码
- (BOOL) validateCode{
    NSString *codeRegex = @"^[0-9]{4}+$";
    NSPredicate *codePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];
    return [codePredicate evaluateWithObject:self];
}
//是否中文
-(BOOL)isChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
-(BOOL)isContainsString:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    if (range.location != NSNotFound) {//存在
        return YES;
    }
    return NO;
}
//身份证号
-(BOOL)validateIdentity
{
    NSString *phoneRegex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    NSPredicate *identityTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [identityTest evaluateWithObject:self];
    
}

-(BOOL)validateNickName
{
    NSString *nickNameRegex = @"^[a-zA-Z0-9_\u4e00-\u9fa5]{1,20}$";
    NSPredicate *nickNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nickNameRegex];
    return [nickNameTest evaluateWithObject:self];
    
}

-(NSString *)clearSpace
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

-(BOOL)validateNumber
{
    NSString *numberRegex = @"^(([0-9]|([1-9][0-9]{0,9}))((\\.[0-9]{1,2})?))$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return [numberTest evaluateWithObject:self];
}

@end
