//
//  JNetReachabilityTool.m
//  TemPlateAPP
//
//  Created by lorne on 2019/3/15.
//  Copyright © 2019 ice. All rights reserved.
//

#import "JNetReachabilityTool.h"
#import "AFNetworking.h"

@interface JNetReachabilityTool()
- (void)startMonitoring;

- (void)stopMonitoring;

@end


@implementation JNetReachabilityTool
- (instancetype)init
{
    if (self = [super init]) {
        self.currentStatus = JJNetworkReachabilityToolNetStatusUnknow;
    }
    return self;
}

#pragma mark - Class Public Function

+ (instancetype)shareNetworkReachabilityTool
{
    static JNetReachabilityTool *reachablityTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reachablityTool = [[JNetReachabilityTool alloc] init];
    });
    return reachablityTool;
}

#pragma mark - Object Private Function

- (void)startMonitoring
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)stopMonitoring
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    __weak typeof(self) weakSelf = self;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if(self.delegate && [self.delegate respondsToSelector:@selector(networkStatusHasCHanged:)]){
            [self.delegate networkStatusHasCHanged:status];
        }
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                weakSelf.currentStatus = JJNetworkReachabilityToolNetStatusReachableViaWiFi;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                weakSelf.currentStatus = JJNetworkReachabilityToolNetStatusReachableViaWWAN;
                break;
                
            default:
                weakSelf.currentStatus = JJNetworkReachabilityToolNetStatusNotReachable;
                break;
        }
    }];
    
    [self startMonitoring];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self stopMonitoring];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    return YES;
}

#pragma mark - Getter Function

- (BOOL)isReachable
{
    return [self isReachableViaWiFi] || [self isReachableViaWWAN];
}

- (BOOL)isReachableViaWWAN
{
    return self.currentStatus == JJNetworkReachabilityToolNetStatusReachableViaWWAN;
}

- (BOOL)isReachableViaWiFi
{
    return self.currentStatus == JJNetworkReachabilityToolNetStatusReachableViaWiFi;
}

@end
