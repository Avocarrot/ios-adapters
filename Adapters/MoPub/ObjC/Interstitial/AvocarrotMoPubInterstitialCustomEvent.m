//
//  AvocarrotMoPubInterstitialCustomEvent.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 24.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AvocarrotMoPubInterstitialCustomEvent.h"
#import <AvocarrotInterstitial/AvocarrotSDK+AVOInterstitial.h>

@interface AvocarrotMoPubInterstitialCustomEvent ()

@property (nonatomic, strong) AVOInterstitial *interstitial;

@end

@implementation AvocarrotMoPubInterstitialCustomEvent

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info {
    if (!info) {
        NSLog(@"AvocarrotMoPubInterstitialCustomEvent - empty info!");
        [self requestDidFail];
        return;
    }
    
    NSString *adUnitId = info[@"adUnit"];
    if (!adUnitId) {
        NSLog(@"AvocarrotMoPubInterstitialCustomEvent - invalid adUnitId!");
        [self requestDidFail];
        return;
    }
    
    __weak AvocarrotMoPubInterstitialCustomEvent *weakSelf = self;
    
    [AvocarrotSDK.sharedSDK loadInterstitialWithAdUnitId:adUnitId
                                                 success:^(AVOInterstitial * _Nonnull interstitial) {
                                                     weakSelf.interstitial = [weakSelf preparedInterstitialWithCallbacksWithInterstitial:interstitial];
                                                     if (!weakSelf.interstitial) {
                                                         [weakSelf requestDidFail];
                                                     } else {
                                                         [weakSelf.delegate interstitialCustomEvent:weakSelf didLoadAd:weakSelf.interstitial];
                                                     }
                                                 } failure:^(AVOError * _Nonnull error) {
                                                     [weakSelf.delegate interstitialCustomEvent:weakSelf didFailToLoadAdWithError:error];
                                                 }];
}


- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController {
    [self.interstitial showFromViewController:rootViewController];
}


- (AVOInterstitial *)preparedInterstitialWithCallbacksWithInterstitial:(AVOInterstitial *)interstitial {
    if (!interstitial) {
        return nil;
    }
    
    __weak AvocarrotMoPubInterstitialCustomEvent *weakSelf = self;
    
    [[[[[interstitial onWillShow:^{
        [weakSelf.delegate interstitialCustomEventWillAppear:weakSelf];
    }] onDidShow:^{
        [weakSelf.delegate interstitialCustomEventDidAppear:weakSelf];
    }] onWillHide:^{
        [weakSelf.delegate interstitialCustomEventWillDisappear:weakSelf];
    }] onDidHide:^{
        [weakSelf.delegate interstitialCustomEventDidDisappear:weakSelf];
    }] onClick:^{
        [weakSelf.delegate interstitialCustomEventDidReceiveTapEvent:weakSelf];
    }];
    
    return interstitial;
}


- (void)requestDidFail {
    NSError *error = [[NSError alloc] initWithDomain:@"com.mopub.InterstitialCustomEvent" code:901 userInfo:nil];
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
}

@end
