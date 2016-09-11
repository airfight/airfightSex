//
//  GYTabBar.h
//  airfightSex
//
//  Created by giant on 16/9/11.
//  Copyright © 2016年 giant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYTabBarButton.h"

@protocol GYTabBarDelegate <NSObject>

@optional
- (void)tabBarDidSelectedRiseButton;

@end


@interface GYTabBar : UIView

@property (nonatomic, copy) NSArray<NSDictionary *> *tabBarItemAttributes;

@property (nonatomic,weak) id <GYTabBarDelegate> delegate;
@end
