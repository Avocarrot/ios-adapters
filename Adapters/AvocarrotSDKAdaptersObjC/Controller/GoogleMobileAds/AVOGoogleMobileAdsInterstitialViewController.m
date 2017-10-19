//
//  AVOGoogleMobileAdsInterstitialViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 10.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOGoogleMobileAdsInterstitialViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AVOGoogleMobileAdsInterstitialViewController () <GADInterstitialDelegate>

@property (nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation AVOGoogleMobileAdsInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-4028010822193978/2540504840"];
    self.interstitial.delegate = self;

    GADRequest *request = [GADRequest new];
    request.testDevices = @[kGADSimulatorID];
    [self.interstitial loadRequest:request];
}

#pragma mark - GADInterstitialDelegate

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    [ad presentFromRootViewController:self];
}


@end
