//
//  UIView+Common.h
//  Bike_Demo
//
//  Created by 姜斌 on 2017/2/16.
//  Copyright © 2017年 姜斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, CustomerType)
{
    PotentialCustomerType = 0,//潜在客户
    FormalCustomerType//企业客户
};



typedef void (^Callback)(BOOL success,NSString *error,NSDictionary *result);

#define bannerHeight   kScreenWidth*(222.0/375.0) //banner高度


#define ImageNamed(a)   [UIImage imageNamed:a]

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;


//
#define CZHNavigationBarTitleFont CZHGlobelBoldFont(17)
///普通状态TintColor
#define CZHNavigationBarNormalTitleColor  CZHColor(0x333333)
///半透明透明的时候文字颜色
#define CZHNavigationBarTranslucentTitleColor  CZHColor(0xffffff)

#define CZHGlobelBoldFont(__VA_ARGS__) ([UIFont boldSystemFontOfSize:CZH_ScaleFont(__VA_ARGS__)])

/**字体比例*/
#define CZH_ScaleFont(__VA_ARGS__)  ([UIScreen mainScreen].bounds.size.width/375)*(__VA_ARGS__)

/**颜色*/
#define CZHColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define CZHRGBColor(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]



//通知名
#define ChangeFavOrReadDataOfSchemeNoti @"changeFavOrReadDataOfScheme"


#define  SchemeCellHEIGHT 220

#define JointTwoStrs(a,b)   [NSString stringWithFormat:@"%@%@",a,b]
#define JointThressStrs(a,b,c)   [NSString stringWithFormat:@"%@%@%@",a,b,c]
#define IntToStr(a) [NSString stringWithFormat:@"%d",a]
#define FilterTwoStrs(a,b) [APIConfig myNullFilterStr:[NSString stringWithFormat:@"%@%@",a,b]]
#define FilterThressStrs(a,b) [APIConfig myNullFilterStr:[NSString stringWithFormat:@"%@%@%@",a,b,c]]


#define CZHRGBColor(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define Color_bg1 GrayUIColor(246)//背景色
#define Color_bg2 GrayUIColor(255)//主题色
#define Color_line GrayUIColor(226)//线
#define Color_text2 RGB(149, 149, 149)//浅黑色
#define Color_text1 GrayUIColor(51)//主黑色
#define Color_text3 RGB(188, 188, 188)//浅黑色
#define GrayUIColor(a) RGB(a, a, a)
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RANDOM_COLOR [UIColor colorWithRed:(arc4random()%100)/(float)100 green:(arc4random()%100)/(float)100 blue:(arc4random()%100)/(float)100 alpha:1]
#define RGB(r, g, b) RGBA(r,g,b,1)
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])

#define FitTextFont(a) [UIFont systemFontOfSize:a]


#define V_SCALE (float)[UIScreen mainScreen].bounds.size.height/667



@interface UIView (Common)

@property(assign,nonatomic)CGFloat WX_Width;
@property(assign,nonatomic)CGFloat WX_Height;
@property(assign,nonatomic)CGFloat WX_originx;
@property(assign,nonatomic)CGFloat WX_originy;


#pragma mark -----------------创建subView----------------------------
+(UIButton*)createBackBtn;

+(UIBarButtonItem*)createBackBtn_BarButtonItem:(id)target andAction:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

+(UIBarButtonItem*)create_BarButtonItemWithImage:(UIImage*)image andTiele:(NSString*)titleStr  andTitleColor:(UIColor*)titleColor andTarget :(id)target andAction:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


+(UILabel*)createNavlabel:(NSString*)titleStr andTieleColor:(UIColor*)titleColor;


+(void)radiusOfView:(CGFloat)radius :(UIView*)view;
+(UIView*)create_line:(CGRect)frame;


+(UILabel*)create_Label_WithBackGroundColor:(UIColor*)backGroundColor textAligment:(NSTextAlignment)textAligment font:(UIFont*)font textColor:(UIColor*)textColor text:(NSString*)text;


+(UIButton*)create_Button_WithBackGroundColor:(UIColor*)backGroundColor  textColor:(UIColor*)textColor text:(NSString*)text image:(NSString*)imageStr font:(UIFont*)textfont bordeColor:(CGColorRef)bordeColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius ;

+(UIButton*)create_Button_WithBackGroundColor:(UIColor*)backGroundColor  textColor:(UIColor*)textColor text:(NSString*)text image:(NSString*)imageStr font:(UIFont*)textfont bordeColor:(CGColorRef)bordeColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius frame:(CGRect)frame;

+ (UITextField*)create_textFiled_withPlacheor:(NSString*)placheor textColor:(UIColor*)textColor textFontSize:(UIFont*)textFontSize textAliement:(NSTextAlignment)textAliement;



#pragma mark -------------------改变样式Attribute----------------------------------
+(void)chanLabelAttribute:(UILabel*)label :(NSString*)changeStr;
+(void)changeLabelAttributeWithChangeStrArr:(NSArray*)changeArr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLabel:(UILabel*)label;//改变数组



+(void)changeLabelAttributeWithRange:(NSRange)range andFont:(UIFont*)font andChangeColor:(UIColor*)color andLabel:(UILabel*)label;
+(void)changeLabelAttributeWithStr:(NSString*)changeStr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLabel:(UILabel*)label;
+(void)changeLabelAttributeWithChangeStrArr:(NSArray*)changeArr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLineSpace:(float)Linespace andLabel:(UILabel*)label;




//设置行间距
+(void)changeLabelAttributeWithStr:(NSString*)changeStr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLineSpace:(float)Linespace andLabel:(UILabel*)label;


+(NSMutableAttributedString*)changeViewAttributeWithStr:(NSString*)changeStr andFont:(UIFont*)font andChangeColor:(UIColor*)color andAllStr:(NSString*)allStr;




+(NSMutableAttributedString*)changeViewAttributeWithChangeStr:(NSString*)changeStr andChangeFont:(UIFont*)font andChangeColor:(UIColor*)color andAllStr:(NSString*)allStr andBaseFont:(UIFont*)baseFont andBaseColor:(UIColor*)baseColor;

//自动布局
//+(UIView*)createAutoViewAndClass:(Class)class addToSuperView:(UIView*)superView;


#pragma mark --------------------改变坐标 x ,y ,width,height---------------
-(void)changeViewRect_WithChange_X:(float)x;
-(void)changeViewRect_WithChange_Y:(float)y;
-(void)changeViewRect_WithChange_contentOffset_X:(float)x;
-(void)changeViewRect_WithChange_contentOffset_Y:(float)y;
-(void)changeViewRect_WithChangeWidth:(float)width;
-(void)changeViewRect_WithChangeHeight:(float)height;



#pragma mark---获取当前抽屉根视图控制器

#pragma mark-----添加阴影边框
+ (void)addShadow:(UIView*)view;


+ (BOOL)getIsIpad;

#define oneImgSchemeID @"oneImgSchemeID"
#define twoImgSchemeID @"twoImgSchemeID"
#define threeImgSchemeID @"threeImgSchemeID"


@end
