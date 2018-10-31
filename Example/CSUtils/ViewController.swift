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
    
    private lazy var toastView = {
        return ToastView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CSUtils.setNavBarStyle(navigationBar, barColor: UIColor.red, tintColor: UIColor.black)
    }
    
    @IBAction func showStylesView(_ sender: Any) {
        var arrayOfButtons: [UIButton] = []
        arrayOfButtons.append(styleButtonExemple)
        CSUtils.setButtonStyle(arrayOfButtons, textColor: UIColor.yellow, backgoundColor: UIColor.black, borderColor: UIColor.yellow, rounded: 10)
    }
    
    
    @IBAction func actionShowToastView(_ sender: Any) {
        self.toastView.configure(message: "TEXTO TEXTO TEXTO")
        
        self.showToastView(for: 4, completion: { (_) in
            self.removeToastView()
        })
    }
}

extension ViewController {
    
    fileprivate func showToastView(for seconds: TimeInterval, completion: ((Bool)->Void)?) {
        guard let window = self.view.window else {
            return
        }
        
        toastView.layer.cornerRadius = (toastView.frame.height / 2)
        toastView.alpha = 0.6
        
        let bottomPadding = (tabBarController?.tabBar.frame.height ?? 0) + 180
        
        toastView.translatesAutoresizingMaskIntoConstraints = false
        self.view.window?.addSubview(self.toastView)
        self.view.window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[toastView]-\(bottomPadding)-|", options: .alignAllCenterX, metrics: nil, views: ["toastView": toastView]))
        
        // https://stackoverflow.com/a/19855224/5660157
        toastView.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        
        UIView.animate(withDuration: seconds, animations: {
            self.toastView.alpha = 0.0
        }, completion: completion)
    }
    
    fileprivate func removeToastView() {
        toastView.removeFromSuperview()
    }
}

