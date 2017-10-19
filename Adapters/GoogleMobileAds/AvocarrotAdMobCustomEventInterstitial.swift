//
//  AvocarrotAdMobCustomEventInterstitial.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 06.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AvocarrotInterstitial

@objc(AvocarrotAdMobCustomEventInterstitial)
class AvocarrotAdMobCustomEventInterstitial: NSObject, GADCustomEventInterstitial {
    weak var delegate: GADCustomEventInterstitialDelegate?

    private var interstitial: AVOInterstitial?

    func requestAd(withParameter serverParameter: String?,
                   label serverLabel: String?,
                   request: GADCustomEventRequest) {
        guard let adUnitId = serverParameter else {
            print("AvocarrotAdMobCustomEventInterstitial - invalid adUnitId")
            return
        }

        AvocarrotSDK.shared.loadInterstitial(withAdUnitId: adUnitId, success: { [weak self] (interstitial) in
            guard let sSelf = self else {return}
            sSelf.interstitial = interstitial
            sSelf.delegate?.customEventInterstitialDidReceiveAd(sSelf)
            sSelf.subscribeInterstitilToEvents(interstitial: interstitial)
        }) { [weak self] (error) in
            guard let sSelf = self else {return}
            sSelf.delegate?.customEventInterstitial(sSelf, didFailAd: error)
        }
    }

    func present(fromRootViewController rootViewController: UIViewController) {
        if interstitial?.ready ?? false {
            interstitial?.show(from: rootViewController)
        }
    }

    private func subscribeInterstitilToEvents(interstitial: AVOInterstitial) {
        interstitial.onClick { [weak self] in
                guard let sSelf = self else {return}
                sSelf.delegate?.customEventInterstitialWillLeaveApplication(sSelf)
            }.onWillShow { [weak self] in
                guard let sSelf = self else {return}
                sSelf.delegate?.customEventInterstitialWillPresent(sSelf)
            }.onWillHide { [weak self] in
                guard let sSelf = self else {return}
                sSelf.delegate?.customEventInterstitialWillDismiss(sSelf)
            }.onDidHide { [weak self] in
                guard let sSelf = self else {return}
                sSelf.delegate?.customEventInterstitialDidDismiss(sSelf)
        }
    }

}
