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
    
    @IBOutlet weak var webViewView: WebViewView!
    @IBOutlet weak var lcWebViewTopToView: NSLayoutConstraint!
    @IBOutlet weak var styleButtonExemple: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var webViewIsShowed: Bool = false
    
    private lazy var toastView = {
        return ToastView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change navbarStyle
        CSUtils.setNavBarStyle(navigationBar, barColor: UIColor.red, tintColor: UIColor.black)
    }
    
    private func setStatusBarStyle(_ style: UIStatusBarStyle, backgroundColor: UIColor) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = backgroundColor
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
    
    private func handlerWebView() {
        lcWebViewTopToView.constant = webViewIsShowed ? 0 : (webViewView.bounds.height * -1)
        webViewIsShowed = !webViewIsShowed
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    
    /// Change uibutton style.
    @IBAction func showStylesView(_ sender: Any) {
        var arrayOfButtons: [UIButton] = []
        arrayOfButtons.append(styleButtonExemple)
        CSUtils.setButtonStyle(arrayOfButtons, textColor: UIColor.yellow, backgoundColor: UIColor.black, borderColor: UIColor.yellow, rounded: 10)
    }
    
    // Display custom toast view like android.
    @IBAction func actionShowToastView(_ sender: Any) {
        self.toastView.configure(message: "ToastView Text")
        
        self.showToastView(for: 4, completion: { (_) in
            self.removeToastView()
        })
    }
    
    /// Change status bar color.
    @IBAction func actionChangeStatusBarColor(_ sender: Any) {
        self.setStatusBarStyle(.lightContent, backgroundColor: .black)
    }
    
    @IBAction func actionShowWebView(_ sender: Any) {
        handlerWebView()
        webViewView.customDismissImage = UIImage(named: "ic_dismiss", in: Bundle.main, compatibleWith: nil)
        webViewView.customWebSite = "https://facebook.com"
        webViewView.callbackActionDismiss = {
            self.handlerWebView()
        }
    }
    
    @IBAction func actionShowQRCodeView(_ sender: Any) {
        let storyboard = UIStoryboard(name: "QRCode", bundle: Bundle(for: QRCodeViewController.classForCoder()))
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = navigationController.viewControllers.first as! QRCodeViewController
        
        controller.navigationBarColor = .black
        controller.navigationBarItemColor = .yellow
        controller.callbackError = { errorMessage in
            self.dismiss(animated: true, completion: nil)
            let alert = CSAlerts().buildAlert(title: "Erro", mensage: errorMessage, alertButtons: [.DISMISS], completion: {
                // ...
            })
            self.present(alert, animated: true, completion: nil)
        }
        
        controller.callbackResult = { resultText in
            self.dismiss(animated: true, completion: nil)
            let alert = CSAlerts().buildAlert(title: "Erro", mensage: resultText, alertButtons: [.DISMISS], completion: {
                // ...
            })
            self.present(alert, animated: true, completion: nil)
        }
        self.present(navigationController, animated: true, completion: nil)
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
