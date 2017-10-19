//
//  SampleModel.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 15/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

import Foundation
class SampleModel {
	let title: String
	let text: String
	let imageUrl: String

	init(title: String, text: String, imageUrl: String) {
		self.text = text
		self.title = title
		self.imageUrl = imageUrl
	}

	func getText() -> String {
		return text
	}

	func getTitle() -> String {
		return title
	}

	func getImageUrl() -> String {
		return imageUrl
	}
}
