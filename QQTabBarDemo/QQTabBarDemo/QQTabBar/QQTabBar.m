//
//  QQTabBar.m
//  QQTabBarDemo
//
//  Created by Hugh on 11/4/19.
//  Copyright © 2019年 mmc. All rights reserved.
//

#import "QQTabBar.h"

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ?\
(\
CGSizeEqualToSize(CGSizeMake(375, 812),[UIScreen mainScreen].bounds.size)\
||\
CGSizeEqualToSize(CGSizeMake(414, 896),[UIScreen mainScreen].bounds.size)\
)\
:\
NO)

#define SafeAreaBottom (kDevice_Is_iPhoneX ? 34.0:0)


#define TAG_BASE 3000

@interface QQTabBar()

@property (nonatomic,strong) QQDrgButton *selectItem;

@property (nonatomic,strong) NSArray <QQTabBarModel *> *tabBarModels;

@property (nonatomic,strong) NSMutableArray <QQDrgButton *> *qq_items;

@property (nonatomic,copy) QQTabBarClickBlock clickBlock;

@end

@implementation QQTabBar

- (instancetype)initItems:(NSArray <QQTabBarModel *> *)qq_itmes block:(QQTabBarClickBlock)clickBlock{
    if (self = [super initWithFrame:CGRectZero]) {
        self.tabBarModels = qq_itmes;
        self.clickBlock = clickBlock;
        self.userInteractionEnabled = YES;
        [self setItem];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.tabBarModels == nil) {
        return;
    }
    if (self.qq_items.count == 0) {
        return;
    }
    
    for (NSInteger i =0 ; i < self.qq_items.count; i ++ ) {
        NSInteger count = self.qq_items.count;
        CGFloat x = self.bounds.size.width * i / count;
        QQDrgButton *button = self.qq_items[i];
        button.frame = CGRectMake(x, 0, self.bounds.size.width / count, self.bounds.size.height - SafeAreaBottom);
    }
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

- (void)setItem {
    if (self.tabBarModels == nil) {
        return;
    }
    self.qq_items = [NSMutableArray new];
    
    for (NSInteger i = 0 ; i < self.tabBarModels.count; i ++) {
        QQDrgButton * button = [[QQDrgButton alloc] initWithItem:self.tabBarModels[i]];
        button.tag = TAG_BASE + i;
        [button addTarget:self action:@selector(goToClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        [self.qq_items addObject:button];
        if (i == 0) {
            button.selected = YES;
            self.selectItem = button;
            [self.selectItem updateState];
        }
    }
}

- (void)goToClick:(QQDrgButton *)item {
    if (self.selectItem == item) {
        return;
    }
    self.selectItem.selected = NO;
    [self.selectItem updateState];
    self.selectItem = item;
    self.selectItem.selected = YES;
    [self.selectItem updateState];
    if (self.clickBlock) {
        self.clickBlock(item, item.tag - TAG_BASE);
    }
    
}


@end
