//
//  QQTabBarModel.h
//  QQTabBarDemo
//
//  Created by Zer0 on 2019/4/11.
//  Copyright © 2019 mmc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQTabBarModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imageName;
//大图偏移距离
@property (nonatomic,assign) CGFloat distance;
//小图便宜差异系数
@property (nonatomic,assign) CGFloat mini_x_Coef;
@property (nonatomic,assign) CGFloat mini_y_Coef;

/**
 * imageName 图片名称
 * title 文字
 * distance 最大的便宜距离
 * mini_x_Coef 小图x偏移系数
 * mini_y_Coef 小图y偏移系数
 */
- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title distance:(CGFloat)distance mini_x_Coef:(CGFloat)mini_x_Coef mini_y_Coef:(CGFloat)mini_y_Coef;

- (instancetype)initWithImageName:(NSString *)imageName title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
