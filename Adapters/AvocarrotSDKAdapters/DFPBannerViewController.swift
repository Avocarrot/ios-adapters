//
//  DFPBannerViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 24.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import GoogleMobileAds

class DFPBannerViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    // This is a test ad unit that will return test ads for every request.
    private let adUnitId = "/5826056/MORFIX_IPHONE_320x50_TEST"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = self
        bannerView.delegate = self
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        bannerView.load(request)
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bannerView.isAutoloadEnabled = true
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        bannerView.isAutoloadEnabled = false
    }
    
    // MARK: - GADBannerViewDelegate
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Error:  \(error.localizedDescription)")
    }
    
}

