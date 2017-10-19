//
//  AvocarrotAdMobCustomEventNativeAd.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 15/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeAssets
import GoogleMobileAds

@objc(AvocarrotAdMobCustomEventNativeAd)
class AvocarrotAdMobCustomEventNativeAd: NSObject, GADCustomEventNativeAd {
    weak var delegate: GADCustomEventNativeAdDelegate?

    func request(withParameter serverParameter: String,
                 request: GADCustomEventRequest,
                 adTypes: [Any],
                 options: [Any],
                 rootViewController: UIViewController) {

        AvocarrotSDK.shared.loadNativeAd(withAdUnitId: serverParameter,
                                      success: { (nativeAssers) -> UIView? in
                                        let mediatedAd = AvocarrotAdMobMediatedNativeContentAd(nativeAd: nativeAssers)
                                        self.delegate?.customEventNativeAd(self, didReceive: mediatedAd)
            return nil
        }) { (error) in
            self.delegate?.customEventNativeAd(self, didFailToLoadWithError: error)
        }

    }

    func handlesUserClicks() -> Bool {
        return false
    }

    func handlesUserImpressions() -> Bool {
        return false
    }

}
