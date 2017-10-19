//
//  GoogleMobileAdsInterstitialViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 06.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import GoogleMobileAds

class GoogleMobileAdsInterstitialViewController: UIViewController, GADInterstitialDelegate {

    private var interstitial: GADInterstitial!

    // This is a test ad unit that will return test ads for every request.
    private let adUnitId = "ca-app-pub-4028010822193978/2540504840"

    override func viewDidLoad() {
        super.viewDidLoad()

        interstitial = GADInterstitial(adUnitID: adUnitId)
        interstitial.delegate = self

        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        interstitial.load(request)
    }

    // MARK: - GADInterstitialDelegate

    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        ad.present(fromRootViewController: self)
    }

}
