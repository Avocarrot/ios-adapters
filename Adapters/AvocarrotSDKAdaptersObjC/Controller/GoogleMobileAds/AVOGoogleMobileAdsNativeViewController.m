//
//  AVOGoogleMobileAdsNativeViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 10.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOGoogleMobileAdsNativeViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AVOGoogleMobileAdsNativeViewController () <GADNativeExpressAdViewDelegate, GADVideoControllerDelegate>

@property (nonatomic, weak) IBOutlet GADNativeExpressAdView *nativeExpressAdView;

@end

@implementation AVOGoogleMobileAdsNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nativeExpressAdView.adUnitID = @"ca-app-pub-4028010822193978/5564473644";
    self.nativeExpressAdView.rootViewController = self;
    self.nativeExpressAdView.delegate = self;

    GADVideoOptions *videoOptions = [GADVideoOptions new];
    videoOptions.startMuted = YES;
    [self.nativeExpressAdView setAdOptions:@[videoOptions]];
    self.nativeExpressAdView.videoController.delegate = self;

    GADRequest *request = [GADRequest new];
    request.testDevices = @[kGADSimulatorID];
    [self.nativeExpressAdView loadRequest:request];
}

#pragma mark - GADNativeExpressAdViewDelegate

- (void)nativeExpressAdViewDidReceiveAd:(GADNativeExpressAdView *)nativeExpressAdView {
    if (nativeExpressAdView.videoController.hasVideoContent) {
        NSLog(@"Received an ad with a video asset");
    } else {
        NSLog(@"Received an ad without a video asset");
    }
}


- (void)nativeExpressAdView:(GADNativeExpressAdView *)nativeExpressAdView didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Error: %@", error.localizedDescription);
}

#pragma mark - GADVideoControllerDelegate

- (void)videoControllerDidEndVideoPlayback:(GADVideoController *)videoController {
    NSLog(@"The video asset has completed playback");
}


@end
