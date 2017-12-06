//
//  AvocarrotMoPubCustomAdapter.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 14.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AvocarrotMoPubCustomAdapter.h"
#import "MoPub.h"
#import <AvocarrotNativeAssets/AvocarrotSDK+AVONativeAssets.h>

@interface AvocarrotMoPubCustomAdapter () <MPNativeAdAdapter>

@property (nonatomic, strong) AVONativeAssets *ad;
@property (nonatomic, strong) NSMutableDictionary *localProperties;

@end

@implementation AvocarrotMoPubCustomAdapter

@synthesize delegate;

#pragma mark - public methods

- (instancetype)initWithAd:(AVONativeAssets *)ad {
    if (self = [super init]) {
        self.localProperties = [NSMutableDictionary new];
        self.ad = ad;
    }
    
    return self;
}


- (void)registerClickToMopub {
    if (self.delegate && [self.delegate respondsToSelector:@selector(nativeAdDidClick:)]) {
        [self.delegate nativeAdDidClick:self];
    }
}


- (void)registerImpressionToMopub {
    if (self.delegate && [self.delegate respondsToSelector:@selector(nativeAdWillLogImpression:)]) {
        [self.delegate nativeAdWillLogImpression:self];
    }
}


- (void)registerFinishHandlingClickToMopub {
    [self.delegate nativeAdDidDismissModalForAdapter:self];
}

#pragma mark - getters/setter methods

- (void)setAd:(AVONativeAssets *)ad {
    _ad = ad;
    self.localProperties[kAdTitleKey] = ad.title;
    self.localProperties[kAdTextKey] = ad.text;
    self.localProperties[kAdIconImageKey] = ad.iconURL;
    self.localProperties[kAdMainImageKey] = ad.imageURL;
    self.localProperties[kAdCTATextKey] = ad.callToActionTitle;
    self.localProperties[kAdStarRatingKey] = @(ad.starRating);
    self.localProperties[kVASTVideoKey] = ad.vastString;
}


- (NSDictionary *)properties {
    return self.localProperties;
}

#pragma mark - MPNativeAdAdapter methods

- (NSURL *)defaultActionURL {
    return nil;
}


- (void)willAttachToView:(UIView *)view {
    if (!view) {
        return;
    }
    
    [self.ad registerViewForInteraction:view forClickableSubviews:nil];
}


- (BOOL)enableThirdPartyClickTracking {
    return YES;
}


@end
