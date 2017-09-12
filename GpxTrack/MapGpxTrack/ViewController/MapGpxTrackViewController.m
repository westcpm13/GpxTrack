//
//  MapGpxTrackViewController.m
//  GpxTrack
//
//  Created by Pawel Trojan on 06.09.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import "MapGpxTrackViewController.h"
#import <MapKit/MapKit.h>
#import "Masonry.h"

@interface MapGpxTrackViewController ()

@property (nonatomic, nonnull, strong) MKMapView *mapView;

@end

@implementation MapGpxTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self setUpMapView];
}

- (void)setUpView {
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)setUpMapView {
    self.mapView = [MKMapView new];
    [self.view addSubview: self.mapView];
    
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.leading.equalTo(self.view.mas_leading);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

@end
