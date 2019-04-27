//
//  QQTabBarModel.m
//  QQTabBarDemo
//
//  Created by Zer0 on 2019/4/11.
//  Copyright © 2019 mmc. All rights reserved.
//

#import "QQTabBarModel.h"

@implementation QQTabBarModel

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title distance:(CGFloat)distance mini_x_Coef:(CGFloat)mini_x_Coef mini_y_Coef:(CGFloat)mini_y_Coef{
    if (self = [super init]) {
        self.imageName = imageName;
        self.title = title;
        self.distance = distance;
        self.mini_x_Coef = mini_x_Coef;
        self.mini_y_Coef = mini_y_Coef;
    }
    return self;
}

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title {
    if (self = [super init]) {
        self.imageName = imageName;
        self.title = title;
        self.distance = 10;
        self.mini_x_Coef = 0.15;
        self.mini_y_Coef = 0.15;
    }
    return self;
}

@end
