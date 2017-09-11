//
//  GpxTrackViewController.m
//  GpxTrack
//
//  Created by Pawel Trojan on 31.08.2017.
//  Copyright © 2017 Pawel Trojan. All rights reserved.
//

#import "GpxTrackViewController.h"
#import "MapGpxTrackViewController.h"
#import "Masonry.h"

@interface GpxTrackViewController ()

@property (nonatomic, strong, nonnull) UILabel *authorLabel;
@property (nonatomic, strong, nonnull) UIView *containerViewMap;
@property (nonatomic, strong, nullable) MASConstraint *topConstraintContainerViewMap;

- (void) setUpView;

@end

@implementation GpxTrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self setUpContainerView];
    [self getMapController];
}

- (void)setUpView {
    self.view.backgroundColor = UIColor.redColor;
    self.navigationItem.title = @"MapGpxTrack";
    self.authorLabel = [UILabel new];
    self.authorLabel.text = @"Author Pawel Trojan \n project shows path from gpx files";
    [self.authorLabel sizeToFit];
    [self.view addSubview:self.authorLabel];
}

#pragma mark - ContainerMapView

///////////////////////////////
//     CREATE AND SETUP      //
///////////////////////////////

- (void)setUpContainerView {
    self.containerViewMap = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: self.containerViewMap];

    __weak typeof(self) weakSelf = self;
    
    [self.containerViewMap mas_makeConstraints:^(MASConstraintMaker *make) {
        if (weakSelf) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.topConstraintContainerViewMap = make.top.equalTo(self.view.mas_top).with.offset(64+strongSelf.view.frame.size.height);
        }
        make.leading.equalTo(self.view.mas_leading).with.offset(0);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
    UIViewController *controller = [self getMapController];
    [self addChildViewController:controller];
    
    controller.view.alpha = 0;
    [self.containerViewMap addSubview:controller.view];
    [UIView animateWithDuration:3 animations:^{
        controller.view.alpha = 1;
    } completion:NULL];
    

    [controller.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.containerViewMap).with.offset(0);
        make.top.equalTo(self.containerViewMap.mas_top).with.offset(0);
        make.trailing.equalTo(self.containerViewMap.mas_trailing).with.offset(0);
        make.bottom.equalTo(self.containerViewMap.mas_bottom).offset(0);
    }];
    
    [controller didMoveToParentViewController:self];
    
}


//////////////////////////////////////
//  GET VIEW AND MAPVIEWCONTROLLER  //      
//////////////////////////////////////

- (UIView *)getContainerMapView {
    return self.containerViewMap;
}

- (MapGpxTrackViewController *)getMapController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MapGpxStoryboard" bundle:nil];
    MapGpxTrackViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MapGpxTrackViewController"];
    return vc;
}

@end
