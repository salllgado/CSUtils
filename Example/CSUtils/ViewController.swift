//
//  ViewController.swift
//  CSUtils
//
//  Created by Chrystian Salgado on 03/28/2018.
//  Copyright (c) 2018 Chrystian Salgado. All rights reserved.
//

import UIKit
import Pods_CSUtils_Example

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showSimpleAlert(_ sender: Any) {
        let alert = CSAlerts().showAlertController()
    }
    
    @IBAction func showCustomWebView(_ sender: Any) {
        
    }
}

