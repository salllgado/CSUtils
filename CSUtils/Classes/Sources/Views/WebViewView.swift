//
//  WebViewView.swift
//  CSUtils
//
//  Created by Chrystian Salgado on 09/03/19.
//

import UIKit
import WebKit

open class WebViewView: UIView, NibBounded {
    
    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var lbWebsiteTitle: UILabel!
    @IBOutlet weak var btnDismiss: UIButton!
    
    public var callbackActionDismiss: (()->Void)?
    public var customDismissImage: UIImage?
    public var customWebSite: String = "https://www.google.com" {
        didSet {
            loadWebsite()
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
        self.layer.cornerRadius = 10
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
        wkWebView!.load(URLRequest(url: url))
        wkWebView!.allowsBackForwardNavigationGestures = true
        self.lbWebsiteTitle.text = wkWebView.url?.absoluteString ?? wkWebView.title
    }
    
    @IBAction func actionDismiss(_ sender: Any) {
        callbackActionDismiss?()
    }
}
