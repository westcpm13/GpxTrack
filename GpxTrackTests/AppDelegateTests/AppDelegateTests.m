//
//  AppDelegateTests.m
//  GpxTrack
//
//  Created by Pawel Trojan on 31.08.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "AppDelegate.h"
#import "GpxTrackViewController.h"

@interface AppDelegateTests : XCTestCase

@property (strong, nonatomic,nonnull) AppDelegate *delegate;

@end

@implementation AppDelegateTests

- (void)setUp {
    [super setUp];
    self.delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRootViewController {
    
    SEL selectorSetUpRootController = NSSelectorFromString(@"setUpRootController");
    
    if([self.delegate respondsToSelector:selectorSetUpRootController] == YES) {
        
        id applicationMock = OCMClassMock([UIApplication class]);
        id nsDictionaryMock = [NSDictionary new];
        [self.delegate application:applicationMock didFinishLaunchingWithOptions:nsDictionaryMock];
        
        if([self.delegate.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nvc = (UINavigationController*)[self.delegate.window rootViewController];
            if([nvc.topViewController isKindOfClass:[GpxTrackViewController class]]) {
                XCTAssert(TRUE, @"GpxTrackViewController set in UINavigationController how first");

            } else {
                XCTAssert(NO, @"GpxTrackViewController doesn't set in UINavigationController how first");
            }
        } else {
            XCTAssert(NO, @"rootViewController is not UINavigationController");
        }
        
    } else {
        XCTAssert(NO, @"Method setUpRootController not exist");
    }
}

@end
