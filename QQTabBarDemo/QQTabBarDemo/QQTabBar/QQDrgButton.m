//
//  QQDrgButton.m
//  QQTabBarDemo
//
//  Created by Zer0 on 2019/4/11.
//  Copyright © 2019 mmc. All rights reserved.
//

#import "QQDrgButton.h"

@interface QQDrgButton ()

//大图
@property (nonatomic,strong) UIImage *bigImage_normal;
@property (nonatomic,strong) UIImage *bigImage_select;

@property (nonatomic,strong) UIImage *miniImage_normal;
@property (nonatomic,strong) UIImage *miniImage_select;

@property (nonatomic,assign) CGFloat dragButton_x;
@property (nonatomic,assign) CGFloat dragButton_y;

@property (nonatomic,assign) CGFloat itemH;
@property (nonatomic,assign) CGFloat itemW;

@property (nonatomic,strong) UIImageView *imageView_big;
@property (nonatomic,strong) UIImageView *imageView_mini;

@property (nonatomic,strong) UILabel *textLabel;

@end

@implementation QQDrgButton

- (instancetype)initWithItem:(QQTabBarModel *)item{
    if (self = [super initWithFrame:CGRectZero]) {
        self.showsTouchWhenHighlighted = NO;
        self.adjustsImageWhenDisabled = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.imageView.layer.masksToBounds = NO;
        
        self.distance = item.distance;
        self.mini_x_Coef = item.mini_x_Coef;
        self.mini_y_Coef = item.mini_y_Coef;
        [self setImage:item.imageName];
        self.title = item.title;
        self.textLabel.text = self.title;
        
        [self addSubview:self.imageView_big];
        [self addSubview:self.imageView_mini];
        [self addSubview:self.textLabel];
        
        [self addPan];
        
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

- (void)setImage:(NSString *)imageName {
    self.bigImage_normal = [UIImage imageNamed:[NSString stringWithFormat:@"big_%@_normal",imageName]];
    self.bigImage_select = [UIImage imageNamed:[NSString stringWithFormat:@"big_%@_select",imageName]];
    self.miniImage_normal = [UIImage imageNamed:[NSString stringWithFormat:@"mini_%@_normal",imageName]];
    self.miniImage_select = [UIImage imageNamed:[NSString stringWithFormat:@"mini_%@_select",imageName]];
    self.imageView_big.image = self.bigImage_normal;
    self.imageView_mini.image = self.miniImage_normal;
}

- (void)addPan{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self addGestureRecognizer:pan];
}

- (void)panGesture:(UIPanGestureRecognizer *)pan {
    CGPoint point = [pan locationInView:self];
    point = CGPointMake(point.x - self.bounds.size.width *0.5, point.y - self.bounds.size.height *0.5);
    if (pan.state == UIGestureRecognizerStateBegan || pan.state == UIGestureRecognizerStateChanged) {
        CGFloat x = point.x;
        CGFloat y = point.y;
        
        //求平方根
        double R = sqrt(pow(x, 2) + pow(y, 2));
        CGFloat scale = R /self.distance;
        self.dragButton_x = x / scale;
        self.dragButton_y = y / scale;
    } else {
        self.dragButton_y = 0;
        self.dragButton_x = 0;
        [UIView animateWithDuration:0.3 animations:^{
            self.imageView_big.frame = CGRectMake(0, 0, self.itemW, self.itemH - 15.0);
            self.imageView_mini.frame = CGRectMake(0, 0, self.itemW, self.itemH - 15.0);
        }];
        return;
    }
    [self dragIcon];
}

- (void)dragIcon{
    CGFloat x = (self.bounds.size.width - self.imageView_big.bounds.size.width) * 0.5 + self.dragButton_x;
    CGFloat y = (self.bounds.size.height - self.imageView_big.bounds.size.height) * 0.5 + self.dragButton_y;
    self.imageView_big.frame = CGRectMake(x, y, self.imageView_big.bounds.size.width, self.imageView_big.bounds.size.height);
    self.imageView_mini.frame = CGRectMake(x + self.dragButton_x * self.mini_x_Coef, y + self.dragButton_y * self.mini_y_Coef, self.imageView_big.bounds.size.width, self.imageView_big.bounds.size.height);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.itemH = self.bounds.size.height;
    self.itemW = self.bounds.size.width;
    
    self.textLabel.frame = CGRectMake(0, self.itemH - 15.0, self.itemW, 15.0);
    self.imageView_big.frame = CGRectMake(0, 0, self.itemW, self.itemH - 15);
    self.imageView_mini.frame = CGRectMake(0, 0, self.itemW, self.itemH - 15);
}

- (void)updateState {
    self.imageView_big.image = self.isSelected ? self.bigImage_select : self.bigImage_normal;
    self.imageView_mini.image = self.isSelected ? self.miniImage_select : self.miniImage_normal;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.imageView_big.transform = CGAffineTransformMakeScale(0.85, 0.85);
        self.imageView_mini.transform = CGAffineTransformMakeScale(0.85, 0.85);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.imageView_big.transform = CGAffineTransformMakeScale(1, 1);
            self.imageView_mini.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }];
}

- (UIImageView *)imageView_big {
    if (!_imageView_big) {
        _imageView_big =[[UIImageView alloc] init];
        _imageView_big.contentMode = UIViewContentModeCenter;
        _imageView_big.userInteractionEnabled = NO;
    }
    return _imageView_big;
}

- (UIImageView *)imageView_mini {
    if (!_imageView_mini) {
        _imageView_mini =[[UIImageView alloc] init];
        _imageView_mini.contentMode = UIViewContentModeCenter;
         _imageView_mini.userInteractionEnabled = NO;
    }
    return _imageView_mini;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor grayColor];
        _textLabel.font = [UIFont systemFontOfSize:12];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.userInteractionEnabled = NO;
        _textLabel.numberOfLines = 0;
    }
    return _textLabel;
}

@end
