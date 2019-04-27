//
//  QQTabBar.h
//  QQTabBarDemo
//
//  Created by Hugh on 11/4/19.
//  Copyright © 2019年 mmc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQDrgButton.h"

typedef void(^QQTabBarClickBlock)(QQDrgButton *item,NSInteger index);

@interface QQTabBar : UITabBar

- (instancetype)initItems:(NSArray <QQTabBarModel *> *)qq_itmes block:(QQTabBarClickBlock)clickBlock;

@end
