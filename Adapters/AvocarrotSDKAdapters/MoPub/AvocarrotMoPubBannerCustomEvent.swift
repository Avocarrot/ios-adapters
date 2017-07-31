//
//  AvocarrotMoPubBannerCustomEvent.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 03.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import MoPub
import AvocarrotBanner

@objc(AvocarrotMoPubBannerCustomEvent)
class AvocarrotMoPubBannerCustomEvent: MPBannerCustomEvent {

    private var banner: AVOBannerView?

    override func requestAd(with size: CGSize,
                            customEventInfo info: [AnyHashable : Any]!) {
        if CGSize(width: 320, height: 50) != size && CGSize(width: 728, height: 90) != size {
            requestDidFail()
            return
        }

        var avosize = AVOBannerViewSizeSmall
        if CGSize(width: 728, height: 90) == size {
            avosize = AVOBannerViewSizeLarge
        }

        guard let adUnitId = info["adUnit"] else {
            requestDidFail()
            return
        }

        AvocarrotSDK.shared.loadBanner(with: avosize,
                                       adUnitId: adUnitId as! String,
                                       success: {  [weak self] (banner) in
                                        self?.banner = self?.preparedBannerWithCallbacksFor(banner: banner)
                                        guard let bnr = self?.banner else {
                                            self?.requestDidFail()
                                            return
                                        }
                                        if let delegate = self?.delegate {
                                            delegate.bannerCustomEvent(self, didLoadAd: bnr)
                                        }
        }) { [weak self]  (error) in
            if let delegate = self?.delegate {
                delegate.bannerCustomEvent(self, didFailToLoadAdWithError: error)
            }
        }
    }


    private func preparedBannerWithCallbacksFor(banner: AVOBannerView?) -> AVOBannerView? {
        guard let bnr = banner else {
            return nil
        }
        bnr.autoUpdate = false
        bnr.onClick { [weak self] in
            if let delegate = self?.delegate {
                delegate.bannerCustomEventWillLeaveApplication(self)
            }
        }

        return bnr
    }

    
    private func requestDidFail() {
        let error = NSError(domain: "com.mopub.CustomEvent", code: 901)
        if let delegate = self.delegate {
            delegate.bannerCustomEvent(self, didFailToLoadAdWithError: error)
        }
    }

}
