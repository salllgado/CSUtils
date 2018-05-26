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
            
            if let borderColor = borderColor {
                button.borderColor = borderColor
            }
            
            if let rounded = rounded {
                button.layer.cornerRadius = CGFloat(rounded)
            }
        }
    }
}
