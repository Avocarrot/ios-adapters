//
//  MoPubInterstitialViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 03.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import MoPub

class MoPubInterstitialViewController: UIViewController, MPInterstitialAdControllerDelegate {

    private let mpInterstitial: MPInterstitialAdController = MPInterstitialAdController(forAdUnitId: "8eeb205df2c74608a48074f4fcc041dd")

    override func viewDidLoad() {
        super.viewDidLoad()

        mpInterstitial.delegate = self
        mpInterstitial.loadAd()
    }

    // MARK: - MPInterstitialAdControllerDelegate

    func interstitialDidLoadAd(_ interstitial: MPInterstitialAdController!) {
        interstitial.show(from: self)
    }

}
