//
//  CSAlerts.swift
//  CSUtils
//
//  Created by Chrystian on 12/04/2018.
//

import Foundation

class CSAlerts {
    
    let locale = CSLocalizations()
    
     func buildAlert(title: String?, mensage: String, alertButtons: [AlertButtonEnum], completion: @escaping (_ :Void?)->Void?)  -> UIAlertController {
        let alertBox = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        for itens in alertButtons {
            switch itens {
            case .OK:
                let action = UIAlertAction(title: locale.setLocalizableText("OK"), style: .default) { (_) in
                    completion(nil)
                }
                alertBox.addAction(action)
            case .CANCEL:
                let action = UIAlertAction(title: locale.setLocalizableText("CANCEL"), style: .cancel) { (_) in }
                alertBox.addAction(action)
            case .DISMISS:
                let action = UIAlertAction(title: locale.setLocalizableText("DISMISS"), style: .cancel) { (_) in }
                alertBox.addAction(action)
            }
        }
        return alertBox
    }
}
