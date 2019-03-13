//
//  UIColor+RGBA.h
//  Piano
//
//  Created by chenjiang on 15/7/21.
//  Copyright (c) 2015年 jezz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGBA)

+ (UIColor *)colorWithRGB:(int)rgb;
+ (UIColor *)colorWithRGB:(int)rgb alpha:(CGFloat)alpha;
+ (UIColor *)hlColorWithHexString:(NSString *)hexString; // RRGGBB, length 6, no prefix
+ (UIColor *)hlColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha;
- (int)rgbValue;

/*!
 * @abstract 根据color生成UIImage
 */

+ (UIImage *)imageWithColor:(UIColor *)color
                     opaque:(BOOL)opaque
                       size:(CGSize)size;

+ (UIColor *)colorWithHexString:(NSString *)hexStr alpha:(float)alpha;

@end
