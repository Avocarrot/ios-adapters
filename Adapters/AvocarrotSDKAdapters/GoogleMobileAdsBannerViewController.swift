//
//  GoogleMobileAdsBannerViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 06.06.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import GoogleMobileAds

class GoogleMobileAdsBannerViewController: UIViewController, GADBannerViewDelegate {

  @IBOutlet weak var bannerView: GADBannerView!

    // This is a test ad unit that will return test ads for every request.
    private let adUnitId = "ca-app-pub-4028010822193978/1063771648"

    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView.adUnitID = adUnitId
        bannerView.rootViewController = self
        bannerView.delegate = self

        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        bannerView.load(request)
    }

    // MARK: - GADBannerViewDelegate

    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Error:  \(error.localizedDescription)")
    }

}
