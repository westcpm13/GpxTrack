//
//  MapGpxTrackViewController.m
//  GpxTrack
//
//  Created by Pawel Trojan on 31.08.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import "MapGpxTrackViewController.h"

@interface MapGpxTrackViewController ()

- (void) setUpView;

@end

@implementation MapGpxTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

- (void) setUpView {
    [self.view setBackgroundColor:[UIColor redColor]];
    [self.navigationController setTitle:@"MapGpxTrack"];
}

@end
