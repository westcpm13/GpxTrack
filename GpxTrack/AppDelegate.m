//
//  AppDelegate.m
//  GpxTrack
//
//  Created by Pawel Trojan on 31.08.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import "AppDelegate.h"
#import "MapGpxTrackViewController.h"

@interface AppDelegate ()

@property (strong,nonatomic) MapGpxTrackViewController *vc;

- (void)setUpRootController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setUpRootController];
    
    return YES;
}

- (void)setUpRootController {
    
    self.vc = [[MapGpxTrackViewController alloc] init];
    [self.window setRootViewController: self.vc];
    [self.window makeKeyWindow];
}

- (void)applicationWillResignActive:(UIApplication *)application {}

- (void)applicationDidEnterBackground:(UIApplication *)application {}

- (void)applicationWillEnterForeground:(UIApplication *)application {}

- (void)applicationDidBecomeActive:(UIApplication *)application {}

- (void)applicationWillTerminate:(UIApplication *)application {}


@end
