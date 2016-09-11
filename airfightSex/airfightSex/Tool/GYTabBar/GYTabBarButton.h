//
//  GYTabBarButton.h
//  airfightSex
//
//  Created by giant on 16/9/11.
//  Copyright © 2016年 giant. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger,GYTabBarButtonType) {
    GYTabBarButtonNomal = 0,
    GYTabBarButtonRise,
};

extern NSString *const kGYTabBarButtonTitle;

extern NSString *const kGYTabBarButtonNomalImage;

extern NSString *const kGYTabBarButtonSelectedImage;

extern NSString *const kGYTabBarButtonType;

@interface GYTabBarButton : UIButton

@property (nonatomic,assign) GYTabBarButtonType tabBarButtonType;

@end
