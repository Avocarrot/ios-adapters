//
//  AvocarrotMoPubBannerCustomEvent.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 24.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AvocarrotMoPubBannerCustomEvent.h"
#import <AvocarrotBanner/AvocarrotSDK+AVOBannerView.h>

@interface AvocarrotMoPubBannerCustomEvent ()

@property (nonatomic, strong) AVOBannerView *banner;

@end

@implementation AvocarrotMoPubBannerCustomEvent

- (void)requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info {
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
    
    if (!(CGSizeEqualToSize(size, CGSizeMake(320, 50)) || CGSizeEqualToSize(size, CGSizeMake(728, 90)) || CGSizeEqualToSize(size, CGSizeMake(300, 250)))) {
        NSLog(@"AvocarrotMoPubInterstitialCustomEvent - unsupported banner size!");
        [self requestDidFail];
        return;
    }
    
    AVOBannerViewSize avoSize = AVOBannerViewSizeSmall;
    if (CGSizeEqualToSize(size, CGSizeMake(728, 90))) {
        avoSize = AVOBannerViewSizeLarge;
    } else if (CGSizeEqualToSize(size, CGSizeMake(300, 250))) {
        avoSize = AVOBannerViewSizeMREC;
    }
    
    __weak AvocarrotMoPubBannerCustomEvent *weakSelf = self;
    
    [AvocarrotSDK.sharedSDK loadBannerWithSize:avoSize
                                      adUnitId:adUnitId
                                       success:^(AVOBannerView * _Nonnull bannerAd) {
                                           weakSelf.banner = [weakSelf preparedBannerWithCallbacksWithBanner:bannerAd];
                                           if (!weakSelf.banner) {
                                               [weakSelf requestDidFail];
                                           } else {
                                               [weakSelf.delegate bannerCustomEvent:weakSelf didLoadAd:weakSelf.banner];
                                           }
                                       } failure:^(AVOError * _Nonnull error) {
                                           
                                       }];
}


- (AVOBannerView *)preparedBannerWithCallbacksWithBanner:(AVOBannerView *)banner {
    if (!banner) {
        return nil;
    }
    
    __weak AvocarrotMoPubBannerCustomEvent *weakSelf = self;

    banner.autoUpdate = NO;
    
    [banner onClick:^{
        [weakSelf.delegate bannerCustomEventWillLeaveApplication:weakSelf];
    }];
    
    return banner;
}


- (void)requestDidFail {
    NSError *error = [[NSError alloc] initWithDomain:@"com.mopub.BannerCustomEvent" code:901 userInfo:nil];
    [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:error];
}

@end
