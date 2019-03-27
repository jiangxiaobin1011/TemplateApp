//
//  UIView+Common.m
//  Bike_Demo
//
//  Created by 姜斌 on 2017/2/16.
//  Copyright © 2017年 姜斌. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

+(UIView*)createAutoViewAndClass:(Class)class addToSuperView:(UIView*)superView
{
    UIView* v =  [[class  alloc] init];
    [superView addSubview:v];
    return v;
}


+(UIButton*)createBackBtn
{
    UIImage *backImage = [UIImage imageNamed:@"navigation_Back_Icon"];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60,40)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 30);
    [button setImage:backImage forState:UIControlStateNormal];
    return button;
}

+(UIBarButtonItem*)createBackBtn_BarButtonItem:(id)target andAction:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIImage *backImage = [UIImage imageNamed:@"navigation_Back_Icon"];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60,40)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 30);
    [button setImage:backImage forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:controlEvents];
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backItem;
}
+(UIBarButtonItem*)create_BarButtonItemWithImage:(UIImage*)image andTiele:(NSString*)titleStr  andTitleColor:(UIColor*)titleColor andTarget :(id)target andAction:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width,64)];
    if(image)
        [button setImage:image forState:UIControlStateNormal];
    else
    {
        button.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    if(titleStr)
    {
        [button setTitle:titleStr forState:UIControlStateNormal];
        [button sizeToFit];
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if(titleColor)
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:controlEvents];
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return backItem;
}



+(UILabel*)createNavlabel:(NSString*)titleStr andTieleColor:(UIColor*)titleColor
{
    UILabel* navlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    navlabel.text = titleStr;
    navlabel.font = [UIFont systemFontOfSize:18];
    navlabel.textColor = [UIColor whiteColor];
    if(titleColor)
        navlabel.textColor = titleColor;
    navlabel.textAlignment = NSTextAlignmentCenter;
    return navlabel;
}

+(void)radiusOfView:(CGFloat)radius :(UIView *)view
{
    view.layer.cornerRadius = radius;
    view.layer.masksToBounds = YES;
}

+(UIView*)create_line:(CGRect)frame
{
    UIView* line = [[UIView alloc] initWithFrame:frame];
    return line;
}


+ (UITextField*)create_textFiled_withPlacheor:(NSString*)placheor textColor:(UIColor*)textColor textFontSize:(UIFont*)textFontSize textAliement:(NSTextAlignment)textAliement{
    UITextField* textFiled = [UITextField new];
    textFiled.placeholder = placheor;
    textFiled.textColor = textColor;
    textFiled.font = textFontSize;
    textFiled.textAlignment  = textAliement;
    return textFiled;
}


-(void)changeViewRect_WithChange_contentOffset_X:(float)x{
    self.frame = CGRectMake(self .frame.origin.x+x, self .frame.origin.y, self .frame.size.width, self.frame.size.height);
    
}
-(void)changeViewRect_WithChange_contentOffset_Y:(float)y{
    self.frame = CGRectMake(self .frame.origin.x, self .frame.origin.y+y, self .frame.size.width, self.frame.size.height);
    
}


-(void)changeViewRect_WithChangeWidth:(float)width{
    self.frame = CGRectMake(self .frame.origin.x, self .frame.origin.y, width, self.frame.size.height);
}

-(void)changeViewRect_WithChangeHeight:(float)height{
    self.frame = CGRectMake(self .frame.origin.x, self .frame.origin.y, self .frame.size.width, height);
}




-(void)changeViewRect_WithChange_X:(float)x{
    self.frame = CGRectMake(x, self .frame.origin.y, self .frame.size.width, self.frame.size.height);
    
}
-(void)changeViewRect_WithChange_Y:(float)y{
    self.frame = CGRectMake(self .frame.origin.x, y, self .frame.size.width, self.frame.size.height);
}



+(UILabel*)create_Label_WithBackGroundColor:(UIColor*)backGroundColor textAligment:(NSTextAlignment)textAligment font:(UIFont*)font textColor:(UIColor*)textColor text:(NSString*)text
{
    UILabel* label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    if(backGroundColor)
        label.backgroundColor = backGroundColor;
    if(textColor)
        label.textColor = textColor;
    if(textAligment)
        label.textAlignment = textAligment;
    if(font)
        label.font = font;
    if(text)
        label.text = text;
    else
        label.text = @"";
    return label;
    
}

+(UIButton*)create_Button_WithBackGroundColor:(UIColor*)backGroundColor  textColor:(UIColor*)textColor text:(NSString*)text image:(NSString*)imageStr font:(UIFont*)textfont bordeColor:(CGColorRef)bordeColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if(backGroundColor)
        btn.backgroundColor = backGroundColor;
    if(text)
        [btn setTitle:text forState:UIControlStateNormal];
    if(imageStr)
        [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    if(textfont > 0)
        btn.titleLabel.font = textfont;
    if(textColor)
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    if(bordeColor)
        btn.layer.borderColor = bordeColor;
    if(borderWidth > 0)
        btn.layer.borderWidth = borderWidth;
    if(cornerRadius > 0)
    {
        btn.layer.cornerRadius =  cornerRadius;
        btn.layer.masksToBounds = YES;
    }
    return btn;
    
}


