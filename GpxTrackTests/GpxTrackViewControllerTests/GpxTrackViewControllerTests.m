//
//  GpxTrackViewControllerTests.m
//  GpxTrack
//
//  Created by Pawel Trojan on 01.09.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GpxTrackViewController.h"
#import <OCMock/OCMock.h>
#import "AppDelegate.h"
#import "MapGpxTrackViewController.h"

@interface GpxTrackViewController (Test)

@property (nonatomic, strong, nonnull) UILabel *authorLabel;
- (UIView *) getContainerMapView;

@end

@interface GpxTrackViewControllerTests : XCTestCase

@property(strong,nonatomic,nonnull) GpxTrackViewController *vc;

@end

@implementation GpxTrackViewControllerTests

- (void)setUp {
    [super setUp];
    //Test (RootController)were did AppDelegateTests
    id applicationMock = OCMClassMock([UIApplication class]);
    id nsDictionaryMock = [NSDictionary new];
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [delegate application:applicationMock didFinishLaunchingWithOptions:nsDictionaryMock];
    UINavigationController *nvc = (UINavigationController*)[delegate.window rootViewController];
    self.vc = (GpxTrackViewController*)nvc.topViewController;
    [self.vc view];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testTitle {
    NSString *title = self.vc.navigationItem.title;
    if ([title isEqualToString:@"MapGpxTrack"]) {
        XCTAssert(YES,@"GpxTrackViewController title OK");
    } else {
        XCTAssert(NO,@"GpxTrackViewController title bad");
    }
}

- (void)testIfContainerViewMapIsNotNull {
    UIView *containerViewMap = [self.vc getContainerMapView];
    XCTAssertNotNil(containerViewMap,"ContainerViewMap = nil !!!");
}

- (void)testIfExistFunctionReturnMapGpxTrackViewController_ShouldBeNotNull {
    MapGpxTrackViewController *mapVC = [self.vc getMapController];
    XCTAssertNotNil(mapVC,"MapGpxTrackViewController = nil error!");
}

- (void)testTitleAutohorLabel {
    NSString *authorTitle = self.vc.authorLabel.text;
    XCTAssertEqualObjects(authorTitle, @"Author Pawel Trojan \n project shows track path from gpx files", @"authorLabel title is bad");
}


@end
