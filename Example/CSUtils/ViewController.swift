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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showSimpleAlert(_ sender: Any) {
        let alert = CSUtils.showAlertController("Alerta de Teste", mensage: "Teste, teste, teste", alertButtons: [.DISMISS], completion: { (_) -> Void? in return })
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func showCustomWebView(_ sender: Any) {
        
    }
}

