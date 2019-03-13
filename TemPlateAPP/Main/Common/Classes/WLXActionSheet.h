//
//  BYActionSheet.h
//  BYActionsheet
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 Bangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLXActionSheet;

@protocol WLXActionSheetDelegate <NSObject>
@optional
//如果点击的是空白处，那么index的值设为－1
- (void)actionSheet:(WLXActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
//设计是点击cacel按钮会调用
- (void)actionSheetCancel:(WLXActionSheet *)actionSheet;

- (void)willPresentActionSheet:(WLXActionSheet *)actionSheet;

- (void)didPresentActionSheet:(WLXActionSheet *)actionSheet;

- (void)actionSheet:(WLXActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex;

- (void)actionSheet:(WLXActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex;

@end

@interface WLXActionSheet : UIView<UITableViewDataSource,UITableViewDelegate>

- (UIView *)initWithTitle:(NSString *)title delegate:(id<WLXActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:( NSString *)destructiveButtonTitle otherButtonTitles:( NSString *)otherButtonTitles, ...;
- (UIView *)initWithTitle:(NSString *)title delegate:(id<WLXActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:( NSString *)destructiveButtonTitle otherButtonArray:(NSArray*)otherBtns;

- (void)showInView:(UIView *)view;

@end

