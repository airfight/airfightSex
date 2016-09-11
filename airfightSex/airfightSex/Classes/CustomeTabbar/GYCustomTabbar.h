//
//  GYCustomTabbar.h
//  airfightSex
//
//  Created by giant on 16/9/11.
//  Copyright © 2016年 giant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GYCustomTabbar : UITabBarController


@property (nonatomic,strong) NSArray *vControllers;

/**
 *  tabbar数组
 */
@property (nonatomic,strong) NSArray *imagesArr;

/**
 *  tabbar标题
 */
@property (nonatomic,strong) NSArray *titlesArr;

@property (nonatomic,strong) NSArray *selectImagesArr;

/**
 *  创建自定义tabbar
 *
 *  @param viewController VC的字符串名称数组
 *
 *  @return 返回TabbarconTroller
 */
- (instancetype)initWith:(NSArray* )viewController andImages: (NSArray *)imagesArr andSelectArr:(NSArray *)selectImagesArr andTitle: (NSArray *)titlesArr;

@end
