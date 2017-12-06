//
//  ViewController.swift
//  AvocarrotSDKAdapters
//
//  Created by Glispa GmbH on 08/03/2017.
//  Copyright © 2017 Glispa GmbH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupUI() {
        self.navigationController?.navigationBar.tintColor = UIColor(red: 240.0/255, green: 103.0/255, blue: 63.0/255, alpha: 1.0)
    }

}
