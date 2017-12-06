//
//  DFPInterstitialViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 24.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import GoogleMobileAds

class DFPInterstitialViewController: UIViewController, GADInterstitialDelegate {
    
    private var interstitial: GADInterstitial!
    
    // This is a test ad unit that will return test ads for every request.
    private let adUnitId = "/5826056/MORFIX_IPHONE_SPLASH_TEST"
    
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

