//
//  AvocarrotAdMobCustomEventBanner.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 06.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AvocarrotBanner

@objc(AvocarrotAdMobCustomEventBanner)
class AvocarrotAdMobCustomEventBanner: NSObject, GADCustomEventBanner {
    weak var delegate: GADCustomEventBannerDelegate?

    private var bannerAd: AVOBannerView?

    func requestAd(_ adSize: GADAdSize,
                   parameter serverParameter: String?,
                   label serverLabel: String?,
                   request: GADCustomEventRequest) {

        guard let adUnitId = serverParameter else {
            print("AvocarrotAdMobCustomEventBanner - invalid adUnitId")
            return
        }

        if  GADAdSizeEqualToSize(adSize, kGADAdSizeBanner) != true && GADAdSizeEqualToSize(adSize, kGADAdSizeLeaderboard) != true {
            let error = NSError(domain: "com.google.CustomEvent", code: 901)
            self.delegate?.customEventBanner(self, didFailAd: error)
            return
        }

        var size = AVOBannerViewSizeSmall
        if GADAdSizeEqualToSize(adSize, kGADAdSizeLeaderboard) {
            size = AVOBannerViewSizeLarge
        } else if GADAdSizeEqualToSize(adSize, kGADAdSizeMediumRectangle) {
            size = AVOBannerViewSizeMREC
        }

        AvocarrotSDK.shared.loadBanner(with: size, adUnitId: adUnitId, success: { [weak self] (bannerAd) in
            guard let sSelf = self else {return}
            sSelf.subscribeBannerToEvents(banner: bannerAd)
            sSelf.bannerAd = bannerAd
            sSelf.delegate?.customEventBanner(sSelf, didReceiveAd: bannerAd)
        }, failure: { [weak self] (error) in
            guard let sSelf = self else {return}
            sSelf.delegate?.customEventBanner(sSelf, didFailAd: error)
        })
    }


    private func subscribeBannerToEvents(banner: AVOBannerView) {
        banner.onClick { [unowned self] in
            self.delegate?.customEventBannerWasClicked(self)
        }
        banner.autoUpdate = false
    }

}
