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

- (instancetype)initWith:(NSArray* )viewController;

@end
