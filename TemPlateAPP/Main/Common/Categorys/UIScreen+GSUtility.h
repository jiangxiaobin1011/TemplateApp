//
//  UIScreen+GSUtility.h
//  iPhoneX适配
//
//  Created by  on 2017/11/7.
//  Copyright © 2017年 GuoShuJinFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (GSUtility)

+ (BOOL)is35Inch;
+ (BOOL)is4Inch;
+ (BOOL)is47Inch;
+ (BOOL)is55Inch;
+ (BOOL)is58Inch;

+ (CGRect)bounds;
+ (CGSize)screenSize;
+ (CGPoint)screenCenterPoint;

+ (CGFloat)topSafeAreaSpace;//导航栏安全区域高度
+ (CGFloat)bottomSafeAreaSpace;//tabbar安全区域高度

+ (CGFloat)statusAndNavigationBarHeight;//适配导航栏高度iponex
+ (CGFloat)tabBarHeight;//适配tabbar高度iponex

@end
