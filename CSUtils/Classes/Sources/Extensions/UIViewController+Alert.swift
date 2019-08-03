//
//  UIViewController+Alert.swift
//  CSUtils
//
//  Created by Chrystian Salgado on 03/08/19.
//

import Foundation

public extension UIViewController {
    
    enum AlertDefaultActions: String {
        case ok = "OK"
        case dismiss = "DISMISS"
    }
    
    /// Display UIAlertView, with message and title.
    func showDetaultAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, type: UIAlertController.Style, button: AlertDefaultActions) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: type)
        alert.addAction(UIAlertAction(title: button.rawValue, style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
