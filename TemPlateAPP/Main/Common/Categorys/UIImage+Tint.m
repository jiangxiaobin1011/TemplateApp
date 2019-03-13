//
//  UIImage+Tint.m
//  Recreation
//
//  Created by 孙彬 on 2017/12/25.
//  Copyright © 2017年 孙彬. All rights reserved.
//

#import "UIImage+Tint.h"

@implementation UIImage (Tint)

-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect
{
    return [self rt_tintedImageWithColor:color rect:rect level:1];
}

-(UIImage*)rt_tintedImageWithColor:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level
{
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawInRect:imageRect];
    
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextSetAlpha(ctx, level);
    CGContextSetBlendMode(ctx, kCGBlendModeSourceAtop);
    CGContextFillRect(ctx, rect);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *darkImage = [UIImage imageWithCGImage:imageRef
                                             scale:self.scale
                                       orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    
    UIGraphicsEndImageContext();
    
    return darkImage;
}

-(UIImage*)rt_tintedImageWithColor11:(UIColor*)color rect:(CGRect)rect level:(CGFloat)level
{
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);

    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width, self.size.height));
//    CGContextAddPath(UIGraphicsGetCurrentContext(),[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:10].CGPath);
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawInRect:imageRect];

    
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextSetAlpha(ctx, level);
    CGContextSetBlendMode(ctx, kCGBlendModeClear);
    CGContextFillRect(ctx, rect);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *darkImage = [UIImage imageWithCGImage:imageRef
                                             scale:self.scale
                                       orientation:self.imageOrientation];
    darkImage = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRelease(imageRef);
    
    [[UIBezierPath bezierPathWithRoundedRect:imageRect cornerRadius:100] addClip];
    [darkImage drawInRect:imageRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
