//
//  CSAlerts.swift
//  CSUtils
//
//  Created by Chrystian on 12/04/2018.
//

import Foundation

class CSAlerts {
    
     func buildAlert(title: String?, mensage: String, alertButtons: [AlertButtonEnum], completion: @escaping (_ :Void?)->Void?)  -> UIAlertController{
        let alertBox = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        for itens in alertButtons {
            switch itens {
            case .OK:
                let action = UIAlertAction(title: setLocalizableText("OK"), style: .default) { (_) in
                    completion(nil)
                }
                alertBox.addAction(action)
            case .CANCEL:
                let action = UIAlertAction(title: setLocalizableText("CANCEL"), style: .cancel) { (_) in }
                alertBox.addAction(action)
            case .DISMISS:
                let action = UIAlertAction(title: setLocalizableText("DISMISS"), style: .cancel) { (_) in }
                alertBox.addAction(action)
            }
        }
        return alertBox
    }
    
    /*
     - Seta uma localização definida por string
     - Parameter: String
     - Return: NSLocalizedString
     */
     func setLocalizableText(_ text: String) -> String {
        return NSLocalizedString(text, comment: "")
    }
    
     func haveEmptyFields(_ fields: [UITextField]) -> Bool {
        var emptyField: Bool!
        for field in fields {
            if let text = field.text {
                if text.isEmpty || text == " " {
                    emptyField = true
                }
            }
        }
        return emptyField == true ? emptyField : false
    }
}
