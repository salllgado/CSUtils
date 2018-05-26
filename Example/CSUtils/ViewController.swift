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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showCustomWebView(_ sender: Any) {
//        CSUtils.
    }
    
    
    @IBAction func showStylesView(_ sender: Any) {
        var arrayOfButtons: [UIButton] = []
        arrayOfButtons.append(styleButtonExemple)
        CSUtils.setButtonStyle(arrayOfButtons, textColor: UIColor.yellow, backgoundColor: UIColor.black, borderColor: UIColor.yellow, rounded: 10)
    }
}

