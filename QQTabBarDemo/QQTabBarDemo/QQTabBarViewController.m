//
//  QQTabBarViewController.m
//  QQTabBarDemo
//
//  Created by Hugh on 11/4/19.
//  Copyright © 2019年 mmc. All rights reserved.
//

#import "QQTabBarViewController.h"
#import "QQTabBar.h"

@interface QQTabBarViewController ()

@end

@implementation QQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    
    self.viewControllers = @[vc,vc1,vc2];
    
    QQTabBarModel *item = [[QQTabBarModel alloc] initWithImageName:@"recent" title:@"消息" distance:10 mini_x_Coef:0.2 mini_y_Coef:0.4];
    QQTabBarModel *item1 = [[QQTabBarModel alloc] initWithImageName:@"buddy" title:@"联系"];
    QQTabBarModel *item2 = [[QQTabBarModel alloc] initWithImageName:@"qworld" title:@"动态" distance:10 mini_x_Coef:-0.2 mini_y_Coef:0.2];
    
    QQTabBar *tabBar = [[QQTabBar alloc] initItems:@[item,item1,item2] block:^(QQDrgButton *item, NSInteger index) {
        self.selectedIndex = index;
    }];
    
    [self setValue:tabBar forKey:@"tabBar"];
}



@end
