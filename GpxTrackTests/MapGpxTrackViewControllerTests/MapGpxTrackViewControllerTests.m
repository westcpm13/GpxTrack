//
//  MapGpxTrackViewControllerTests.m
//  GpxTrack
//
//  Created by Pawel Trojan on 01.09.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapGpxTrackViewController.h"
#import <OCMock/OCMock.h>
#import "AppDelegate.h"

@interface MapGpxTrackViewControllerTests : XCTestCase

@property(strong,nonatomic,nonnull) MapGpxTrackViewController *vc;

@end

@implementation MapGpxTrackViewControllerTests

- (void)setUp {
    [super setUp];
    //Test (RootController)were did AppDelegateTests
    id applicationMock = OCMClassMock([UIApplication class]);
    id nsDictionaryMock = OCMClassMock([NSDictionary class]);
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [delegate application:applicationMock didFinishLaunchingWithOptions:nsDictionaryMock];
    UINavigationController *nvc = (UINavigationController*)[delegate.window rootViewController];
    self.vc = (MapGpxTrackViewController*)nvc.topViewController;
    [self.vc view];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTitle {
    NSString *title = self.vc.navigationController.title;
    if ([title isEqualToString:@"MapGpxTrack"]) {
        XCTAssert(YES,@"MapGpxTrackViewController title OK");
    } else {
        XCTAssert(NO,@"MapGpxTrackViewController title bad");
    }
}



@end
