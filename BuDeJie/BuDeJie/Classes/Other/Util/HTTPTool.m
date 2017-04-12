//
//  HTTPTool.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "HTTPTool.h"
#import <AFNetworking/AFNetworking.h>

static HTTPTool * httpTool;

@interface HTTPTool ()

@property(nonatomic,strong) AFHTTPSessionManager * manager;

@end

@implementation HTTPTool

//公共配置
- (AFHTTPSessionManager *)getSessionManager{

    if(_manager==nil){
    
        _manager = [AFHTTPSessionManager manager];
       // [_manager.requestSerializer setValue:tokenParam.mj_JSONString forHTTPHeaderField:@"app-header"];
    }
    
    return _manager;
}



#pragma mark - Singleton
+(instancetype)allocWithZone:(struct _NSZone *)zone{
 
    [super allocWithZone:zone];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpTool = [super allocWithZone:zone];
    });
    return httpTool;
}


+ (instancetype)sharedHTTPTool
{
    return [[self alloc] init];
}

//GET请求
+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure{

    AFHTTPSessionManager * sessionManager = [[self sharedHTTPTool] getSessionManager];
    [sessionManager GET:[NSString stringWithFormat:@"%@%@",BASE_URL,url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

//POST请求
+ (void)POST:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure{

    AFHTTPSessionManager * sessionManager = [[self sharedHTTPTool] getSessionManager];

    [sessionManager POST:[NSString stringWithFormat:@"%@%@",BASE_URL,url] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


@end
