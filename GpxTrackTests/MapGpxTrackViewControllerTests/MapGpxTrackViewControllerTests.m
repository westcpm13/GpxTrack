//
//  MapGpxTrackViewControllerTests.m
//  GpxTrack
//
//  Created by Pawel Trojan on 06.09.2017.
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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MapGpxStoryboard" bundle:nil];
    self.vc = (MapGpxTrackViewController *) [storyboard instantiateViewControllerWithIdentifier:@"MapGpxTrackViewController"];
    [self.vc view];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMapGpxTrackViewControllerNotNil {
    XCTAssertNotNil(self.vc,@"vc = nil");
}

@end
