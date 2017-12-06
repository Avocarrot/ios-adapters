//
//  AVOMoPubBannerViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOMoPubBannerViewController.h"
#import <MoPub/MoPub.h>

@interface AVOMoPubBannerViewController () <MPAdViewDelegate>

@property (nonatomic, weak) IBOutlet UIView *bannerView;

@property (nonatomic, strong) MPAdView *mpBanner;

@end


@implementation AVOMoPubBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mpBanner = [[MPAdView alloc] initWithAdUnitId:@"284ac577607046c5b5609ec90d04af16" size:CGSizeMake(320, 50)];
    self.mpBanner.delegate = self;
    [self.mpBanner loadAd];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mpBanner startAutomaticallyRefreshingContents];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mpBanner stopAutomaticallyRefreshingContents];
}

#pragma mark - MPAdViewDelegate

- (void)adViewDidLoadAd:(MPAdView *)view {
    for (UIView *subview in self.bannerView.subviews) {
        [subview removeFromSuperview];
    }

    [self.bannerView addSubview:view];
}


- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

@end
