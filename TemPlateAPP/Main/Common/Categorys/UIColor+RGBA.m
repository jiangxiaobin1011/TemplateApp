//
//  UIColor+RGBA.m
//  Piano
//
//  Created by chenjiang on 15/7/21.
//  Copyright (c) 2015年 jezz. All rights reserved.
//

#import "UIColor+RGBA.h"

@implementation UIColor (RGBA)

+ (UIColor *)colorWithRGB:(int)rgbValue {
    return [self colorWithRGB:rgbValue alpha:1];
}

+ (UIColor *)colorWithRGB:(int)rgbValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:alpha];
}

+ (UIColor *)hlColorWithHexString:(NSString *)hexString {
    return [self hlColorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)hlColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    return [self colorWithRGB:rgbValue alpha:alpha];
}

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [self colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

- (int)rgbValue
{
    int resValue = 0;
    CGFloat a,r,g,b;
    if ([self getRed:&r green:&g blue:&b alpha:&a]) {
        resValue = \
        ((int)(r*0xFF) & 0xFF) << 16 | \
        ((int)(g*0xFF) & 0xFF) << 8 | \
        ((int)(b*0xFF) & 0xFF) << 0 | \
        0;
    }
    return resValue;
}

+ (UIImage *)imageWithColor:(UIColor *)color
                     opaque:(BOOL)opaque
                       size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, opaque, 0);
    [color set];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    [path fill];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

#pragma mark Color处理

+ (UIColor *)colorWithHexValue:(uint)hexValue alpha:(float)alpha
{
    return [UIColor
            colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
            green:((float)((hexValue & 0xFF00) >> 8))/255.0
            blue:((float)(hexValue & 0xFF))/255.0
            alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexStr alpha:(float)alpha
{
    if (hexStr == nil || (id)hexStr == [NSNull null]) {
        return nil;
    }
    else{
        UIColor *color;
        hexStr = [hexStr stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
        
        uint hexValue;
        if ([[NSScanner scannerWithString:hexStr] scanHexInt:&hexValue]) {
            color = [self colorWithHexValue:hexValue alpha:alpha];
        }
        else {
            // invalid hex string
            color = [UIColor clearColor];
        }
        return color;
    }
}

@end
