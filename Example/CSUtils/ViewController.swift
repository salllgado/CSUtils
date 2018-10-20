//
//  ViewController.swift
//  CSUtils
//
//  Created by Chrystian Salgado on 03/28/2018.
//  Copyright (c) 2018 Chrystian Salgado. All rights reserved.
//

import UIKit
import CSUtils

class ViewController: UIViewController {
    
    @IBOutlet weak var styleButtonExemple: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CSUtils.setNavBarStyle(navigationBar, barColor: UIColor.red, tintColor: UIColor.black)
    }
    
    @IBAction func showCustomWebView(_ sender: Any) {
        let customToastView = ToastView()
    }
    
    
    @IBAction func showStylesView(_ sender: Any) {
        var arrayOfButtons: [UIButton] = []
        arrayOfButtons.append(styleButtonExemple)
        CSUtils.setButtonStyle(arrayOfButtons, textColor: UIColor.yellow, backgoundColor: UIColor.black, borderColor: UIColor.yellow, rounded: 10)
    }
}

