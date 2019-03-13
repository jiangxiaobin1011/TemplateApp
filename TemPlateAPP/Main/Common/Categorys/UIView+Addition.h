//
//  UIView+Addition.h
//  Piano
//
//  Created by chenjiang on 15/7/20.
//  Copyright (c) 2015年 jezz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (nonatomic, strong) UIColor *borderColor;

@property (nonatomic, readonly) UIViewController *viewController;

- (BOOL)containsView:(UIView *)view;
- (UIImage *)imageFromView;

@end
