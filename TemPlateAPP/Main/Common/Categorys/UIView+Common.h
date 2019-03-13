//
//  UIView+Common.h
//  Bike_Demo
//
//  Created by 姜斌 on 2017/2/16.
//  Copyright © 2017年 姜斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (Common)

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


#pragma mark-----添加阴影边框
+ (void)addShadow:(UIView*)view;



@end
