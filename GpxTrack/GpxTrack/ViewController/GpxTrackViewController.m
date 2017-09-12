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
@property (nonatomic, strong, nullable) MASConstraint *centerYconstraintAuthorLabel;

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
    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.text = @"Author Pawel Trojan \n project shows track path from gpx files";
    self.authorLabel.textColor = [UIColor blackColor];
    self.authorLabel.numberOfLines = 0;
    self.authorLabel.textAlignment = NSTextAlignmentCenter;
    [self.authorLabel sizeToFit];
    [self.view addSubview:self.authorLabel];
    
    self.authorLabel.alpha = 0;
    __weak typeof(self) weakSelf = self;
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        if(weakSelf) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            strongSelf.centerYconstraintAuthorLabel = make.centerY.equalTo(self.view).offset(-8);
        }
        make.centerX.equalTo(self.view);
    }];
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
            strongSelf.centerYconstraintAuthorLabel = make.top.equalTo(self.view.mas_top).with.offset(64);
        }
        make.leading.equalTo(self.view.mas_leading).with.offset(0);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(0);
        make.height.equalTo(@(self.view.frame.size.height - 64));
    }];
    
    UIViewController *controller = [self getMapController];
    [self addChildViewController:controller];
    
    controller.view.alpha = 0;
    [self.containerViewMap addSubview:controller.view];
    
    [self.view setNeedsLayout];
    [UIView animateKeyframesWithDuration:5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            self.authorLabel.alpha = 1;
            
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:1 animations:^{
            controller.view.alpha = 1;

        }];
        
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
