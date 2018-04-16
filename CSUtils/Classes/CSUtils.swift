//
//  CSAlerts.swift
//  Pods-CSUtils_Example
//
//  Created by Chrystian Salgado on 28/03/2018.
//

import Foundation

open class CSUtils {
    
    init (){}

    /*
     - Seta uma localização definida por string
     - Parameter: String
     - Return: NSLocalizedString
     */
    open class func showAlertController(_ alertTitle: String?, mensage: String, alertButtons: [AlertButtonEnum], _ withButtonColor: UIColor? = nil, completion: @escaping (_ :Void?)->Void?)  -> UIAlertController {
        let alerts = CSAlerts()
        let alertController = alerts.buildAlert(title: alertTitle, mensage: mensage, alertButtons: alertButtons, completion: completion)
        return alertController
    }
    
    open class func showAlertControllerForLogin(_ title: String?, mensage: String, alertButtons: [AlertButtonEnum], _ withButtonColor: UIColor? = nil, completion: @escaping (_ :[String]?)-> Void?)  -> UIAlertController {
        let csalerts = CSAlerts()
        let alertController = csalerts.buildAlertWithTextField(title: title, mensage: mensage, alertButtons: alertButtons, withButtonColor, completion: completion)
        return alertController
    }
    
    open class func showAlertControllerWithFields(_ title: String?, mensage: String, alertButtons: [AlertButtonEnum], _ withButtonColor: UIColor? = nil, numberOfFields: Int,completion: @escaping (_ :[String]?)-> Void?)  -> UIAlertController {
        let csalerts = CSAlerts()
        let alertController = csalerts.buildAlertWithTextField(title: title, mensage: mensage, alertButtons: alertButtons, numberOfFields: numberOfFields, completion: completion)
        return alertController
    }
    
    open class func getLocalizableString(_ LocalizableString: String) -> String {
        let localizations = CSLocalizations()
        return localizations.setLocalizableText(LocalizableString)
    }
}
