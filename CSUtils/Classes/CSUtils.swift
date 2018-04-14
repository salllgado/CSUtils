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
    open class func showAlertController(_ alertTitle: String?, mensage: String, alertButtons: [AlertButtonEnum], completion: @escaping (_ :Void?)->Void?)  -> UIAlertController {
        let alerts = CSAlerts()
        let alertController = alerts.buildAlert(title: alertTitle, mensage: mensage, alertButtons: alertButtons, completion: completion)
        return alertController
    }
}
