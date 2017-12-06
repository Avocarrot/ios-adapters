//
//  AvocarrotMoPubCustomAdapter.h
//  AvocarrotSDKAdaptersObjC
//
//  Created by Glispa GmbH on 14.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVONativeAssets;

@interface AvocarrotMoPubCustomAdapter : NSObject

- (instancetype)initWithAd:(AVONativeAssets *)ad;

- (void)registerClickToMopub;
- (void)registerImpressionToMopub;
- (void)registerFinishHandlingClickToMopub;

@end
