//
//  QQDrgButton.h
//  QQTabBarDemo
//
//  Created by Zer0 on 2019/4/11.
//  Copyright © 2019 mmc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQTabBarModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QQDrgButton : UIButton

//大图偏移距离
@property (nonatomic,assign) CGFloat distance;
//小图差异系数
@property (nonatomic,assign) CGFloat mini_x_Coef;
@property (nonatomic,assign) CGFloat mini_y_Coef;

@property (nonatomic,copy) NSString *title;

- (instancetype)initWithItem:(QQTabBarModel *)item;

- (void)updateState;

@end

NS_ASSUME_NONNULL_END
