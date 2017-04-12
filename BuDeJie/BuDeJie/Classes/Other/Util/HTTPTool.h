//
//  HTTPTool.h
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BASE_URL      @""

typedef void (^RequestSuccess)(id jsonData);
typedef void (^RequestFailure)(NSError * error);

@interface HTTPTool : NSObject

//GET请求
+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure;

//POST请求
+ (void)POST:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
