//
//  XFXNewTool.h
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFXSubTagParam.h"
#import "HTTPTool.h"

@interface XFXNewTool : NSObject

/**
 *  获取subTag
 *
 *  @param param    发送参数
 *  @param response 成功回调
 *  @param failure  失败回调
 */
+ (void)sendSubTagWithParam:(XFXSubTagParam *) param success:(RequestSuccess) response failure:(RequestFailure) failure;


@end
