//
//  AVOGoogleMobileAdsBannerViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 10.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVODFPBannerViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AVODFPBannerViewController () <GADBannerViewDelegate>

@property (nonatomic, weak) IBOutlet GADBannerView *bannerView;

@end

@implementation AVODFPBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bannerView.adUnitID = @"/5826056/MORFIX_IPHONE_320x50_TEST";
    self.bannerView.rootViewController = self;
    self.bannerView.delegate = self;

    GADRequest *request = [GADRequest new];
    request.testDevices = @[kGADSimulatorID];
    [self.bannerView loadRequest:request];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.bannerView.autoloadEnabled = YES;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.bannerView.autoloadEnabled = NO;
}

#pragma mark - GADBannerViewDelegate

- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error {
    NSLog(@"Error: %@", error.localizedDescription);
}

@end
