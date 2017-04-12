//
//  GlobalHeader.h
//  
//
//  Created by Apple on 14/12/11.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#ifndef EVA_GlobalHeader_h


#define EVA_GlobalHeader_h

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#define SuppressDeprecatedWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

//    屏幕的宽高度
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define WEAKSELF typeof(self) __weak weakSelf = self;

#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;

#define AUTH_CODE_LENGTH 6

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0, 960.0), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0, 1136.0), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750.0, 1334.0), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242.0, 2208.0), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPad ([[UIDevice currentDevice].model myContainsString:@"iPad"])

// 沙盒路路径
#define DocumentsPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
// 随机色
#define DreamRandomColor DreamColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define DreamColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define DreamColorWithAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define MAIN_COLOR [UIColor colorWithR:255 G:255 B:160]
#define MainColor(a) [UIColor colorWithR:255 G:255 B:160 A:(a)]
#define TRACK_COLOR [UIColor colorWithR:135 G:59 B:239]
#define TrackColor(a) [UIColor colorWithR:135 G:59 B:239 A:(a)]
#define COLOR_BACKGROUND [UIColor colorWithR:236 G:236 B:236]
#define COLOR_CUTLINE DreamColorWithAlpha(0, 0, 0, 0.1)
#define DEVICE_ID [[UIDevice currentDevice].identifierForVendor UUIDString]

#define FONT_4S_5 [UIFont systemFontOfSize:15]
#define BOLD_FONT_4S_5 [UIFont boldSystemFontOfSize:15]

//ios版本判断宏定义
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define DEVICE_ID [[UIDevice currentDevice].identifierForVendor UUIDString]
#define APPLICATION_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]



#endif
