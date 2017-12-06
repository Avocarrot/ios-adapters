//
//  AVOGoogleMobileAdsInterstitialViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 10.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVODFPInterstitialViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AVODFPInterstitialViewController () <GADInterstitialDelegate>

@property (nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation AVODFPInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"/5826056/MORFIX_IPHONE_SPLASH_TEST"];
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
