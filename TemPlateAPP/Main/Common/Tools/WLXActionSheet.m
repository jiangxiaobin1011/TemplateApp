//
//  BYActionSheet.m
//  BYActionsheet
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 Bangyang. All rights reserved.
//

#import "WLXActionSheet.h"

#define ksCellHeight            54

//UI
#define cancelBackgroundColor   [UIColor colorWithRed:160 / 255.0 green:231 / 255.0 blue:90 / 255.0 alpha:1]   //底部按钮的背景颜色

#define titleColor               [UIColor colorWithRed:30 / 255.0 green:29 / 255.0 blue:27 / 255.0 alpha:1]    //文字显示的颜色

#define specialTextColor        [UIColor colorWithRed:51 / 255.0 green:51 / 255.0 blue:51 / 255.0 alpha:1]   //特殊文字的颜色（最靠近底部按钮的那个栏，文字的颜色）



@interface WLXActionSheet ()

//此处的属性用来做记录
@property (nonatomic, weak)id<WLXActionSheetDelegate>delegate; //设置代理
@property (nonatomic, strong)NSArray * titleArray;            //除了底部按钮之外的栏
@property (nonatomic, strong)NSString * title;                //标题
@property (nonatomic, strong)NSString * destructiveTitle;     //第一个栏
@property (nonatomic, strong)NSString * cancelTitle;          //底部按钮文本
@property (nonatomic, strong)id  oldDelegate;                 //记录上次显示时候的代理。

@end


@implementation WLXActionSheet
- (UIView *)initWithTitle:(NSString *)title delegate:(id<WLXActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:( NSString *)destructiveButtonTitle otherButtonArray:(NSArray*)otherBtns{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.delegate = delegate;
        _oldDelegate = delegate;
        
        NSMutableArray * otherArray = [NSMutableArray array];
        if (destructiveButtonTitle.length != 0) {
            [otherArray addObject:destructiveButtonTitle];
        }
        if(otherBtns != nil && otherBtns.count > 0){
            [otherArray addObjectsFromArray:otherBtns];
        }
        _titleArray = otherArray;
        _title = title;
        _cancelTitle = cancelButtonTitle;
        _destructiveTitle = destructiveButtonTitle;
    }
    return self;

}

- (UIView *)initWithTitle:(NSString *)title delegate:(id<WLXActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:( NSString *)destructiveButtonTitle otherButtonTitles:( NSString *)otherButtonTitles, ...
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.delegate = delegate;
        _oldDelegate = delegate;
        
        NSMutableArray * otherArray = [NSMutableArray array];
        if (destructiveButtonTitle.length != 0) {
            [otherArray addObject:destructiveButtonTitle];
        }
        va_list args;
        va_start(args, otherButtonTitles);
        while (otherButtonTitles != nil)
        {
            [otherArray addObject:otherButtonTitles];
            otherButtonTitles = va_arg(args, NSString *);
        }
        _titleArray = otherArray;
        _title = title;
        _cancelTitle = cancelButtonTitle;
        _destructiveTitle = destructiveButtonTitle;
    }
    return self;
}

- (void)dimView
{
    self.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight);
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
    view.tag = 200;
    view.alpha = 0;
    [self addSubview:view];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [view addGestureRecognizer:tap];
}

