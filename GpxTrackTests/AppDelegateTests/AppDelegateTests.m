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
#import "MapGpxTrackViewController.h"

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
        id nsDictionaryMock = OCMClassMock([NSDictionary class]);
        [self.delegate application:applicationMock didFinishLaunchingWithOptions:nsDictionaryMock];
        if([self.delegate.window.rootViewController isKindOfClass:[MapGpxTrackViewController class]]) {
            XCTAssert(TRUE, @"MapGpxTrackViewController set how root");
        } else {
            XCTAssert(NO, @"rootViewController is not MapGpxTrackViewController");
        }
        
    } else {
        XCTAssert(NO, @"Method setUpRootController not exist");
    }
}

@end
