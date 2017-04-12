//
//  NSString+Validate.h
//  QMarket
//
//  Created by ziooooo on 15/1/5.
//  Copyright (c) 2015年 51. All rights reserved.
//  验证

#import <Foundation/Foundation.h>

@interface NSString (Validate)

/**
 *  手机号码验证
 *
 *  @return 是否是手机号
 */
- (BOOL) validateMobile;

/**
 *  身份证号验证 18位
 *
 *  @return
 */
- (BOOL) validateIdentity;
/**
 *  邮箱验证
 *
 *  @return 是否是邮箱
 */
- (BOOL) validateEmail;
/**
 *  验证密码格式
 *
 *  @return 密码格式是否正确
 */
- (BOOL) validatePassword;
- (BOOL)validatePasswordFormat;
/**
 *  验证 验证码
 *
 *  @return 验证码是否正确
 */
- (BOOL) validateCode;
/**
 *  是否中文
 *
 *  @return 
 */
-(BOOL)isChinese;
/**
 *  验证昵称
 *
 *  @return
 */
-(BOOL)validateNickName;
/**
 *  是否纯数字
 *
 *  @return
 */
-(BOOL)validateNumber;

//是否存在string
-(BOOL)isContainsString:(NSString *)string;
//去空格
-(NSString *)clearSpace;
@end
