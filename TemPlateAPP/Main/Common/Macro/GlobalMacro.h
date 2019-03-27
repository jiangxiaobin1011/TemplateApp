//
//  GlobalMacro.h
//  TemPlateAPP
//
//  Created by lorne on 2019/3/13.
//  Copyright © 2019 ice. All rights reserved.
//

#ifndef GlobalMacro_h
#define GlobalMacro_h

//屏幕宽高
#define KScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define KScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)


//颜色
#define GrayUIColor(a) RGB(a, a, a)

#define RANDOM_COLOR [UIColor colorWithRed:(arc4random()%100)/(float)100 green:(arc4random()%100)/(float)100 blue:(arc4random()%100)/(float)100 alpha:1]
#define RGB(r, g, b) RGBA(r,g,b,1)
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])
 #define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBHEXValue(hexStr) [UIColor hlColorWithHexString:hexStr]




//字符串
#define JointTwoStrs(a,b)   [NSString stringWithFormat:@"%@%@",a,b]
#define JointThressStrs(a,b,c)   [NSString stringWithFormat:@"%@%@%@",a,b,c]
#define IntToStr(a) [NSString stringWithFormat:@"%d",a]

 
//弱指针
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;


//字体
#define FitTextFont(a) [UIFont systemFontOfSize:a]


#endif /* GlobalMacro_h */
