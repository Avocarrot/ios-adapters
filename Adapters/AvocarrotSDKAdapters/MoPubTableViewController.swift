//
//  MoPubTableViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 15/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import Foundation
import UIKit
import AvocarrotNativeAssets
import MoPub

class MoPubTableViewController: UITableViewController {

	private var sampleData = [SampleModel]()
	private var placer: MPTableViewAdPlacer!

	override func viewDidLoad() {
		super.viewDidLoad()
		loadSampleAds()

		let staticSettings = MPStaticNativeAdRendererSettings()
		staticSettings.renderingViewClass = NativeAdCell.self
		staticSettings.viewSizeHandler = { (maxWidth: CGFloat) -> CGSize in
			return CGSize(width: maxWidth, height: 110)
		}
		let staticConfiguration = MPStaticNativeAdRenderer.rendererConfiguration(with: staticSettings)
		staticConfiguration!.supportedCustomEvents = ["AvocarrotMoPubNativeCustomEvent"]

		// Setup the ad placer.
		placer = MPTableViewAdPlacer(tableView: tableView, viewController: self, rendererConfigurations: [staticConfiguration!])

		// Add targeting parameters.
		let targeting = MPNativeAdRequestTargeting()
		targeting.desiredAssets = Set([kAdIconImageKey, kAdMainImageKey, kAdCTATextKey, kAdTextKey, kAdTitleKey])

		// Begin loading ads and placing them into your feed, using the ad unit ID.
		placer.loadAds(forAdUnitID: "3e2f8df7104b425a97c03d0153c1fb9d")
	}

	func loadSampleAds() {
		for index in 1...10 {
			sampleData += [SampleModel(title: "Sample title \(index)",
                text: "sample description \(index)",
                imageUrl: "https://lorempixel.com/160/160/people/\(index)/")]
		}

	}

	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sampleData.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.mp_dequeueReusableCell(withIdentifier: "SampleTableCell", for: indexPath) as! UITableViewCell

		if let sampleCell = cell as? SampleTableCell {
			let sampleModel = sampleData[indexPath.row]
			sampleCell.loadWithSampleModel(sampleModel)
		}

		return cell
	}

}
