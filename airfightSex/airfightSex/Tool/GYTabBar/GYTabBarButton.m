//
//  GYTabBarButton.m
//  airfightSex
//
//  Created by giant on 16/9/11.
//  Copyright © 2016年 giant. All rights reserved.
//

#import "GYTabBarButton.h"

NSString *const kGYTabBarButtonTitle = @"GYTabBarButtonTitle";

NSString *const kGYTabBarButtonNomalImage = @"GYTabBarButtonNomalImage";

NSString *const kGYTabBarButtonSelectedImage = @"GYTabBarButtonSelectedImage";

NSString *const kGYTabBarButtonType = @"GYTabBarButtonType";

@implementation GYTabBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    return self;
}


- (instancetype)init{
    if (self = [super init]) {
        
        [self config];
    }
    return  self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    
    if (self = [super initWithCoder:aDecoder]) {
        [self config];
    }
    return self;
    
}

/**
 *  图片变形
 */
- (void)config {
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

/**
 *  重写layoutSubviews
 */
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    
    if (imageSize.width != 0 && imageSize.height != 0) {
        //调整图片的中心点Y位置
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height/2 - 5;
        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
    } else {
        CGPoint imageViewCenter = self.imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame)/2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
        self.imageView.center = imageViewCenter;
    }
    
    //title中心点的位置
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
    self.titleLabel.center = labelCenter;
    
}

- (void)setHighlighted:(BOOL)highlighted{
    
}

@end
