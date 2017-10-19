//
//  AvocarrotAdMobMediatedNativeContentAd.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 15/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotNativeAssets
import GoogleMobileAds

@objc(AvocarrotAdMobMediatedNativeContentAd)
open class AvocarrotAdMobMediatedNativeContentAd: NSObject {

    var nativeAd: AVONativeAssets

    public init(nativeAd: AVONativeAssets) {
        self.nativeAd = nativeAd
    }

}

extension AvocarrotAdMobMediatedNativeContentAd: GADMediatedNativeContentAd {

    public func headline() -> String? {
        return nativeAd.title
    }

    public func body() -> String? {
        return nativeAd.title
    }

    public func images() -> [Any]? {
        var gadImage: GADNativeAdImage?

        if let image = nativeAd.image {
            gadImage = GADNativeAdImage(image: image)
        } else if let imageURL = nativeAd.imageURL {
            gadImage = GADNativeAdImage(url: URL(string: imageURL)!, scale: 1)
        }
        return gadImage != nil ? [gadImage!] : nil
    }

    public func logo() -> GADNativeAdImage? {
        var gadImage: GADNativeAdImage?

        if let image = nativeAd.icon {
            gadImage = GADNativeAdImage(image: image)
        } else if let imageURL = nativeAd.iconURL {
            gadImage = GADNativeAdImage(url: URL(string: imageURL)!, scale: 1)
        }
        return gadImage != nil ? gadImage : nil
    }

    public func callToAction() -> String? {
        return nativeAd.callToActionTitle
    }

    public func advertiser() -> String? {
        return nativeAd.sponsored
    }

    public func extraAssets() -> [AnyHashable : Any]? {
        return nil
    }

    public func mediatedNativeAdDelegate() -> GADMediatedNativeAdDelegate? {
        return self
    }

}

extension AvocarrotAdMobMediatedNativeContentAd: GADMediatedNativeAdDelegate {
    public func mediatedNativeAd(_ mediatedNativeAd: GADMediatedNativeAd, didRenderIn view: UIView, viewController: UIViewController) {
        nativeAd.registerView(forInteraction: view, forClickableSubviews: nil)
    }

}
