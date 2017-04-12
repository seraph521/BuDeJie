//
//  XFXNewTool.m
//  BuDeJie
//
//  Created by LT-MacbookPro on 17/4/12.
//  Copyright © 2017年 XFX. All rights reserved.
//

#import "XFXNewTool.h"
#import "XFXSubTagParam.h"
#import "HTTPTool.h"
#import <MJExtension/MJExtension.h>

@implementation XFXNewTool

+ (void)sendSubTagWithParam:(XFXSubTagParam *) param success:(RequestSuccess) response failure:(RequestFailure) failure{

    [HTTPTool GET:@"http://api.budejie.com/api/api_open.php" params:param.mj_keyValues success:^(id jsonData) {
        response(jsonData);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