-(void)initCancelTitle:(NSString *)canceltitle destructiveTitle:(NSString *)destructiveButtonTitle otherTitles:(NSArray *)otherTitle title:(NSString *)title
{
    float tableViewHeight = 0.0;
    if (title.length == 0) {
        tableViewHeight = otherTitle.count * ksCellHeight;
    }
    else
    {
        tableViewHeight = (otherTitle.count + 1) * ksCellHeight - 10;
    }
    float height = tableViewHeight  + 5 + ksCellHeight;
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight, KScreenWidth - 0, height)];
    bottomView.tag = 100;
    bottomView.backgroundColor = [UIColor clearColor];
    [self addSubview:bottomView];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth , tableViewHeight) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.backgroundView = nil;
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.layer.cornerRadius = 10;
    //    tableView.layer.masksToBounds = YES;
    tableView.rowHeight = ksCellHeight;
    tableView.bounces = NO;
    [bottomView addSubview:tableView];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(tableView.frame.origin.x, tableViewHeight + 5, tableView.frame.size.width, ksCellHeight);
    cancelBtn.backgroundColor = [UIColor whiteColor];
    [cancelBtn setTitle:canceltitle forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1]  forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    //    cancelBtn.layer.cornerRadius = 5.0;
    //    cancelBtn.layer.masksToBounds = YES;
    [bottomView addSubview:cancelBtn];
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
}

- (void)showInView:(UIView *)view
{
    if (self.delegate == nil) {
        self.delegate = _oldDelegate;
    }
    [self dimView];
    [self initCancelTitle:_cancelTitle destructiveTitle:_destructiveTitle otherTitles:_titleArray title:_title];
    UIWindow * keyWindow = [[UIApplication sharedApplication] keyWindow];
    if (keyWindow == nil) {
        [view addSubview:self];
    }
    else
    {
        [keyWindow addSubview:self];
    }
    UIView * dimView = (UIView *)[self viewWithTag:200];
    UIView * contentView = (UIView *)[self viewWithTag:100];
    if ([self.delegate respondsToSelector:@selector(willPresentActionSheet:)]) {
        [self.delegate willPresentActionSheet:self];
    }
    
    [UIView animateWithDuration:.28 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        dimView.alpha = 1;
        contentView.frame = CGRectMake(0, KScreenHeight - contentView.frame.size.height, KScreenWidth, contentView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        if ([self.delegate respondsToSelector:@selector(didPresentActionSheet:)]) {
            [self.delegate didPresentActionSheet:self];
        }
    }];
}

#pragma mark - tapClick
- (void)tapClick:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:-1];
    }
    [self hidden:-1];
}

- (void)hidden:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(actionSheet:willDismissWithButtonIndex:)] && index != -1) {
        [self.delegate actionSheet:self willDismissWithButtonIndex:index];
    }
    UIView * dimView = (UIView *)[self viewWithTag:200];
    UIView * contentView = (UIView *)[self viewWithTag:100];
    
    [UIView animateWithDuration:.28 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        contentView.frame = CGRectMake(0, KScreenHeight, KScreenWidth - 0, contentView.frame.size.height);
        dimView.alpha = 0;
        
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(actionSheet:didDismissWithButtonIndex:)] && index != -1) {
            [self.delegate actionSheet:self didDismissWithButtonIndex:index];
        }
        [contentView removeFromSuperview];
        [dimView removeFromSuperview];
        self.delegate = nil;
        [self removeFromSuperview];
    }];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identfier = @"cellId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
        cell.backgroundView = nil;
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
        
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    
    cell.textLabel.textColor = specialTextColor;
    //    if (indexPath.row == _titleArray.count - 1)
    //    {
    //        cell.textLabel.textColor = specialTextColor;
    //    }
    //    else
    //    {
    //        cell.textLabel.textColor = titleColor;
    //    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
    if (_title.length != 0)
    {
        return ksCellHeight - 10;
    }
    return 0.000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_title.length == 0) {
        return nil;
    }
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth - 20, ksCellHeight - 10)];
    label.textColor = [UIColor grayColor];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = _title;
    return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:indexPath.row];
    }
    [self hidden:indexPath.row];
}

- (void)cancelBtnClick:(UIButton *)cancelBtn
{
    if ([self.delegate respondsToSelector:@selector(actionSheetCancel:)]) {
        [self.delegate actionSheetCancel:self];
    }
    if ([self.delegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate actionSheet:self clickedButtonAtIndex:_titleArray.count];
    }
    [self hidden:_titleArray.count];
}


@end

