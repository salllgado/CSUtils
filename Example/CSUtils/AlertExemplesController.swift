//
//  AlertExemplesController.swift
//  CSUtils_Example
//
//  Created by Chrystian on 14/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CSUtils

class AlertExemplesController: UIViewController {
    
    var alertTitle: String!
    var alertMensage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertTitle = CSUtils.getLocalizableString("TITULO_ALERTA_TESTE")
        alertMensage = CSUtils.getLocalizableString("MENSAGEM_ALERTA_TESTE")
    }

    @IBAction func simpleAlertView(_ sender: Any) {
        let alert = CSUtils.showAlertController(alertTitle, mensage: alertMensage, alertButtons: [.DISMISS], completion: { (_) -> Void? in return })
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func simpleAlertWithAction(_ sender: Any) {
        let alert = CSUtils.showAlertController(alertTitle, mensage: alertMensage, alertButtons: [.CANCEL, .OK], UIColor.red) {_ in
            let alertBefore = CSUtils.showAlertController(self.alertTitle, mensage: self.alertMensage, alertButtons: [.DISMISS], completion: { (_) -> Void? in return })
            self.present(alertBefore, animated: true, completion: nil)
            return nil
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func alertViewWithFields(_ sender: Any) {
        let alert = CSUtils.showAlertControllerForLogin(alertTitle, mensage: alertMensage, alertButtons: [.CANCEL, .OK]) { (text) -> Void? in
            var mensage: String!
            if let text = text {
                for actualText in text {
                    if mensage != nil {
                        mensage = mensage + "\n\(actualText)"
                    }
                    else {
                        mensage = actualText
                    }
                }
                let alertBefore = CSUtils.showAlertController(nil, mensage: mensage, alertButtons: [.DISMISS], completion: { (_) -> Void? in return })
                self.present(alertBefore, animated: true, completion: nil)
            }
            return nil
        }
        present(alert, animated: true, completion: nil)
    }
}
