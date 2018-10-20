//
//  ToastView.swift
//  CSUtils
//
//  Created by Chrystian on 19/10/18.
//

import UIKit

open class ToastView: UIView {

    @IBOutlet var lbMessage: UILabel!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(message: String?) {
        if let message = message {
            lbMessage.text = message
        }
        
        self.alpha = 0
        self.isHidden = true
    }
    
    fileprivate func showToastView(for seconds: TimeInterval, in viewController: UIViewController, completion: ((Bool)->Void)?) {
        guard let window = viewController.view.window else {
            return
        }
        
        self.layer.cornerRadius = (self.frame.height / 2)
        self.alpha = 0.6
        
        self.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.window?.addSubview(self)
        viewController.view.window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[toastView]-32-|", options: .alignAllCenterX, metrics: nil, views: ["toastView": self]))
        
        // https://stackoverflow.com/a/19855224/5660157
        self.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        
        UIView.animate(withDuration: seconds, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    open func removeToastView() {
        self.removeFromSuperview()
    }
}
