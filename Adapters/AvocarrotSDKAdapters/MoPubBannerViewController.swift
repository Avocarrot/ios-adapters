//
//  MoPubBannerViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 03.07.17.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import MoPub

class MoPubBannerViewController: UIViewController, MPAdViewDelegate {

    @IBOutlet weak var bannerView: UIView!

    private let mpBanner = MPAdView(adUnitId: "284ac577607046c5b5609ec90d04af16", size: CGSize(width: 320, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()

        mpBanner?.delegate = self
        mpBanner?.loadAd()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mpBanner?.startAutomaticallyRefreshingContents()
    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mpBanner?.stopAutomaticallyRefreshingContents()
    }

    // MARK: - MPAdViewDelegate

    func adViewDidLoadAd(_ view: MPAdView!) {
        for subview in bannerView.subviews {
            subview.removeFromSuperview()
        }

        bannerView.addSubview(view)
    }

    func viewControllerForPresentingModalView() -> UIViewController! {
        return self
    }

}
