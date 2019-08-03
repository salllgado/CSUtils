//
//  CSAlerts.swift
//  Pods-CSUtils_Example
//
//  Created by Chrystian Salgado on 28/03/2018.
//

import Foundation

open class CSUtils {
    
    init (){}
    
    open class func getLocalizableString(_ LocalizableString: String) -> String {
        let localizations = CSLocalizations()
        return localizations.setLocalizableText(LocalizableString)
    }
}

extension CSUtils {
    open class func setButtonStyle(_ buttons: [UIButton], textColor: UIColor? = nil, backgoundColor: UIColor? = nil, borderColor: UIColor? = nil, rounded: Int? = nil) {
        CSStyles().setButtonStyle(buttons, textColor: textColor, backgoundColor: backgoundColor, borderColor: borderColor, rounded: rounded)
    }
    
    open class func setLabelStyle(_ labels: [UILabel], textColor: UIColor? = nil, alignment: NSTextAlignment? = nil) {
        CSStyles().setLabelStyle(labels, textColor: textColor, alignment: alignment)
    }
    
    open class func setViewStyle(_ view: UIView, cornerRadius: Int?, borderColor: UIColor?, borderWidth: Int?, backgroundColor: UIColor?) {
        CSStyles().setViewStyle(view, cornerRadius: cornerRadius, borderColor: borderColor, borderWidth: borderWidth, backgroundColor: backgroundColor)
    }
    
    open class func setNavBarStyle(_ navigationBar: UINavigationBar, barColor: UIColor?, tintColor: UIColor?) {
        CSStyles().setNavBarStyle(navigationBar, barColor: barColor, tintColor: tintColor)
    }
}
