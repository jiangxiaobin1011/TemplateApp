//
//  UIScreen+GSUtility.m
//  iPhoneX适配
//
//  Created by  on 2017/11/7.
//  Copyright © 2017年 GuoShuJinFu. All rights reserved.
//

#import "UIScreen+GSUtility.h"
#import "SDiOSVersion.h"

@implementation UIScreen (GSUtility)

#pragma mark - Public Methods

+ (BOOL)is35Inch {
  return [SDiOSVersion deviceSize] == Screen3Dot5inch;
}

+ (BOOL)is4Inch {
  return [SDiOSVersion deviceSize] == Screen4inch;
}

+ (BOOL)is47Inch {
  return [SDiOSVersion deviceSize] == Screen4Dot7inch;
}

+ (BOOL)is55Inch {
  return [SDiOSVersion deviceSize] == Screen5Dot5inch;
}

+ (BOOL)is58Inch {
  return [SDiOSVersion deviceSize] == Screen5Dot8inch;
}

+ (CGSize)screenSize {
  CGSize screenSize = CGSizeZero;
  switch ([SDiOSVersion deviceSize]) {
    case UnknownSize:
      break;
      
    case Screen3Dot5inch:
      screenSize = CGSizeMake(320, 480);
      break;
    case Screen4inch:
      screenSize = CGSizeMake(320, 568);
      break;
    case Screen4Dot7inch:
      screenSize = CGSizeMake(375, 667);
      break;
    case Screen5Dot5inch:
      screenSize = CGSizeMake(414, 736);
      break;
    case Screen5Dot8inch:
      screenSize = CGSizeMake(375, 812);
      break;
  }
  
  return screenSize;
}

+ (CGPoint)screenCenterPoint {
  return CGPointMake([UIScreen screenSize].width / 2, [UIScreen screenSize].height / 2);
}

+ (CGRect)bounds {
  return CGRectMake(0.f, 0.f, [self screenSize].width, [self screenSize].height);
}

+ (CGFloat)topSafeAreaSpace {
	return [UIScreen is58Inch] ? 24.f : 0.f;
}

+ (CGFloat)bottomSafeAreaSpace {
	return [UIScreen is58Inch] ? 34.f : 0.f;
}

+ (CGFloat)statusAndNavigationBarHeight {
	return [self topSafeAreaSpace] + 64.f;
}

+ (CGFloat)tabBarHeight {
	return [self bottomSafeAreaSpace] + 49.f;
}

@end
