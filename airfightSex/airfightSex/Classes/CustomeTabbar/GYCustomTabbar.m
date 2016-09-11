//
//  GYCustomTabbar.m
//  airfightSex
//
//  Created by giant on 16/9/11.
//  Copyright © 2016年 giant. All rights reserved.
//

#import "GYCustomTabbar.h"

///taBar高度
#define kTabBar_H 60

/**
 *  按钮的tag
 */
#define kTag 333

@interface GYCustomTabbar ()


///自定义tabBar
@property (nonatomic,strong) UIView *tabBarView;

//记录被选中的按钮
@property (nonatomic,strong) UIButton *oldBtn;

@end

@implementation GYCustomTabbar

- (instancetype)initWith:(NSArray *)viewController andImages:(NSArray *)imagesArr andSelectArr:(NSArray *)selectImagesArr andTitle:(NSArray *)titlesArr {
    
    if (self = [super init]) {
        
        _vControllers = viewController;
        _imagesArr = imagesArr;
        _titlesArr = titlesArr;
        _selectImagesArr = selectImagesArr;
        
        //2.装在视图控制器
        [self instanceVC];
        
        //3.创建自定义的tabBarView
        [self instanceTabBarView];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 先隐藏系统的TabBar
    self.tabBar.hidden = YES;
    
    //2.装在视图控制器
    //    [self instanceVC];
    
    //3.创建自定义的tabBarView
    //    [self instanceTabBarView];
    
    
}

- (void)instanceVC{
    
    NSMutableArray *navs = [NSMutableArray arrayWithCapacity:_vControllers.count];
    
    for (int i = 0; i < _vControllers.count; i++) {
        
        //利用字符串创建一个类的对象
        UIViewController *vc = [[NSClassFromString(_vControllers[i]) alloc] init];
        
        //创建导航
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [navs addObject:nav];
        
    }
    
    self.viewControllers = navs;
    
}

- (void)instanceTabBarView{
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_H - kTabBar_H, SCREEN_W, kTabBar_H)];
    CGFloat width = SCREEN_W/self.vControllers.count;
    
    //防止切图缝隙问题
    _tabBarView.backgroundColor = COLORRGB(33, 40, 43);
    NSLog(@"%f",width);
  
    for (int i = 0; i < self.vControllers.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(width * i, 0, width, _tabBarView.bounds.size.height);
        
        //普通状态下的图片
        [btn setBackgroundImage:[UIImage imageNamed:_imagesArr[i]] forState:UIControlStateNormal];
        
        //选中状态下的图片
        [btn setBackgroundImage:[UIImage imageNamed:_selectImagesArr[i]] forState:UIControlStateDisabled];
        
        //设置文字
        [btn setTitle:_titlesArr[i] forState:UIControlStateNormal];
        
        //普通状态下的文字颜色
        [btn setTitleColor:COLORRGB(147, 147, 147) forState:UIControlStateNormal];
        
        //选中状态下的颜色
        [btn setTitleColor:COLORRGB(63, 170, 252) forState:UIControlStateDisabled];
        
        //修改文字的偏移量
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(30, 0, 0, 0)];
        
        //修改文字大小
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        //添加tag
        btn.tag = kTag + i;
        
        // 添加点击事件
        [btn addTarget:self action:@selector(selectViewController:) forControlEvents:UIControlEventTouchUpInside];
        
        //将按钮添加到自定义的view上
        [_tabBarView addSubview:btn];
        
        //将第一个按钮选中
        if (i == 0) {
            
            btn.enabled = NO;
            _oldBtn = btn;
        }
        
    }
    
    
    [self.view addSubview:_tabBarView];
    
    
}
/**
 *  按钮点击事件
 */
- (void)selectViewController:(UIButton *)sender
{
    //切换对应的按钮
    _oldBtn.enabled = YES;
    _oldBtn = sender;
    sender.enabled = NO;
    
    //选择对应的ViewController
    self.selectedIndex = sender.tag - kTag;
}


@end