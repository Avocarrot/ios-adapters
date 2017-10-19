//
//  AppDelegate.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 08/03/2017.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit
import AvocarrotCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AvocarrotSDK.logEnabled = true

        return true
    }

}
