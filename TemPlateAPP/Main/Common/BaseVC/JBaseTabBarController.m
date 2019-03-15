//
//  JBaseTabBarController.m
//  TemPlateAPP
//
//  Created by lorne on 2019/3/15.
//  Copyright © 2019 ice. All rights reserved.
//

#import "JBaseTabBarController.h"

@interface JBaseTabBarController ()

@end

@implementation JBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIViewController* homeVC = [self subViewContorllerWithClassStr:@"HomeViewController" title:@"首页" imageName:@""];
    
    UIViewController* meVC = [self subViewContorllerWithClassStr:@"MeViewController" title:@"我" imageName:@""];

    
    
    self.viewControllers = @[homeVC,meVC];
    
    
    // Do any additional setup after loading the view.
}


- (UIViewController*)subViewContorllerWithClassStr:(NSString*)classStr title:(NSString*)title imageName:(NSString*)imageName{
    Class cs = NSClassFromString(classStr);
    UIViewController* VC = [[cs alloc] init];
    NSAssert([VC isKindOfClass:[UIViewController class]], @"类名写错了");
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:VC];
    return nav;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
