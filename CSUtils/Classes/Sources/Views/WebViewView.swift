//
//  WebViewView.swift
//  CSUtils
//
//  Created by Chrystian Salgado on 09/03/19.
//

import UIKit

open class WebViewView: UIView, NibBounded {
    
    @IBOutlet weak var wkWebView: UIWebView!
    @IBOutlet weak var lbWebsiteTitle: UILabel!
    @IBOutlet weak var btnDismiss: UIButton!
    
    public var callbackActionDismiss: (()->Void)?
    public var customDismissImage: UIImage? {
        didSet {
            guard let _customDismissImage = customDismissImage else { return }
            btnDismiss.setTitle("", for: .normal)
            btnDismiss.setImage(_customDismissImage, for: .normal)
        }
    }
    public var customWebSite: String = "https://www.google.com" {
        didSet {
            loadWebsite()
        }
    }
    public var viewCornerRadius: CGFloat = 10 {
        didSet {
            self.layer.cornerRadius = viewCornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(hugsContent: true)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView(hugsContent: true)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        createWebView()
    }
    
    private func createWebView() {
        self.layer.cornerRadius = viewCornerRadius
        if let customImage = customDismissImage {
            btnDismiss.setImage(customImage, for: .normal)
            btnDismiss.setTitle("", for: .normal)
        }
        else {
            btnDismiss.setTitle(NSLocalizedString("DISMISS_WEBVIEW_BUTTON", comment: ""), for: .normal)
        }
        
        loadWebsite()
    }
    
    private func loadWebsite() {
        guard let url = URL(string: customWebSite) else { return }
        wkWebView.loadRequest(URLRequest(url: url))
        self.lbWebsiteTitle.text = customWebSite
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        callbackActionDismiss?()
    }
}
