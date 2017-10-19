//
//  AVOMoPubInterstitialViewController.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 04.10.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AVOMoPubInterstitialViewController.h"
#import <MoPub/MoPub.h>

@interface AVOMoPubInterstitialViewController () <MPInterstitialAdControllerDelegate>

@property (nonatomic, strong) MPInterstitialAdController *mpInterstitial;

@end

@implementation AVOMoPubInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mpInterstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:@"8eeb205df2c74608a48074f4fcc041dd"];
    self.mpInterstitial.delegate = self;
    [self.mpInterstitial loadAd];
}

#pragma mark - MPInterstitialAdControllerDelegate

- (void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    [interstitial showFromViewController:self];
}


@end
