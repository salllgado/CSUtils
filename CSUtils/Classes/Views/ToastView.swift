//
//  ToastView.swift
//  CSUtils
//
//  Created by Chrystian on 19/10/18.
//

import UIKit

open class ToastView: UIView {

    @IBOutlet var lbMessage: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: self.classForCoder)
        bundle.loadNibNamed("ToastView", owner: self, options: nil)
    }
    
//    open func configure(message: String?) {
//        if let message = message {
//            lbMessage.text = message
//        }
//
//        self.alpha = 0
//        self.isHidden = true
//    }
//
//    open func showToastView(for seconds: TimeInterval, completion: ((Bool)->Void)?) {
//
//        self.layer.cornerRadius = (self.frame.height / 2)
//        self.alpha = 0.6
//
//
//
//        UIView.animate(withDuration: seconds, animations: {
//            self.alpha = 0.0
//        }, completion: completion)
//    }
//
//    open func removeToastView() {
//        self.removeFromSuperview()
//    }
}
