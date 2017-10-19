//
//  AVOGoogleMobileAdsBannerViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 10.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOGoogleMobileAdsBannerViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AVOGoogleMobileAdsBannerViewController () <GADBannerViewDelegate>

@property (nonatomic, weak) IBOutlet GADBannerView *bannerView;

@end

@implementation AVOGoogleMobileAdsBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bannerView.adUnitID = @"ca-app-pub-4028010822193978/1063771648";
    self.bannerView.rootViewController = self;
    self.bannerView.delegate = self;

    GADRequest *request = [GADRequest new];
    request.testDevices = @[kGADSimulatorID];
    [self.bannerView loadRequest:request];
}

#pragma mark - GADBannerViewDelegate

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Error: %@", error.localizedDescription);
}

@end
