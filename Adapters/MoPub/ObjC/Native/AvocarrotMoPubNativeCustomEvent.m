//
//  AvocarrotMoPubNativeCustomEvent.m
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 14.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import "AvocarrotMoPubNativeCustomEvent.h"
#import "AvocarrotMoPubCustomAdapter.h"
#import <AvocarrotCore/Avocarrot.h>
#import <AvocarrotNativeAssets/AvocarrotSDK+AVONativeAssets.h>

@interface AvocarrotMoPubNativeCustomEvent()

@property (nonatomic, strong) AvocarrotMoPubCustomAdapter *avocarrotCustomAdapter;

@end


@implementation AvocarrotMoPubNativeCustomEvent

- (void)requestAdWithCustomEventInfo:(NSDictionary *)info {
    if (!info) {
        NSLog(@"AvocarrotMoPubNativeCustomEvent - empty info!");
        [self requestDidFail];
        return;
    }
    
    NSString *adUnitId = info[@"adUnit"];
    if (!adUnitId) {
        NSLog(@"AvocarrotMoPubNativeCustomEvent - invalid adUnitId!");
        [self requestDidFail];
        return;
    }
    
    [AvocarrotSDK.sharedSDK loadNativeAdWithAdUnitId:adUnitId success:^UIView * _Nullable(AVONativeAssets * _Nonnull nativeAssests) {
        [[[nativeAssests onImpression:^{
            [self.avocarrotCustomAdapter registerImpressionToMopub];
        }] onClick:^{
            [self.avocarrotCustomAdapter registerClickToMopub];
        }] onLeftApplication:^{
            [self.avocarrotCustomAdapter registerFinishHandlingClickToMopub];
        }];
        
        self.avocarrotCustomAdapter = [[AvocarrotMoPubCustomAdapter alloc] initWithAd:nativeAssests];
        [self preloadImagesFromAd:nativeAssests];
        
        return nil;
    } failure:^(AVOError * _Nonnull error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(nativeCustomEvent:didFailToLoadAdWithError:)]) {
            [self.delegate nativeCustomEvent:self
                        didFailToLoadAdWithError:MPNativeAdNSErrorForInvalidAdServerResponse(error.localizedDescription)];
        }
    }];
}


- (void)preloadImagesFromAd:(AVONativeAssets *)ad {
    __block MPNativeAd *mopubAd = [[MPNativeAd alloc] initWithAdAdapter:(id <MPNativeAdAdapter>)self.avocarrotCustomAdapter];
    NSArray *images = [self getUrlsForImagesFromAd:ad];
    
    __weak AvocarrotMoPubNativeCustomEvent *weakSelf = self;
    
    [self precacheImagesWithURLs:images completionBlock:^(NSArray *errors) {
        if (errors) {
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(nativeCustomEvent:didFailToLoadAdWithError:)]) {
                [weakSelf.delegate nativeCustomEvent:weakSelf
                            didFailToLoadAdWithError:MPNativeAdNSErrorForImageDownloadFailure()];
            }
        } else {
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(nativeCustomEvent:didLoadAd:)]) {
                [weakSelf.delegate nativeCustomEvent:weakSelf didLoadAd:mopubAd];
            }
        }
    }];
}


- (void)requestDidFail {
    NSError *error = [[NSError alloc] initWithDomain:@"com.mopub.NativeCustomEvent" code:901 userInfo:nil];
    [self.delegate nativeCustomEvent:self didFailToLoadAdWithError:error];
}


- (NSArray<NSURL *> *)getUrlsForImagesFromAd:(AVONativeAssets *)ad {
    NSMutableArray<NSURL *> *urls = [NSMutableArray new];
    
    if (ad.iconURL || [@"" isEqualToString:ad.iconURL]) {
        NSURL *icon = [NSURL URLWithString:ad.iconURL];
        if (icon) {
            [urls addObject:icon];
        }
    }
    
    if (ad.imageURL || [@"" isEqualToString:ad.imageURL]) {
        NSURL *image = [NSURL URLWithString:ad.imageURL];
        if (image) {
            [urls addObject:image];
        }
    }
    
    return urls;
}

@end
