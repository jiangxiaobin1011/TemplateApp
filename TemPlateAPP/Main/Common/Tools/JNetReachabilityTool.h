//
//  JNetReachabilityTool.h
//  TemPlateAPP
//
//  Created by lorne on 2019/3/15.
//  Copyright © 2019 ice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JJNetworkReachabilityToolNetStatus)
{
    JJNetworkReachabilityToolNetStatusUnknow = -1,
    JJNetworkReachabilityToolNetStatusNotReachable,
    JJNetworkReachabilityToolNetStatusReachableViaWWAN,
    JJNetworkReachabilityToolNetStatusReachableViaWiFi,
};



@protocol JNetworkDelegate <NSObject>

@optional
- (void)networkStatusHasCHanged:(AFNetworkReachabilityStatus)status;

@end


@protocol JJNetworkToolProtocol <NSObject>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)applicationWillResignActive:(UIApplication *)application;

- (void)applicationDidEnterBackground:(UIApplication *)application;

- (void)applicationWillEnterForeground:(UIApplication *)application;

- (void)applicationDidBecomeActive:(UIApplication *)application;

- (void)applicationWillTerminate:(UIApplication *)application;

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options;

@end

NS_ASSUME_NONNULL_BEGIN

@interface JNetReachabilityTool : NSObject <JJNetworkToolProtocol>

@property (nonatomic , assign) id <JNetworkDelegate>delegate;

@property (nonatomic,assign) JJNetworkReachabilityToolNetStatus currentStatus;
@property (nonatomic, assign, readonly, getter = isReachable) BOOL reachable;
@property (nonatomic, assign, readonly, getter = isReachableViaWWAN) BOOL reachableViaWWAN;
@property (nonatomic, assign, readonly, getter = isReachableViaWiFi) BOOL reachableViaWiFi;

+ (instancetype) shareNetworkReachabilityTool;

@end

NS_ASSUME_NONNULL_END
