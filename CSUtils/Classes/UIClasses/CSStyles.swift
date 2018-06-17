//
//  CSStyles.swift
//  CSUtils
//
//  Created by Chrystian on 26/05/2018.
//

import Foundation

class CSStyles {
    
    func setButtonStyle(_ buttons: [UIButton], textColor: UIColor?, backgoundColor: UIColor?, borderColor: UIColor?, rounded: Int?) {
        for button in buttons {
            if let textColor = textColor {
                button.setTitleColor(textColor, for: .normal)
            }
            
            if let backgoundColor = backgoundColor {
                button.backgroundColor = backgoundColor
            }
            
//            if let borderColor = borderColor {
//                button.borderColor = borderColor
//            }
            
            if let rounded = rounded {
                button.layer.cornerRadius = CGFloat(rounded)
            }
        }
    }
    
    func setLabelStyle(_ labels: [UILabel], textColor: UIColor?, shadowColor: UIColor?, alignment: NSTextAlignment?) {
        for label in labels {
            if let textColor = textColor {
                label.textColor = textColor
            }
            
            if let shadowColor = shadowColor {
                label.shadowColor = shadowColor
            }
            
            if let alignment = alignment {
                label.textAlignment = alignment
            }
        }
    }
    
    func setViewStyle(_ view: UIView, cornerRadius: Int?, borderColor: UIColor?, borderWidth: Int?, backgroundColor: UIColor?) {
//        if let cornerRadius = cornerRadius {
//            view.cornerRadius = CGFloat(cornerRadius)
//        }
//
//        if let borderWidth = borderWidth {
//            view.borderWidth = CGFloat(borderWidth)
//        }
//
//        if let borderColor = borderColor {
//            view.borderColor = borderColor
//        }
//
//        if let backgroundColor = backgroundColor {
//            view.backgroundColor = backgroundColor
//        }
    }
    
    func setNavBarStyle(_ navigationBar: UINavigationBar, barColor: UIColor?, tintColor: UIColor?, navBarBorderColor: UIColor?) {
        if let barColor = barColor {
            navigationBar.barTintColor = barColor
        }
        
        if let tintColor = tintColor {
            navigationBar.tintColor = tintColor
        }
        
//        if let navBarBorderColor = navBarBorderColor {
//            navigationBar.borderColor = navBarBorderColor
//        }
    }
}
