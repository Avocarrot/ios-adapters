//
//  DFPViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 24.11.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import GoogleMobileAds
import UIKit

class DFPNativeViewController: UIViewController, GADNativeExpressAdViewDelegate, GADVideoControllerDelegate {
    
    // This is a test ad unit that will return test ads for every request.
    private let adUnitId = "ca-app-pub-4028010822193978/5564473644"
    
    @IBOutlet weak var nativeExpressAdView: GADNativeExpressAdView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nativeExpressAdView.adUnitID = adUnitId
        nativeExpressAdView.rootViewController = self
        nativeExpressAdView.delegate = self
        
        // The video options object can be used to control the initial mute state of video assets.
        // By default, they start muted.
        let videoOptions = GADVideoOptions()
        videoOptions.startMuted = true
        nativeExpressAdView.setAdOptions([videoOptions])
        
        // Set this UIViewController as the video controller delegate, so it will be notified of events
        // in the video lifecycle.
        nativeExpressAdView.videoController.delegate = self
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        nativeExpressAdView.load(request)
    }
    
    // MARK: - GADNativeExpressAdViewDelegate
    
    func nativeExpressAdViewDidReceiveAd(_ nativeExpressAdView: GADNativeExpressAdView) {
        if nativeExpressAdView.videoController.hasVideoContent() {
            print("Received an ad with a video asset.")
        } else {
            print("Received an ad without a video asset.")
        }
    }
    
    func nativeExpressAdView(_ nativeExpressAdView: GADNativeExpressAdView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Error: \(error.localizedDescription)")
    }
    
    // MARK: - GADVideoControllerDelegate
    
    func videoControllerDidEndVideoPlayback(_ videoController: GADVideoController) {
        print("The video asset has completed playback.")
    }
}

