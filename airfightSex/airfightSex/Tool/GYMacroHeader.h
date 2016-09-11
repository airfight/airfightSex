//
//  GYMacroHeader.h
//  GYMacroHeader
//
//  Created by zgy on 14/09/11.
//  Copyright (c) 2014年 GY. All rights reserved.
//

#ifndef ___GYMacroHeader_h
#define ___GYMacroHeader_h

/**
 * 格式化字符串
 */
#define FORMAT(fmt, ...) [NSString stringWithFormat:(fmt), ##__VA_ARGS__]

/**
 * 获取设备的宽高
 */
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

/**
 * 判断是否为iPad设备
 */
#define ISPAD ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))

/**
 * 判断是否为iPhone设备
 */
#define ISIPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

/**
 * 获取当前版本号，整数
 */
#define System_Version(version) ([[[UIDevice currentDevice] systemVersion] intValue] >= version)

/**
 * 设置RGB颜色(0x??????)，16进制
 */
#define COLOR_RGB16(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])

/**
 * 设置RGB颜色(rgb)
 */
#define COLORRGB(r, g, b) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0])

/**
 * 获取Library/Caches路径
 */
#define CACHEPATH ([NSString stringWithFormat:@"%@/Library/Caches", NSHomeDirectory()])

/**
 * 这是一个消除performSelector警告的宏
 */
#define clearWarning_preformSel(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

/**
 * 这是一个强制消除警告的宏
 */
#define clearWarning_force(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-bridge-casts-disallowed-in-nonarc\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

/**
 * 回到主线程同步执行
 */
#define sync_main_safe(block) \
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

/**
 * 回到主线程异步执行
 */
#define async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

/**
 * 重写NSLog，Debug模式下打印日志和当前行数
 * 防止release版本中含有多余的打印信息
 */
#if DEBUG
//#define NSLog(fmt, ...) fprintf(stderr,"\nfunc:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:fmt, ##__VA_ARGS__] UTF8String]);
#define NSLog(fmt, ...) fprintf(stderr,"[class:%s -- line:%04d]%s\n", [NSStringFromClass([self class]) UTF8String], __LINE__, [[NSString stringWithFormat:fmt, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(fmt, ...) nil
#endif


#endif
