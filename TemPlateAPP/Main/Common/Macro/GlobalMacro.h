//
//  GlobalMacro.h
//  TemPlateAPP
//
//  Created by lorne on 2019/3/13.
//  Copyright © 2019 ice. All rights reserved.
//

#ifndef GlobalMacro_h
#define GlobalMacro_h


 #define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
 
 #define KScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
 #define KScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
 
 
 
 
 #define TAB_BAR_HEIGHT 49
 #define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
 


#endif /* GlobalMacro_h */
