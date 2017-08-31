//
//  MapGpxTrackViewControllerTests.m
//  GpxTrack
//
//  Created by Pawel Trojan on 01.09.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MapGpxTrackViewController.h"

@interface MapGpxTrackViewControllerTests : XCTestCase

@property(strong,nonatomic,nonnull) MapGpxTrackViewController *vc;

@end

@implementation MapGpxTrackViewControllerTests

- (void)setUp {
    [super setUp];
    self.vc = [MapGpxTrackViewController new];
    [self.vc view];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTitle {
    XCTAssertEqual(self.vc.navigationController.title, @"MapGpxTrack", @"check title MapGpxTrackViewController");
}



@end