+(UIButton*)create_Button_WithBackGroundColor:(UIColor*)backGroundColor  textColor:(UIColor*)textColor text:(NSString*)text image:(NSString*)imageStr font:(UIFont*)textfont bordeColor:(CGColorRef)bordeColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius frame:(CGRect)frame
{
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = frame;
    if(backGroundColor)
        btn.backgroundColor = backGroundColor;
    if(text)
        [btn setTitle:text forState:UIControlStateNormal];
    if(imageStr)
        [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    if(textfont > 0)
        btn.titleLabel.font = textfont;
    if(textColor)
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    if(bordeColor)
        btn.layer.borderColor = bordeColor;
    if(borderWidth > 0)
        btn.layer.borderWidth = borderWidth;
    if(cornerRadius > 0)
    {
        btn.layer.cornerRadius =  cornerRadius;
        btn.layer.masksToBounds = YES;
    }
    return btn;
    
}

+(CGSize)getImageSize_WithImageName:(NSString*)nameStr
{
    UIImage* image = [UIImage imageNamed:nameStr];
    return image.size;
    
}

+(void)chanLabelAttribute:(UILabel*)label :(NSString*)changeStr
{
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange range = [label.text rangeOfString:changeStr];
    [attributedString addAttribute:NSFontAttributeName
     
                             value:[UIFont systemFontOfSize:18]
                             range:range];
    
    [attributedString addAttribute:NSForegroundColorAttributeName
     
                             value:[UIColor blackColor]
                             range:range];
    
    label.attributedText = attributedString;
}
+(void)changeLabelAttributeWithStr:(NSString*)changeStr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLabel:(UILabel*)label
{
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange range = [label.text rangeOfString:changeStr];
    [attributedString addAttribute:NSFontAttributeName
     
                             value:font
                             range:range];
    
    [attributedString addAttribute:NSForegroundColorAttributeName
     
                             value:color
                             range:range];
    
    label.attributedText = attributedString;
    
}

+(void)changeLabelAttributeWithChangeStrArr:(NSArray*)changeArr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLabel:(UILabel*)label
{
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    
    for (NSString* changeStr in changeArr) {
        NSRange range = [label.text rangeOfString:changeStr];
        [attributedString addAttribute:NSFontAttributeName
                                 value:font
                                 range:range];
        [attributedString addAttribute:NSForegroundColorAttributeName
                                 value:color
                                 range:range];
    }
    label.attributedText = attributedString;
    
}


+(void)changeLabelAttributeWithRange:(NSRange)range andFont:(UIFont*)font andChangeColor:(UIColor*)color andLabel:(UILabel*)label{
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attributedString addAttribute:NSFontAttributeName
                             value:font
                             range:range];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:color
                             range:range];
    label.attributedText = attributedString;
}





#pragma mark 改变行间距
+(void)changeLabelAttributeWithChangeStrArr:(NSArray*)changeArr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLineSpace:(float)Linespace andLabel:(UILabel*)label
{
    
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为30
    [paragraphStyle  setLineSpacing:15];
    
    
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    
    for (NSString* changeStr in changeArr) {
        NSRange range = [label.text rangeOfString:changeStr];
        [attributedString addAttribute:NSFontAttributeName
                                 value:font
                                 range:range];
        [attributedString addAttribute:NSForegroundColorAttributeName
                                 value:color
                                 range:range];
    }
    
    [attributedString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    
    
    
    
    
    label.attributedText = attributedString;
    
}



+(void)changeLabelAttributeWithStr:(NSString*)changeStr andFont:(UIFont*)font andChangeColor:(UIColor*)color andLineSpace:(float)Linespace andLabel:(UILabel*)label{
    
    NSMutableParagraphStyle  *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    // 行间距设置为30
    [paragraphStyle  setLineSpacing:15];
    
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange range = [label.text rangeOfString:changeStr];
    [attributedString addAttribute:NSFontAttributeName
     
                             value:font
                             range:range];
    
    [attributedString addAttribute:NSForegroundColorAttributeName
     
                             value:color
                             range:range];
    [attributedString  addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    
    label.attributedText = attributedString;
    
}


+(NSMutableAttributedString*)changeViewAttributeWithStr:(NSString*)changeStr andFont:(UIFont*)font andChangeColor:(UIColor*)color andAllStr:(NSString*)allStr{
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:allStr];
    NSRange range = [allStr rangeOfString:changeStr];
    
    if(font)
        [attributedString addAttribute:NSFontAttributeName
                                 value:font
                                 range:range];
    if (color) {
        [attributedString addAttribute:NSForegroundColorAttributeName
         
                                 value:color
                                 range:range];
    }
    return attributedString;
}

+(NSMutableAttributedString*)changeViewAttributeWithChangeStr:(NSString*)changeStr andChangeFont:(UIFont*)font andChangeColor:(UIColor*)color andAllStr:(NSString*)allStr andBaseFont:(UIFont*)baseFont andBaseColor:(UIColor*)baseColor{
    NSMutableAttributedString*  attributedString = [[NSMutableAttributedString alloc] initWithString:allStr];
    
    [attributedString addAttribute:NSFontAttributeName
                             value:baseFont
                             range:NSMakeRange(0, allStr.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:baseColor
                             range:NSMakeRange(0, allStr.length)];
    
    
    NSRange range = [allStr rangeOfString:changeStr];
    
    if(font)
        [attributedString addAttribute:NSFontAttributeName
                                 value:font
                                 range:range];
    if (color) {
        [attributedString addAttribute:NSForegroundColorAttributeName
         
                                 value:color
                                 range:range];
    }
    return attributedString;
}

+ (void)addShadow:(UIView*)view{
    view.layer.shadowColor = [UIColor grayColor].CGColor;//阴影颜色
    view.layer.shadowOffset = CGSizeMake(0, 2);//偏移距离
    view.layer.shadowOpacity = 0.5;//不透明度
    view.layer.shadowRadius = 5.0;//半径
}

@end

