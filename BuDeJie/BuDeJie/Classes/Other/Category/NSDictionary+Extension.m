//
//  NSDictionary+Extension.m
//  Yoal
//
//  Created by eva on 15/10/29.
//  Copyright © 2015年 Eva. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSMutableDictionary *)sortDict
{
    NSMutableDictionary * resultDict = [NSMutableDictionary dictionary];
    
    NSMutableArray * keyArray = [NSMutableArray arrayWithArray:self.allKeys];
    [keyArray sortUsingComparator: ^NSComparisonResult (NSString *str1, NSString *str2) {
        return [str1 compare:str2];
    }];
    
    for(NSString * key in keyArray){
        [resultDict setValue:[self valueForKey:key] forKey:key];
    }
    
    return resultDict;
}

@end
