//
//  GYTabBar.m
//  airfightSex
//
//  Created by giant on 16/9/11.
//  Copyright © 2016年 giant. All rights reserved.
//

#import "GYTabBar.h"

@interface GYTabBar()

@property (strong, nonatomic) NSMutableArray *tabBarItems;

@end

@implementation GYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        [self config];
    }
    return self;
}

- (void)config{
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, SCREEN_W, 5)];
    topLine.image = [UIImage imageNamed:@"tapbar_line"];
    
    [self addSubview:topLine];
}

- (void)setSelectedIndex:(NSInteger)index{
    
    for (GYTabBarButton *item in self.tabBarItems) {
        if (item.tag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
    
    UITabBarController *tabbarController = (UITabBarController *)kWindow.rootViewController;
    
    if (tabbarController) {
        tabbarController.selectedIndex = index;
    }
    
}

- (void)itemSelected:(GYTabBarButton *)sender {
    
    if (sender.tabBarButtonType != GYTabBarButtonRise) {
        [self setSelectedIndex:sender.tag];
    } else {
        if (self.delegate) {
            
            if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
                [self.delegate tabBarDidSelectedRiseButton];
            }
            
        }
    }
    
}

- (void)setTabBarItemAttributes:(NSArray<NSDictionary *> *)tabBarItemAttributes  {
    
    _tabBarItemAttributes = tabBarItemAttributes.copy;
    NSAssert(_tabBarItemAttributes.count > 2, @"TabBar item count must greet than 2.");
    
    //正常的tabbar 总共占3/4屏幕
    CGFloat nomalItemWidth = (SCREEN_W * 3 / 4) / (_tabBarItemAttributes.count - 1);
    CGFloat tabBarHeight = CGRectGetHeight(self.frame);
    //凸起的占1/4
    CGFloat publishItemWidth = (SCREEN_W / 4);
    
    NSInteger itemTag = 0;
    BOOL passdRiseItem = NO;
    
    _tabBarItems = [NSMutableArray arrayWithCapacity:_tabBarItemAttributes.count];
    
    for (id item in _tabBarItemAttributes) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSDictionary *itemDict = (NSDictionary *)item;
            
            GYTabBarButtonType type = [itemDict[kGYTabBarButtonType] integerValue];
            
            CGRect frame = CGRectMake(itemTag * nomalItemWidth + (passdRiseItem ? publishItemWidth : 0), 0, type == GYTabBarButtonRise ? publishItemWidth : nomalItemWidth, tabBarHeight);
            
            GYTabBarButton *tabBarItem = [self tabBarItemWithFrame:frame title:itemDict[kGYTabBarButtonTitle] normalImageName:itemDict[kGYTabBarButtonNomalImage] selectedImageName:itemDict[kGYTabBarButtonSelectedImage] tabBarItemType:type];
            
            if (itemTag == 0) {
                tabBarItem.selected = YES;
                
            }
            
            [tabBarItem addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
            
            /**
             *  判断是否为突起的item  否添加tag且+1
             */
            if (tabBarItem.tabBarButtonType != GYTabBarButtonRise) {
                tabBarItem.tag = itemTag;
                itemTag++;
            } else {
                passdRiseItem = YES;
            }
            
            
            [_tabBarItems addObject:tabBarItem];
            
            [self addSubview:tabBarItem];
            
        }
    }
    
    
    
}



- (GYTabBarButton *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(GYTabBarButtonType)tabBarItemType {
    
    GYTabBarButton *item = [[GYTabBarButton alloc] initWithFrame:frame];
    
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:8];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
    item.tabBarButtonType = tabBarItemType;
    
    return item;
    
}

@end
