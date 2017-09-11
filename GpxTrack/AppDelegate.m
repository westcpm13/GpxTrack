//
//  AppDelegate.m
//  GpxTrack
//
//  Created by Pawel Trojan on 31.08.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import "AppDelegate.h"
#import "GpxTrackViewController.h"

@interface AppDelegate ()

- (void)setUpRootController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setUpRootController];
    
    return YES;
}

- (void)setUpRootController {
    
    GpxTrackViewController *vc = [[GpxTrackViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController: vc];
    [self.window setRootViewController: nvc];
    [self.window makeKeyWindow];
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}


@end
